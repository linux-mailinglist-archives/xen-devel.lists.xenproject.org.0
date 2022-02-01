Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865C14A620F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 18:15:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263713.456547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwjv-000820-Dl; Tue, 01 Feb 2022 17:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263713.456547; Tue, 01 Feb 2022 17:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEwjv-0007yf-A2; Tue, 01 Feb 2022 17:14:47 +0000
Received: by outflank-mailman (input) for mailman id 263713;
 Tue, 01 Feb 2022 17:14:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bwX=SQ=epam.com=prvs=4031c7af39=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEwjt-0007yW-PS
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 17:14:45 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7253c6f9-8382-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 18:14:43 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 211GWTIt003474;
 Tue, 1 Feb 2022 17:14:38 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dy8fp04v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 17:14:37 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB4998.eurprd03.prod.outlook.com (2603:10a6:20b:89::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Tue, 1 Feb
 2022 17:14:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 17:14:30 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7253c6f9-8382-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9XaRvIbcC7VQbGOl0r5Wwad7pigIW8k5L47m0m6eDTxr5j2HgvKifCX1uY+e7D5LMdK7l10pyJO0fEgk3JSkS/JxJWj0QTqTvGr9ryrK/AgkmTu5UX7Tz4xKVJqJexkZxitmITVME8972xpqJGWDlcBNI911hVXLnjcjC43a9630cIhSDML+vIM2YcE68a9o3nOV5JLwacepcdzg0GqL15If1C3cLgOq+zCkGITI8H79B8WmROnTQVFffk3fzwxt4EEviImaYZNuCgXQbQHSObWAtJQiRkk9jXDJBcNdNLZbTMvzrxH2DBgwQA2uPTZmU2rk8a4DROiVpBb5QVzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Us5HEAmlWkR70pK/al8eyk7Pe98hkqDx0KlSN2CRxg=;
 b=KS9jGNRsmIJ0LXWLR69d6FK8Cl/BPb7vmT8LaJEaN+V5kAmS0rSO3Nf1Z7L3a8bezEBkyToKfrUbwQirR9HNnLzGE1ELd++Jjc30dQAIsboBgv2waw93jvGvB91kMgB8irgsi4PCl9YWt8rnveZpZphYn4qBH/5OAwB8Ge4lu3Hnjt9bjjFAJ42w/wc3M8rewD+QZDPBZk6gkI+M7pYGzmUEd/BoP3vFR3yGPOT5zmBGWOTHh+YnMNHNrBjVN8K9fmmGnaES95vySQGSN/uv8AU7uy6kTpTqPtT/P2Xj91ga7PJUuyIz5QYq0IrZm+/6V7w3YD4OypO8zR1s0JzyXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Us5HEAmlWkR70pK/al8eyk7Pe98hkqDx0KlSN2CRxg=;
 b=FR67sxL2wKFjvAikKslWjOsotzWS3CiiOl4Vb4FMY9wBI7wsqVcFf26fIzvwn80qbgFTsLm3CGS3VLHevn+GY7fg39zdmwBzK78wlHSCB5R0oovuk5XZWZKFnmStyuFfcWZmRhiV5P9W+EPHK7s4QGfzcSXbAG/dp11X2HC1tOLL6trjfPngCT3fiYBS1zLJMe8YIJw9NLN6H4CdClqOaNRMl5NsztsOu+DVKVurNwLZmRG2nKPIND2ySG3VSe+Gr40pMEAfVJMpVNNG1nEZbznoSHoeOAFLJmL8+CJ3QOeYGStjI+TB0UX45CtjrKqrzGdFylajP/Tm11ccf8yRmw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 2/4] rangeset: add rangeset_reset helper function
Thread-Topic: [PATCH 2/4] rangeset: add rangeset_reset helper function
Thread-Index: AQHYF4hPV7SJ+mLtNUi4YvDbTFD9Qqx+7KUAgAACoYA=
Date: Tue, 1 Feb 2022 17:14:30 +0000
Message-ID: <ef8b93f8-5333-fc84-ac0a-8197d084f99b@epam.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-3-andr2000@gmail.com>
 <bb5010df-5e5b-9de1-7ad8-1ba5e8e37edc@xen.org>
In-Reply-To: <bb5010df-5e5b-9de1-7ad8-1ba5e8e37edc@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9253464f-4e0a-4e3f-2f98-08d9e5a64f3e
x-ms-traffictypediagnostic: AM6PR03MB4998:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB4998915F3E75AAB0F1356B16E7269@AM6PR03MB4998.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QVjZs792+JABqdIsJARciGAyz5u5V7U7M1UTwPaR2c93hTtclyuWnda2KZJ0Mc8jY55Dty6Ip/3soFUHoUJu2XRjr/owiBPzjxMcFhojmV1OPUN6Es5dLAFDLQRoD0c+pT2COkX+rmFDgprWB/iiSMT0n2UHQgXT0I/YGUVFpJUal0KqGVrEUy5Ik9rNVl6673dJCVVtUgngpkUCiBgoyG2GmknAgItJSNdUV0GqbZOxygO/5XggJwKmGuufYMPMxh9/ka9qCDHSPqut/r9An4Gw2EBn9zXbERKWnd52MLUJw3jxf/EPWy43xXdgJaz2LxeDVFSlq/4jqxFzNUkPD6HcwiX8SiWvHZ9JNX8uIr4+CiYJ37RVk/TFGjo2ILDDADf7UaTvgXTdZjVxld4AlaUGRlsWC6r82d2Cv3kPAW3PqRJ0x1KIJKyb7+B3WxhBtqN7PQAJutTmNCl8sxQypvWOwIfNUhEsEX2BifaXR+xJoWGBJmfpPYUNOD+K1/I8u92vc7cdBll69qjBUNMmFpYY/sIoZX0gSvdJ5FMUMCgq02MTdwcXcYXZf6gSFhB/WEX/9W8JXQthKP2ItKvFkhRau2yA8/W+4iHsxaHYMZinbxHzxN7lQ2H7vyzto+8onqQ85Uh1r4avRAS3pZsvDjMajrb6u+bPmXVrS47t6wfO5XJo/juH/KZjsPvjKVC/sgVsehcaRAIeX96xixAE0swYHvhgU0SeqIqbWtF+rMSvaL0bud8SXmGS2d1oka99
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(7416002)(8936002)(54906003)(4326008)(38070700005)(76116006)(31696002)(122000001)(66946007)(316002)(66476007)(66556008)(66446008)(64756008)(86362001)(110136005)(5660300002)(91956017)(38100700002)(31686004)(36756003)(508600001)(71200400001)(53546011)(2616005)(107886003)(186003)(26005)(6506007)(6512007)(2906002)(6486002)(83380400001)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dmhNaGZZdEQrT3ZIVXQwNFZiTG9TeE00dmtuaHlndXJQYklkVDdwa0svaW5q?=
 =?utf-8?B?QUNNYTZqclhOZ1dpYTZZaUh3MklPR3Z3UjhtTnhhYk1UaXZja210VTBUVng4?=
 =?utf-8?B?SFUwU1NNMTlIQXQ2QmFVSWpDRXlTZ0JwVkV4eTk3enlDOXh4dXkzYjVRdE9N?=
 =?utf-8?B?MVBhNFB3NmVCTUUwQ1hQR1lBUFZ0aEd6M0UrUnVGMmp0cTZVTzZOTzdreGhs?=
 =?utf-8?B?b3ZUWHlFaTMzOUlzV25lUDBCR01ZbUM2MjlMUlJPTlFUNkVaYnBTZFFabnBn?=
 =?utf-8?B?TkxVNlhaR2FZcEtWZC9tTHFWcTE4L2RORjI0NEcwa2dUS0ZFVEd2TDZjSE9J?=
 =?utf-8?B?SnNhUmxqOTdITnc1alVRRHEzaThpQit6OVZ2QmhpdnVCMGYvMjJjOThuNHpV?=
 =?utf-8?B?b0lUTE43LzI2UWJ1Y1FIdDJLMkdHL3gzWWw4ZDlvQTBYTjFtRW1mekJhbTdB?=
 =?utf-8?B?K2J0VEMvbDgrcnpNOW10Rkt6My8wZS96MWptRTdINTFjY2VxVld0dGM1ZzBM?=
 =?utf-8?B?ZWRFTzRnL1Q1UXh5RVJ1YTZ6VmIwSkNNamlTNUVRNjVrNWZzTU9WZHJUZWgv?=
 =?utf-8?B?Q2o3WGNZR0g3aVc5RnZIaWhKbXJKS1lpalJKTTVjUzlidUJLdm9ITzA3MzJx?=
 =?utf-8?B?NEFHcjFTMnZybldBdDFDV1BRejhJQjhKVTBjRGpaV3o3NFVTcGoyVC9TKzc1?=
 =?utf-8?B?SFJlc2liWlRHcDNJbGNIN3NkaGZDdVBRNXQxRUlrdDVUK0U2QWlFUmJQRHll?=
 =?utf-8?B?eWh5WDJacXRCVnI4YTNNQWxzUW5HYkFMRVFRemFFUGRzQmNuUUtkekVZUXg4?=
 =?utf-8?B?Z04xdTFPb0hnQ0c4WTlrU0hyWHZnNGl3cXdLV0hMQmhWWFlmL25oRkp3V25F?=
 =?utf-8?B?UE54T2Vwa3dXUTEybUs2a1FWUm5Tb3EzbXZFL2ZvMENUbkZhU1pyeDlkemkr?=
 =?utf-8?B?cDMzWm1nVXo2NVR3eCtmakphVHNVbDh0TUlkMHo2Z1g4UUV5V1dkazRuRkd2?=
 =?utf-8?B?Q0pPL2VuYzdjZENZWmZxZU9hQk5qWHkyOWRSVTBSS1ZmSHNrVXlweHlTeDBs?=
 =?utf-8?B?TGJBQnU3dTBhTW5TQ3lJRUhxbGFRclMzZXl1bFMrQ2JXNzZ4QkRQL1lSRi91?=
 =?utf-8?B?Wk56UEt1OW9zdENqT2NZNDkycjhpS2FZUERrRzJ3OXZuaEljdnpCOHpIckND?=
 =?utf-8?B?UkI1ZDhXK1BnamROTGpNU1lXR01Rc2p3dHR6TVBpa3hGd09wdlZ5NVVUb1I5?=
 =?utf-8?B?czZsZHBvai9aYjFlVlVNL09rSVhTOUYyRUxHVGlrRUIvWjYyMzZzYlVWOUls?=
 =?utf-8?B?U01GVUNzVE1TY0hWTTQ3bFAzSkVlZGdkZU9sdDNKN0wyWU9yR244SFVtaUZq?=
 =?utf-8?B?VHVLTTNreVBVdFpXblBNNEZmVEhUaWhSSVFoNFFYRlVlN0gwbkhWQUFKb2VV?=
 =?utf-8?B?YThqK1V1TTRTUWJIL0xBZXIxV0pLejhwRnMxSlFKN2xVcjN5U0N2aWpjaDh5?=
 =?utf-8?B?RVJjNWEzOS91NjdaZjFHM2FNYlBNZ0VPSDVrWW9yZlR0UlRDQU1DclpIanRT?=
 =?utf-8?B?TlE5bEZIY1lmME9NczdnU2l3RzVPVWhnQmVtRW5zT0NjMFljQUxZN2dWV0Ux?=
 =?utf-8?B?a3BmMG1sNjlRd2pyRFlhaHdvN2R6WXdpMzVoL1Erajk0ZDNmNzNVVUVuNnhR?=
 =?utf-8?B?UXVVaGtheGxhZ3BrZ1pBRFNReEZjQjZMZ2ZQWkNPNHZQYm8rV0ExcmhJMWhj?=
 =?utf-8?B?YzdtcE5yVTAyMVN6b3U5azYza2Y1UktBN0wxMmxLTU5Vc01CbjBjT3QvSVVK?=
 =?utf-8?B?L0RFd002LzFnSkgxVnNTTlpiU0hXd3pQUk1wL3JxZW0reW9NZmJtOW10Y0U5?=
 =?utf-8?B?YWttem5iN3lidEtNbXNXWGYyZEtXMk1iUnZOMmdGZy9KNGR4VzA0WkMzaHEv?=
 =?utf-8?B?V1pObWdtYVp6VklqV3JndndFdWZPd2l2S3N5U0V4Zks4emdBL3FyTGNoUEwv?=
 =?utf-8?B?Zi84UFEwbXpQVlk2MlRoSnd0VG1hRU5KTE1pTmgvT000UzhEVlF2RTZrRy9U?=
 =?utf-8?B?eW03L085cFRuOUtINENjV2Jobld4ZEw5R0pyZlgxaWE3c214azFCUzNybUlV?=
 =?utf-8?B?WXRwbzlkbWVxVklKamJJK1hENkY0NnVXV1d4UFdEQWhXRXdwVXJxQ3REWGhW?=
 =?utf-8?B?dEdia2g2aUYwRG1yeGlwdjR3SHdpY003Yzc0ZmlzZXN4ZUNSOEhxcllCNXdz?=
 =?utf-8?B?b0J5SGkyMU5uaUVjQnlvRTVod251WSs2VHVrMkJZU2dwbXE0a1o5WGhzaitk?=
 =?utf-8?B?MitsMjgwK2hxNS9zMm9oRWh3OFVhN1dTYVdJL1hpRjBQS1hjcmR1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78EBE81DB12B0F4F8D73BB665D1AB566@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9253464f-4e0a-4e3f-2f98-08d9e5a64f3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 17:14:30.5037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6sqDtYFIQBfPEoPVxBNZkWT7v/5SSXFO7oiQJArQt9adqL0LZuAu1ou2L8ipKqZMoZqFMx7Ms5JsPVR0Q+2SYnmahXCxTlvqFDtOSVvDl8xHTBlaruCviQlU4r2BD8Ri
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4998
X-Proofpoint-GUID: quTVCld6k0kDT8lDZZQMterlipo8zY2Y
X-Proofpoint-ORIG-GUID: quTVCld6k0kDT8lDZZQMterlipo8zY2Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_08,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010097

SGksIEp1bGllbiENCg0KT24gMDEuMDIuMjIgMTk6MDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGksDQo+DQo+IE9uIDAxLzAyLzIwMjIgMTY6MjUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPg0KPj4NCj4+IFRoaXMgaGVscGVyIGRlc3Ryb3lzIGFsbCB0aGUgcmFu
Z2VzIG9mIHRoZSByYW5nZXNldCBnaXZlbi4NCj4+IFBsZWFzZSBub3RlLCB0aGF0IGl0IHVzZXMg
cmFuZ2VzZXRfcmVtb3ZlX3JhbmdlIHdoaWNoIHJldHVybnMgYW4gZXJyb3INCj4+IGNvZGUgb24g
ZmFpbHVyZS4gVGhpcyBlcnJvciBjb2RlIGNhbiBiZSBpZ25vcmVkIGFzIHdoaWxlIGRlc3Ryb3lp
bmcgYWxsDQo+PiB0aGUgcmFuZ2VzIG5vIG1lbW9yeSBhbGxvY2F0aW9uIGlzIGV4cGVjdGVkLCBz
byBpbiB0aGlzIGNhc2UgaXQgbXVzdCBub3QNCj4+IGZhaWwuDQo+Pg0KPj4gVG8gbWFrZSBzdXJl
IHRoaXMgcmVtYWlucyB2YWxpZCB1c2UgQlVHX09OIGlmIHRoYXQgY2hhbmdlcyBpbiB0aGUgZnV0
dXJlLg0KPj4NCj4+IFN1Z2dlc3RlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+PiAtLS0NCj4+IMKgIHhlbi9jb21tb24v
cmFuZ2VzZXQuY8KgwqDCoMKgwqAgfCA2ICsrKysrKw0KPj4gwqAgeGVuL2luY2x1ZGUveGVuL3Jh
bmdlc2V0LmggfCAzICsrKw0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9yYW5nZXNldC5jIGIveGVuL2NvbW1vbi9y
YW5nZXNldC5jDQo+PiBpbmRleCBlYTI3ZDY1MTcyM2IuLjljYTJiMDZjZmYyMiAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9jb21tb24vcmFuZ2VzZXQuYw0KPj4gKysrIGIveGVuL2NvbW1vbi9yYW5nZXNl
dC5jDQo+PiBAQCAtNTI1LDYgKzUyNSwxMiBAQCB2b2lkIHJhbmdlc2V0X3N3YXAoc3RydWN0IHJh
bmdlc2V0ICphLCBzdHJ1Y3QgcmFuZ2VzZXQgKmIpDQo+PiDCoMKgwqDCoMKgIHdyaXRlX3VubG9j
aygmYi0+bG9jayk7DQo+PiDCoCB9DQo+PiDCoCArdm9pZCByYW5nZXNldF9yZXNldChzdHJ1Y3Qg
cmFuZ2VzZXQgKnIpDQo+PiArew0KPj4gK8KgwqDCoCAvKiBUaGlzIGRvZXNuJ3QgYWxsb2NhdGUg
YW55dGhpbmcgYW5kIG11c3Qgbm90IGZhaWwuICovDQo+PiArwqDCoMKgIEJVR19PTihyYW5nZXNl
dF9yZW1vdmVfcmFuZ2UociwgMCwgfjBVTEwpKTsNCj4NCj4gSSB2YWd1ZWx5IHJlY2FsbCBzb21l
IGRpc2N1c3Npb24gaW4gdGhlIHBhc3QgKG5vdCByZWxhdGVkIHRvIHRoaXMgc2VyaWVzKSB0aGF0
IHdlIHdhbnRlZCB0byBhdm9pZCBjYWxsaW5nIGZ1bmN0aW9uIGhhdmUgc2lkZS1lZmZlY3QgaW4g
YSBCVUdfT04oKS4gU28gaWYgd2UgZGVjaWRlIHRvIHJlbW92ZSBhdCBjb21waWxlLXRpbWUgQlVH
X09OKCksIHRoZXJlIHdvdWxkIGJlIG5vIGlzc3VlLg0KPg0KPiBCdXQgdGhlbiBJIGFtIG5vdCBz
dXJlIGFib3V0IHRoZSB1c2Ugb2YgQlVHX09OKCkuIENhbiB5b3Ugb3V0bGluZSB3aHkgY3Jhc2hp
bmcgdGhlIGh5cGVydmlzb3IgaXMgYmV0dGVyIHRoYW4gY29udGludWluZyAoZS5nLiB1c2UgV0FS
Tl9PTigpIG9yIEFTU0VSVCgpKT8NCk5vbi16ZXJvIHZhbHVlIHdpbGwgaW5kaWNhdGUgd2Ugd2Vy
ZSBub3QgYWJsZSB0byBjb21wbGV0ZSB0aGUgb3BlcmF0aW9uDQp3aGljaCBtdXN0IG5vdCBmYWls
IGJlY2F1c2Ugb2YgdGhlIGNvbmNyZXRlIHVzZS1jYXNlOiB3ZSByZW1vdmUgYWxsIHRoZQ0KcmFu
Z2VzIGFuZCBpdCBpcyBub3QgZXhwZWN0ZWQgdGhhdCB0aGlzIG1heSBmYWlsLg0KSnVzdCB0byBt
YWtlIHN1cmUgdGhpcyBiZWhhdmlvciBkb2VzIG5vdCBjaGFuZ2UgSSB1c2UgQlVHX09OIGhlcmUg
d2hpY2gNCmlmIHRyaWdnZXJlZCBjbGVhcmx5IGluZGljYXRlcyB0aGF0IHRoZSBiZWhhdmlvciBo
YXMgY2hhbmdlZCBhbmQgdGhlcmUgaXMNCmEgbmVlZCBpbiBjb2RlIGNoYW5nZS4NCg0KSSBjYW4g
dHVybiB0aGlzIGludG8gV0FSTl9PTiBpbnN0ZWFkLCBidXQgdGhpcyBtYXkgbGVhZCB0byBtZW1v
cnkgbGVha3MNCm9yIHNvbWUgb3RoZXIgZXJyb3JzIG5vdCBoYW5kbGVkLg0KDQo+DQo+IENoZWVy
cywNCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

