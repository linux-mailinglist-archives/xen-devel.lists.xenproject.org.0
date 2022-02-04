Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84354A9789
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 11:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265336.458681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFvaO-00012Z-J7; Fri, 04 Feb 2022 10:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265336.458681; Fri, 04 Feb 2022 10:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFvaO-00010k-Fr; Fri, 04 Feb 2022 10:13:00 +0000
Received: by outflank-mailman (input) for mailman id 265336;
 Fri, 04 Feb 2022 10:12:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFvaM-00010e-FD
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 10:12:58 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04f8f4f2-85a3-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 11:12:56 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2149uVa1021342;
 Fri, 4 Feb 2022 10:12:52 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e0w09rxes-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 10:12:52 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PR2PR03MB5401.eurprd03.prod.outlook.com (2603:10a6:101:1c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 10:12:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 10:12:46 +0000
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
X-Inumbo-ID: 04f8f4f2-85a3-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yx1FamAwJF04XI8M8vqUj/uuWnPJuG/VLQ+wSVl5ae1h+j4BEEdffP2bxVHKqbBF1C23gprWb0dFBGeterPmgPVma58pzMry7wSdQeeMpJ8CHTwB2I4ZqOC0b0ZUfd4Tz8N8iplwfguEPV/8Ca1q4mRsVfYnTwp5G2j7vZutrwHc4Cf3PZ7suVZR2UjLk91LEBNKn0OZ5ezR/QeO5IIlrI7gC/BHOZ7qb7v30WzZRfHSoSFsAASttVVu/S9AjC0HHL6kLqZFvqzqA4a2n5t5JE4HwD25LuIrZaWhlZrp7sdQSJXkl5I80cp3gdTz9TQXMjVbVWBUq16/y1OWkZq36A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lan3w+B6wLdQLQIObMyeJ+WNYXc6b0/eavTQ2i6H3HQ=;
 b=GflQYPOWoWmFwpjgUb9rAEEGfwuTwtxEfXCMF865bSPkbWHx5GmdEOeWKlIaGW0eBvlKmXmf2T0f6Q4m0F1wXJdAoVygDGw0pUE1QQLVWPb2Vmh5QCS2pNmA9EdEQk9Fs0Gv3BkuTCFYykGR9mQeYh5PO0zBAg5DtLFeDHzLjzTDeCbXDv1p+IMRxuLqWL54DMSefnJC4Owxg+70wrj7bTYXTQ9mEShpXh41QHSDCk2mpfjofQ5yLuqMN+p4Sh/oLvWHQkWDREDvF+0+RNlLbtvveRvTk2HVfbv+Xh99FIi8v6VKXf7VFPC6uuRCIiA3JjPi8t89u+4m592YSytyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lan3w+B6wLdQLQIObMyeJ+WNYXc6b0/eavTQ2i6H3HQ=;
 b=JXWqVO+JDsJE7Fd51fd9MDjYL/c0gjixdWhBQF3J7248meFshwC7q5694mlEHvjaxM7moYKoY0xZlRKlI/TnI1njHVd6JJ0TW6efMrJL+ciWNHH1EaWbVwTGFc7zTW1intMdLvn6xhfE/h62jUxHBZwbJwLAB7hhrv28JD12WAVyK+i8by+7aslJg6uUQjBDZa+LoUN6nUICntW9yPvfKQIFAkOhJRN2inE1heMpwLRs/FjvPX1CHlFvXidk9yjlgl6eg0Oeaj2Cs8p7cOS3vWIm8SC87iFXG4mr6z6+H3Q6ooNNu3voLj6uHE95N47HW3fcWsreT0Q5fZS/9V3Qug==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WA
Date: Fri, 4 Feb 2022 10:12:46 +0000
Message-ID: <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
 <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
In-Reply-To: <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 880cf1bd-577c-4c0f-cf6d-08d9e7c6e42e
x-ms-traffictypediagnostic: PR2PR03MB5401:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR2PR03MB540110DC472D52760708988FE7299@PR2PR03MB5401.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DvZEeyXZpeHwnw6c1newIKQwZaEf4E8wKAMrN2UoQxjOoER26TziO5hBA5wrrQEkVmOV1Lr0L/ks5Z7WoVrNcmSMTFH14pF4fZeG6jQnSiCEo+cXLeDa8EbmcQ29EEzCEpiPPwzQn8Wrpu+oGdFQvYxF+Mlwa0uDdRSBy9paeh0x6mMP3EkLfXJ2rR8EJON+AHRmScX9qlTaQdEJoOyUYISZSOImL559+jvMWvaz+uV3pDKvssljjOvnCDAuMyOPYemP1xzasktNFQC00AEpnnuxt9x/qcT2CkXjwJVhqq1M+zBvmrfZMyFwAtZRWVx1MxkbhqkAa++iqXt2vpHezmqIwRnRl/JVhHJAoed4vVydDqSlnFHxheAJYwWIySfEZsQSi72DQH8b42+tF8jmp8n9JWr51oDcUVWnS0hD3PmQlUDe2GRP50FdCaw6HUa2xMqmVb29HbgUZcitYAuqYlgBwSAq5hk/WIPCGM1Is+WaiymscSAz4j8PIb3QCLQdjD8eEpjmVQEd+UtMMUcK5mghCfaIBrzHSb3u76/mdNyS5Y6gDdtQlPJ/q72mjWwlBS/BhavxKwLdhhOYKx4EKuWIl2XZ3fxhHQBzOc+WidhKfpWMS+3z75r1/D1/JInjKDNvfltERo4M0mL8H37hMHUtm/qd9Uf+2pj3i58wLXuLMvQoOKKTlaiVdn9Vnkx2NzvI7/WjaDIoH3L+ckjDsd2zvVkj83sMJ/ccjmrZLel+ied7bWgEPdCreIoj2cxY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(53546011)(6506007)(38070700005)(2906002)(122000001)(107886003)(83380400001)(91956017)(316002)(86362001)(2616005)(31696002)(71200400001)(36756003)(66556008)(66946007)(7416002)(8936002)(66476007)(66446008)(64756008)(31686004)(76116006)(508600001)(4326008)(54906003)(8676002)(38100700002)(5660300002)(6916009)(186003)(26005)(6486002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b2k2YWdnU1hnU1k0SVIrbzlVZlpWN3pycFdXMU9RcllZazRGL2lJQ1JtOEcz?=
 =?utf-8?B?eHh2VnA3UWt5N21JWDdXUG1LWGJuVDlWQ0hGNjE0T0oxbmJsQmlLSUJuY3NM?=
 =?utf-8?B?VUdOZExoZVFxZkRCWk5FU0hWWVpXQlJhNE96MFYyRFFCL0FsYmIrV0QrM08w?=
 =?utf-8?B?UElhemV5dkM3c0F1UWZqT000K0RyYnh6Z3BNZEY1NDAwRkNDejh4UVdaVnFX?=
 =?utf-8?B?Y2pWRGtHR2NyOFk1OUpqYnJXbXUwSVFmNm83a3lLYXFUSG9ZZHIrc29TaFhp?=
 =?utf-8?B?N3owWExmOTE3MWhtV3oyWDQ5czFyaG9Qbno3eVRSWmVtU0ZqVi9TeHdGT2xG?=
 =?utf-8?B?NEJsV0lDemtFdjgzKzI4T2xXbmlTdjFkRU4xTmVwUWFEbE0wUVB4MktuTUNY?=
 =?utf-8?B?VnVLTDdkdnRmcmNyZ3N5cXd3TmZ4K0V4ZkN0TElLbWtqb3pVWEw5cEdWQkVh?=
 =?utf-8?B?T3VOamRNakhvV3J1OE04ZmNFNlJhcXM4OHlKM1k2SGxoY1NQMy9QSURLdkdK?=
 =?utf-8?B?UmdxVzIxWmFBVDRhYTlHTE9IcXFXNnFaa3VCSEd5ME1QYXQyOVJWc0RqeDBX?=
 =?utf-8?B?UzBPbTIyb01lL1krWW9TOU8yQ0lYQmhCTEpCdGIwdGNnbk9vejNpa1kzUmI4?=
 =?utf-8?B?MlVxVjBQVnNkVzU2NzJyL20wdjRHMjFsOVc2aVpFMy8xK25lYkhoYmVYUS9t?=
 =?utf-8?B?ZGNsazdad1V5cTEyUTZFTlFXSE9aZmZENkVFMTdGS3YzVjBFOUQvVlNHNVhn?=
 =?utf-8?B?azlnejNXZG4rckZ3bWFOR0d6VE43Qk5PdDJVMU40Wm9qQ2tBaTJuRENaSkRH?=
 =?utf-8?B?SStxYlJqY0VBUmw5eTY5NStuT016b1BuV3B5bUszaUl6TWxVVlhKVGdRRzhK?=
 =?utf-8?B?eHpUcHRZczBtMjFtbFFRM1VPaWVSclpLMTFLQ25IUjlDTjB3NWdjenNIMU5n?=
 =?utf-8?B?TzU1U2JuQUtPeTJWRE9uNUJZaHVZcTJJd1ZMSGJyQWNtaWQ3WnU0eFpzN1lx?=
 =?utf-8?B?S3RsbnBhYU1KVW5pYUc2QkpqMUM0dGQrQ2RSZHVKVUNMN2ZIMjRrYTFOUy9a?=
 =?utf-8?B?TUVwT1FSZW9qK3hRZmMvdFhHYXJaaEZBVmdhM0ZRTXVyQU0wWTFINjk5dHJS?=
 =?utf-8?B?ZHJFMzhaaFFsclg1RkhBZlU1WUtwLy9jMjZON1hwUFErUHc3QmZNWSs2bEFO?=
 =?utf-8?B?Wll1OEhHeE83U3dQVUpNVG1jSWhERjlMYnNBeVAzMXptZGQySWNsUGRRYWJp?=
 =?utf-8?B?anF5TmxoZHlMOWRPYVBqTmE3N1VPM2NMT0tGMStxdGdWTUIvMTc1S2VNN2l5?=
 =?utf-8?B?WWQ1V2g4K3l4WFZNNkNWbjY0OWw4Zk13ajN5c0NneWJlcXNweldrd000V1d3?=
 =?utf-8?B?cWNleldSVnZneEdmN3hTT1QwbW45NWZCdUVaRGROcllYRlh5MTNCSGszaEQv?=
 =?utf-8?B?WVNZdWZKeWFZM2FrZXlNMEVHMjdXU2VTUnpaR1c4cmMzRWRPQ3U1T0E4RWxT?=
 =?utf-8?B?SWk5NGJOc0ViYnE5c0szamNlaC9UQU5relE4NDlxYzhLVUtKL1VSaEtybGNS?=
 =?utf-8?B?YUtBTWk3dDFENFROaTJMcXFiVGJKQkVNUGpGeGJGbER2YzBMcUEyMmRwQmhN?=
 =?utf-8?B?RWcrTSszTDdXR0YwZnFHMm9hcllOck4wbCttT0hnRG1lZDI3M3FEMGhycXhK?=
 =?utf-8?B?cmptNU9wQzN2TTFhNFRuQzFud2dMK2xPWDhFbkFHblNINXNZWDJjcTlNaVBp?=
 =?utf-8?B?bDN2QkhZTTErdlNyUVRteW82VVlhRkZNM0VvWUpMZ0NabUdKam1iUVk2ZEoy?=
 =?utf-8?B?WE9LYlREZGdxWjdPZGFKVGlrZytKVnFaeW5uVGtJLzZtUGJXcituSmkxN1VB?=
 =?utf-8?B?eU5adFhEZDcrWWRTeHM4MkwwQjRVNkVma2pMSHRGeENJQkxiWlhJV0tIWEpQ?=
 =?utf-8?B?WWNTdDJZWFo3NDlidlZnVSttTkxPZGJta09tREIvb3pVL3NJL3FKRWl5eUVE?=
 =?utf-8?B?KzVQRG9SR0lrZklmeUoxQkp6OWV1ME5ORm96aFJmaVpJYVhnNDhiRUhONEo2?=
 =?utf-8?B?UERnTVlncUZXWExXaUlBbXk2bUlVb2Qrc0xQMUM4ZFBoeVVHMEtTRU1zeitp?=
 =?utf-8?B?cTgxM0NpeEQzSGxHZFgwK1VPL21WOXlLOCsrcTFaamc3NlBDTXo0bVY1S1pr?=
 =?utf-8?B?M2o0blNMbDlSdWtyVUYwaFZrNVB4WEVZTkQzYzBVK045OWdjVklwQ3FXNXBD?=
 =?utf-8?B?VEdsZ3haMzhCbjUzdC9oK1d6ZytIRy8xRTZ4V29QME9HVWNBT1FITjg4RVNz?=
 =?utf-8?B?QUdSYm9tdzNReE1BVUZka2M5ZXVzalhMZXZqZU1ZN2llVWF0TU1nZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D88AA8C4F1B684FBB15D3FD8A360A48@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 880cf1bd-577c-4c0f-cf6d-08d9e7c6e42e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 10:12:46.6512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dO9ni+yK6JXGRMvuT/CWeBfVlJ3Y8bC9G3DX9XV+nRkOhAT6SEg8NTJ1S5wqJnt+h24Csjj7YkRBYiF0+nVuK0EaYvoQk5BvC8CtL1sq+M8lVyuttpUVc1GOY0LBzrof
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR03MB5401
X-Proofpoint-GUID: WIOLyfmisHilC6SkauVkicusiHbgZ7Dz
X-Proofpoint-ORIG-GUID: WIOLyfmisHilC6SkauVkicusiHbgZ7Dz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040055

SGksIEphbiENCg0KT24gMDQuMDIuMjIgMTE6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAw
NC4wMi4yMDIyIDA5OjU4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IE9uIDA0
LjAyLjIyIDA5OjUyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+PiBPbiAwNC4wMi4yMDIyIDA3OjM0
LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gQEAgLTI4NSw2ICsyODYsMTIg
QEAgc3RhdGljIGludCBtb2RpZnlfYmFycyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdWlu
dDE2X3QgY21kLCBib29sIHJvbV9vbmx5KQ0KPj4+PiAgICAgICAgICAgICAgICAgICAgY29udGlu
dWU7DQo+Pj4+ICAgICAgICAgICAgfQ0KPj4+PiAgICANCj4+Pj4gKyAgICAgICAgc3Bpbl9sb2Nr
KCZ0bXAtPnZwY2lfbG9jayk7DQo+Pj4+ICsgICAgICAgIGlmICggIXRtcC0+dnBjaSApDQo+Pj4+
ICsgICAgICAgIHsNCj4+Pj4gKyAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZ0bXAtPnZwY2lfbG9j
ayk7DQo+Pj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4gKyAgICAgICAgfQ0KPj4+PiAg
ICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgQVJSQVlfU0laRSh0bXAtPnZwY2ktPmhlYWRlci5i
YXJzKTsgaSsrICkNCj4+Pj4gICAgICAgICAgICB7DQo+Pj4+ICAgICAgICAgICAgICAgIGNvbnN0
IHN0cnVjdCB2cGNpX2JhciAqYmFyID0gJnRtcC0+dnBjaS0+aGVhZGVyLmJhcnNbaV07DQo+Pj4+
IEBAIC0zMDMsMTIgKzMxMCwxNCBAQCBzdGF0aWMgaW50IG1vZGlmeV9iYXJzKGNvbnN0IHN0cnVj
dCBwY2lfZGV2ICpwZGV2LCB1aW50MTZfdCBjbWQsIGJvb2wgcm9tX29ubHkpDQo+Pj4+ICAgICAg
ICAgICAgICAgIHJjID0gcmFuZ2VzZXRfcmVtb3ZlX3JhbmdlKG1lbSwgc3RhcnQsIGVuZCk7DQo+
Pj4+ICAgICAgICAgICAgICAgIGlmICggcmMgKQ0KPj4+PiAgICAgICAgICAgICAgICB7DQo+Pj4+
ICsgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJnRtcC0+dnBjaV9sb2NrKTsNCj4+Pj4gICAg
ICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HICJGYWlsZWQgdG8gcmVtb3Zl
IFslbHgsICVseF06ICVkXG4iLA0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ0
LCBlbmQsIHJjKTsNCj4+Pj4gICAgICAgICAgICAgICAgICAgIHJhbmdlc2V0X2Rlc3Ryb3kobWVt
KTsNCj4+Pj4gICAgICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4+Pj4gICAgICAgICAgICAg
ICAgfQ0KPj4+PiAgICAgICAgICAgIH0NCj4+Pj4gKyAgICAgICAgc3Bpbl91bmxvY2soJnRtcC0+
dnBjaV9sb2NrKTsNCj4+Pj4gICAgICAgIH0NCj4+PiBBdCB0aGUgZmlyc3QgZ2xhbmNlIHRoaXMg
c2ltcGx5IGxvb2tzIGxpa2UgYW5vdGhlciB1bmp1c3RpZmllZCAoaW4gdGhlDQo+Pj4gZGVzY3Jp
cHRpb24pIGNoYW5nZSwgYXMgeW91J3JlIG5vdCBjb252ZXJ0aW5nIGFueXRoaW5nIGhlcmUgYnV0
IHlvdQ0KPj4+IGFjdHVhbGx5IGFkZCBsb2NraW5nIChhbmQgSSByZWFsaXplIHRoaXMgd2FzIHRo
ZXJlIGJlZm9yZSwgc28gSSdtIHNvcnJ5DQo+Pj4gZm9yIG5vdCBwb2ludGluZyB0aGlzIG91dCBl
YXJsaWVyKS4NCj4+IFdlbGwsIEkgdGhvdWdodCB0aGF0IHRoZSBkZXNjcmlwdGlvbiBhbHJlYWR5
IGhhcyAiLi4udGhlIGxvY2sgY2FuIGJlDQo+PiB1c2VkIChhbmQgaW4gYSBmZXcgY2FzZXMgaXMg
dXNlZCByaWdodCBhd2F5KSB0byBjaGVjayB3aGV0aGVyIHZwY2kNCj4+IGlzIHByZXNlbnQiIGFu
ZCB0aGlzIGlzIGVub3VnaCBmb3Igc3VjaCB1c2VzIGFzIGhlcmUuDQo+Pj4gICAgQnV0IHRoZW4g
SSB3b25kZXIgd2hldGhlciB5b3UNCj4+PiBhY3R1YWxseSB0ZXN0ZWQgdGhpcywgc2luY2UgSSBj
YW4ndCBoZWxwIGdldHRpbmcgdGhlIGltcHJlc3Npb24gdGhhdA0KPj4+IHlvdSdyZSBpbnRyb2R1
Y2luZyBhIGxpdmUtbG9jazogVGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCBmcm9tIGNtZF93cml0ZSgp
DQo+Pj4gYW5kIHJvbV93cml0ZSgpLCB3aGljaCBpbiB0dXJuIGFyZSBjYWxsZWQgb3V0IG9mIHZw
Y2lfd3JpdGUoKS4gWWV0IHRoYXQNCj4+PiBmdW5jdGlvbiBhbHJlYWR5IGhvbGRzIHRoZSBsb2Nr
LCBhbmQgdGhlIGxvY2sgaXMgbm90IChjdXJyZW50bHkpDQo+Pj4gcmVjdXJzaXZlLiAoRm9yIHRo
ZSAzcmQgY2FsbGVyIG9mIHRoZSBmdW5jdGlvbiAtIGluaXRfYmFycygpIC0gb3RvaA0KPj4+IHRo
ZSBsb2NraW5nIGxvb2tzIHRvIGJlIGVudGlyZWx5IHVubmVjZXNzYXJ5LikNCj4+IFdlbGwsIHlv
dSBhcmUgY29ycmVjdDogaWYgdG1wICE9IHBkZXYgdGhlbiBpdCBpcyBjb3JyZWN0IHRvIGFjcXVp
cmUNCj4+IHRoZSBsb2NrLiBCdXQgaWYgdG1wID09IHBkZXYgYW5kIHJvbV9vbmx5ID09IHRydWUN
Cj4+IHRoZW4gd2UnbGwgZGVhZGxvY2suDQo+Pg0KPj4gSXQgc2VlbXMgd2UgbmVlZCB0byBoYXZl
IHRoZSBsb2NraW5nIGNvbmRpdGlvbmFsLCBlLmcuIG9ubHkgbG9jaw0KPj4gaWYgdG1wICE9IHBk
ZXYNCj4gV2hpY2ggd2lsbCBhZGRyZXNzIHRoZSBsaXZlLWxvY2ssIGJ1dCBpbnRyb2R1Y2UgQUJC
QSBkZWFkbG9jayBwb3RlbnRpYWwNCj4gYmV0d2VlbiB0aGUgdHdvIGxvY2tzLg0KSSBhbSBub3Qg
c3VyZSBJIGNhbiBzdWdnZXN0IGEgYmV0dGVyIHNvbHV0aW9uIGhlcmUNCkBSb2dlciwgQEphbiwg
Y291bGQgeW91IHBsZWFzZSBoZWxwIGhlcmU/DQo+DQo+Pj4+IEBAIC0yMjIsMTAgKzIzOSwxMCBA
QCBzdGF0aWMgaW50IG1zaXhfcmVhZChzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgbG9uZyBhZGRy
LCB1bnNpZ25lZCBpbnQgbGVuLA0KPj4+PiAgICAgICAgICAgICAgICBicmVhazsNCj4+Pj4gICAg
ICAgICAgICB9DQo+Pj4+ICAgIA0KPj4+PiArICAgICAgICBtc2l4X3B1dChtc2l4KTsNCj4+Pj4g
ICAgICAgICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOw0KPj4+PiAgICAgICAgfQ0KPj4+PiAgICAN
Cj4+Pj4gLSAgICBzcGluX2xvY2soJm1zaXgtPnBkZXYtPnZwY2ktPmxvY2spOw0KPj4+PiAgICAg
ICAgZW50cnkgPSBnZXRfZW50cnkobXNpeCwgYWRkcik7DQo+Pj4+ICAgICAgICBvZmZzZXQgPSBh
ZGRyICYgKFBDSV9NU0lYX0VOVFJZX1NJWkUgLSAxKTsNCj4+PiBZb3UncmUgaW5jcmVhc2luZyB0
aGUgbG9ja2VkIHJlZ2lvbiBxdWl0ZSBhIGJpdCBoZXJlLiBJZiB0aGlzIGlzIHJlYWxseQ0KPj4+
IG5lZWRlZCwgaXQgd2FudHMgZXhwbGFpbmluZy4gQW5kIGlmIHRoaXMgaXMgZGVlbWVkIGFjY2Vw
dGFibGUgYXMgYQ0KPj4+ICJzaWRlIGVmZmVjdCIsIGl0IHdhbnRzIGp1c3RpZnlpbmcgb3IgYXQg
bGVhc3Qgc3RhdGluZyBpbW8uIFNhbWUgZm9yDQo+Pj4gbXNpeF93cml0ZSgpIHRoZW4sIG9idmlv
dXNseS4NCj4+IFllcywgSSBkbyBpbmNyZWFzZSB0aGUgbG9ja2luZyByZWdpb24gaGVyZSwgYnV0
IHRoZSBtc2l4IHZhcmlhYmxlIG5lZWRzDQo+PiB0byBiZSBwcm90ZWN0ZWQgYWxsIHRoZSB0aW1l
LCBzbyBpdCBzZWVtcyB0byBiZSBvYnZpb3VzIHRoYXQgaXQgcmVtYWlucw0KPj4gdW5kZXIgdGhl
IGxvY2sNCj4gV2hhdCBkb2VzIHRoZSBtc2l4IHZhcmlhYmxlIGhhdmUgdG8gZG8gd2l0aCB0aGUg
dlBDSSBsb2NrPyBJZiB5b3Ugc2VlDQo+IGEgbmVlZCB0byBncm93IHRoZSBsb2NrZWQgcmVnaW9u
IGhlcmUsIHRoZW4gc3VyZWx5IHRoaXMgaXMgaW5kZXBlbmRlbnQNCj4gb2YgeW91ciBjb252ZXJz
aW9uIG9mIHRoZSBsb2NrLCBhbmQgaGVuY2Ugd2FudHMgdG8gYmUgYSBwcmVyZXEgZml4DQo+ICh3
aGljaCBtYXkgaW4gZmFjdCB3YW50L25lZWQgYmFja3BvcnRpbmcpLg0KRmlyc3Qgb2YgYWxsLCB0
aGUgaW1wbGVtZW50YXRpb24gb2YgbXNpeF9nZXQgaXMgd3JvbmcgYW5kIG5lZWRzIHRvIGJlOg0K
DQovKg0KIMKgKiBOb3RlOiBpZiB2cGNpX21zaXggZm91bmQsIHRoZW4gdGhpcyBmdW5jdGlvbiBy
ZXR1cm5zIHdpdGgNCiDCoCogcGRldi0+dnBjaV9sb2NrIGhlbGQuIFVzZSBtc2l4X3B1dCB0byB1
bmxvY2suDQogwqAqLw0Kc3RhdGljIHN0cnVjdCB2cGNpX21zaXggKm1zaXhfZ2V0KGNvbnN0IHN0
cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgYWRkcikNCnsNCiDCoMKgwqAgc3RydWN0IHZw
Y2lfbXNpeCAqbXNpeDsNCg0KIMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggbXNpeCwgJmQt
PmFyY2guaHZtLm1zaXhfdGFibGVzLCBuZXh0ICkNCiDCoMKgwqAgew0KIMKgwqDCoMKgwqDCoMKg
IGNvbnN0IHN0cnVjdCB2cGNpX2JhciAqYmFyczsNCiDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBp
bnQgaTsNCg0KIMKgwqDCoMKgwqDCoMKgIHNwaW5fbG9jaygmbXNpeC0+cGRldi0+dnBjaV9sb2Nr
KTsNCiDCoMKgwqDCoMKgwqDCoCBpZiAoICFtc2l4LT5wZGV2LT52cGNpICkNCiDCoMKgwqDCoMKg
wqDCoCB7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmbXNpeC0+cGRldi0+
dnBjaV9sb2NrKTsNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOw0KIMKgwqDCoMKg
wqDCoMKgIH0NCg0KIMKgwqDCoMKgwqDCoMKgIGJhcnMgPSBtc2l4LT5wZGV2LT52cGNpLT5oZWFk
ZXIuYmFyczsNCiDCoMKgwqDCoMKgwqDCoCBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUobXNp
eC0+dGFibGVzKTsgaSsrICkNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggYmFyc1ttc2l4
LT50YWJsZXNbaV0gJiBQQ0lfTVNJWF9CSVJNQVNLXS5lbmFibGVkICYmDQogwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgVk1TSVhfQUREUl9JTl9SQU5HRShhZGRyLCBtc2l4LT5wZGV2
LT52cGNpLCBpKSApDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBtc2l4
Ow0KDQogwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJm1zaXgtPnBkZXYtPnZwY2lfbG9jayk7
DQogwqDCoMKgIH0NCg0KIMKgwqDCoCByZXR1cm4gTlVMTDsNCn0NCg0KVGhlbiwgYm90aCBtc2l4
X3tyZWFkfHdyaXRlfSBjYW4gZGVyZWZlcmVuY2UgbXNpeC0+cGRldi0+dnBjaSBlYXJseSwNCnRo
aXMgaXMgd2h5IFJvZ2VyIHN1Z2dlc3RlZCB3ZSBtb3ZlIHRvIG1zaXhfe2dldHxwdXR9IGhlcmUu
DQpBbmQgeWVzLCB3ZSBncm93IHRoZSBsb2NrZWQgcmVnaW9uIGhlcmUgYW5kIHllcyB0aGlzIG1p
Z2h0IHdhbnQgYQ0KcHJlcmVxIGZpeC4gT3IganVzdCBiZSBmaXhlZCB3aGlsZSBhdCBpdC4NCg0K
Pg0KPj4+PiBAQCAtMzI3LDcgKzMzNCwxMiBAQCB1aW50MzJfdCB2cGNpX3JlYWQocGNpX3NiZGZf
dCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSkNCj4+Pj4gICAgICAg
IGlmICggIXBkZXYgKQ0KPj4+PiAgICAgICAgICAgIHJldHVybiB2cGNpX3JlYWRfaHcoc2JkZiwg
cmVnLCBzaXplKTsNCj4+Pj4gICAgDQo+Pj4+IC0gICAgc3Bpbl9sb2NrKCZwZGV2LT52cGNpLT5s
b2NrKTsNCj4+Pj4gKyAgICBzcGluX2xvY2soJnBkZXYtPnZwY2lfbG9jayk7DQo+Pj4+ICsgICAg
aWYgKCAhcGRldi0+dnBjaSApDQo+Pj4+ICsgICAgew0KPj4+PiArICAgICAgICBzcGluX3VubG9j
aygmcGRldi0+dnBjaV9sb2NrKTsNCj4+Pj4gKyAgICAgICAgcmV0dXJuIHZwY2lfcmVhZF9odyhz
YmRmLCByZWcsIHNpemUpOw0KPj4+PiArICAgIH0NCj4+PiBEaWRuJ3QgeW91IHNheSB5b3Ugd291
bGQgYWRkIGp1c3RpZmljYXRpb24gb2YgdGhpcyBwYXJ0IG9mIHRoZSBjaGFuZ2UNCj4+PiAoYW5k
IGl0cyB2cGNpX3dyaXRlKCkgY291bnRlcnBhcnQpIHRvIHRoZSBkZXNjcmlwdGlvbj8NCj4+IEFn
YWluLCBJIGFtIHJlZmVycmluZyB0byB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgZGVzY3JpYmVkIGFi
b3ZlDQo+IE5vLCBzb3JyeSAtIHRoYXQgcGFydCBhcHBsaWVzIG9ubHkgdG8gd2hhdCBpbnNpZGUg
dGhlIHBhcmVudGhlc2VzIG9mDQo+IGlmKCkuIEJ1dCBvbiB0aGUgaW50ZXJtZWRpYXRlIHZlcnNp
b24gKHBvc3QtdjUgaW4gYSA0LXBhdGNoIHNlcmllcykgSQ0KPiBkaWQgc2F5Og0KPg0KPiAiSW4g
dGhpcyBjYXNlIGFzIHdlbGwgYXMgaW4gaXRzIHdyaXRlIGNvdW50ZXJwYXJ0IGl0IGJlY29tZXMg
ZXZlbiBtb3JlDQo+ICAgaW1wb3J0YW50IHRvIGp1c3RpZnkgKGluIHRoZSBkZXNjcmlwdGlvbikg
dGhlIG5ldyBiZWhhdmlvci4gSXQgaXMgbm90DQo+ICAgb2J2aW91cyBhdCBhbGwgdGhhdCB0aGUg
YWJzZW5jZSBvZiBhIHN0cnVjdCB2cGNpIHNob3VsZCBiZSB0YWtlbiBhcw0KPiAgIGFuIGluZGlj
YXRpb24gdGhhdCB0aGUgdW5kZXJseWluZyBkZXZpY2UgbmVlZHMgYWNjZXNzaW5nIGluc3RlYWQu
DQo+ICAgVGhpcyBhbHNvIGNhbm5vdCBiZSBpbmZlcnJlZCBmcm9tIHRoZSAiIXBkZXYiIGNhc2Ug
dmlzaWJsZSBpbiBjb250ZXh0Lg0KPiAgIEluIHRoYXQgY2FzZSB3ZSBoYXZlIG5vIHJlY29yZCBv
ZiBhIGRldmljZSBhdCB0aGlzIFNCREYsIGFuZCBoZW5jZSB0aGUNCj4gICBmYWxsYmFjayBwcmV0
dHkgY2xlYXJseSBpcyBhICJqdXN0IGluIGNhc2UiIG9uZS4gWWV0IGlmIHdlIGtub3cgb2YgYQ0K
PiAgIGRldmljZSwgdGhlIGFic2VuY2Ugb2YgYSBzdHJ1Y3QgdnBjaSBtYXkgbWVhbiB2YXJpb3Vz
IHBvc3NpYmxlIHRoaW5ncy4iDQo+DQo+IElmIGl0IHdhc24ndCBvYnZpb3VzOiBUaGUgY29tbWVu
dCB3YXMgb24gdGhlIHVzZSBvZiB2cGNpX3JlYWRfaHcoKSBvbg0KPiB0aGlzIHBhdGgsIG5vdCBy
ZWR1bmRhbnQgd2l0aCB0aGUgZWFybGllciBvbmUgcmVnYXJkaW5nIHRoZSBhZGRlZA0KPiAiaXMg
dnBjaSBub24tTlVMTCIgaW4gYSBmZXcgcGxhY2VzLg0KT2sNCj4NCj4gSmFuDQo+DQpUaGFuayB5
b3UsDQpPbGVrc2FuZHI=

