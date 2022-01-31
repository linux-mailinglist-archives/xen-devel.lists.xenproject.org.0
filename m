Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D53664A3F8F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 10:54:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262873.455291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETNW-00076S-Tv; Mon, 31 Jan 2022 09:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262873.455291; Mon, 31 Jan 2022 09:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETNW-00073t-Qr; Mon, 31 Jan 2022 09:53:42 +0000
Received: by outflank-mailman (input) for mailman id 262873;
 Mon, 31 Jan 2022 09:53:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9o41=SP=epam.com=prvs=4030d24c28=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nETNV-00073n-8U
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 09:53:41 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a959fe3c-827b-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 10:53:38 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20V93KeE019655;
 Mon, 31 Jan 2022 09:53:34 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dxc900bb9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 09:53:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB5052.eurprd03.prod.outlook.com (2603:10a6:10:7e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Mon, 31 Jan
 2022 09:53:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 09:53:30 +0000
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
X-Inumbo-ID: a959fe3c-827b-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jh8eWh6QMBTI1WBvnkmw063O73firuLyu26Djumo7rDHg2Yzv5nrFHKbSsJpOoYEAz4RdIcJUSm6+hB03HQ6vgvGQiPYya5wK82uaArYO0izmJHqkNbw/g2bjGqgxofxe5DEG8IcxsRE8SAe0QLNZw2rKmBTPO79FzJwtQXzbJe35t3m3JiDzcerTx7H1+Tnv7gfyVbUddzueQaq500jb6yaB5tqaBzkCV9VK4Hsz/CEwRGCTH3ssrvphu9iqN477USyCksXjXa8e62poEvFOQzNDJyKcVofPctlHc2T7GHol4tOYrRVD2ZClJ7P8sbFHLN6Hl50w0lMj5L5RKjE5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xu7UlaL0Pu+6LDokSemeVsDeRdThbOgEJprRIU4o1Mg=;
 b=c+laTLiD2Gh4rqD1Wj6XM8qAOlp66f9M7RXQQb1TnWBDvSUe/vDcgOfYQ4vHC37BvRAY20YrUwMJsqq97wJLIEc5lI5XcevpHxf8UdAl2/1kaThuCYt4cgFBlTUvqvCSNZyJikmHSkM10Djd6K/ATSCZuvLEqtDGWEqWFvC0/rk6P9a505oVEPQziUjn7EUbtSMup9IXeQ6pWXbr61sc2EwlGO0wBwTalbmVUhbBPePjAHqDanf8J9U1I36Ms3Txz4YzqGzQBUo0jnf5IYZr7D46EB3Xq54VV/Pk9lCcScamb2XoXaYz1VerKSiwrCGqPH6zHeyJAAJG6zjcCo0KIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xu7UlaL0Pu+6LDokSemeVsDeRdThbOgEJprRIU4o1Mg=;
 b=cQeL7w26DT2uPqZA/ual3TdzQCB+WdTAw41gQXW4ENjCtynHsnK85roZSWC+9e9prECd2glqxK6fb+EK5qw0O4+qCyU3GJE+NnYyqPX9TA8P5TtHS8myZUgHdTLVwU9+COfVkVnp+ZTz3NNpFnY4+JBQ8EOaB9IKSDqy7XUpFG8nmd7sqzMRA4vv0MYoSPWuguAGtC8PdSJkyI0mVSzt4E6kjvL3QR1twBauubTVFQKCTh8Zl8S4hqQ2BuyQXTzfisONr146gaqBYR17/kylAUZKbEi7hdId+Wx6yGefNC5bzeV5NcsBZ+GXORgOrwb5VXsgavPF7GPDMX/bETYNMw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewHyWAyD811HEGp8pIjUuVWNaxf8XWAgB1bfoA=
Date: Mon, 31 Jan 2022 09:53:29 +0000
Message-ID: <d493b022-3c78-1721-e668-48f4553056a9@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd8RJfpEalnfl+CC@Air-de-Roger>
In-Reply-To: <Yd8RJfpEalnfl+CC@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d4a1f9f-774d-473d-bb1a-08d9e49f8925
x-ms-traffictypediagnostic: DB7PR03MB5052:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB50520E1F0E69F9A633C3E26DE7259@DB7PR03MB5052.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:439;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tbZspU9dZgqCEnVymdy+EzzdYBfO2afDZ3YvsN59/Ze7IyYci9ddFrNIMZl0FbEX2+2Ij1S+6aAFLhtD1rvfphTgTjUhK/TZA2sROyzww7aXhjEn4yan2CsLTrjXVDQjczEfNEvMbMDQFd0uLF4BySHGJkUBxDgohwiqZqbZXNza/5pYNvvbJlPuDMsxh/ikEtj6RSKPu9sgm4XhIo0LyJDlYfbVeVioAOUXeN32xPjF//gxplkDvL45e2QJ/+CTK1wtrqEDdN97/av7u9ZVauT0zL5Mw5ZpIR5jrcaA8g5drBZLuIiq5G4bqC/dN2Jch1dUcKKFidDShd21cHWpF7fW7PVtUoyZuaHDfwq55QtS4JNjmQ9watlsH6OexlziUg9bnDQ2IaxSmQKJuYvvceQUR3M/3SooaqJi1DZdKsYWY2BU8FfsX9jA+owvYzOrL0oizG69oastYk4+ZVqIMxaKtwg0tR5wjZKrMIv+RYkOSuUDPysXdBzgHqNSbKohOfveRTNkJK5TBhJCpNKBPDwOzli1skq0Q+u2S2j9hZ6YKqjCvuHcM9884AfI9olJ0o/DG+mWdqQG8wkNcjHxs/Tn30zzNabdj9nVANmLJNHSQS/DDoekv1ftbpeNPRsDQPq9tt/BmZII9LjV3gzfTZKVwUnAM9SIwFOtp92LNxthoUym5XCr9pFQm81X4ohTI1gdUESrG7QS5sO64RUIUIo1CyPngWrUAar3P9MRtIMRYR2PaQkQ9Ghx7yA+vrge
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(122000001)(91956017)(5660300002)(66446008)(71200400001)(66476007)(186003)(66556008)(66946007)(8936002)(64756008)(316002)(8676002)(4326008)(38100700002)(76116006)(7416002)(107886003)(2616005)(31686004)(36756003)(38070700005)(83380400001)(6916009)(6512007)(2906002)(6506007)(53546011)(54906003)(6486002)(86362001)(508600001)(31696002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a0ZWb0gxWUFWNWkxTGRHemg4L0RBMGc2eGRoU1RVdVNaamp0STBsRWlTY0VE?=
 =?utf-8?B?UWpFYUR2cGxvSnFDdWUrckNZekNaUDF6cXhvZnI0TE9CRVlRbTVFektIMWZH?=
 =?utf-8?B?SjROS1Bld1NaSDZNSlFpL3ZTdXh3ZWhQQkNORlZBUWs2emRSdHZUZmdMVGZl?=
 =?utf-8?B?bzVxSERTOUZtQVNhVHRFdzJuUllhb3J1ODh4Y2NGNFUwOUF2OFZXbDRRb2hT?=
 =?utf-8?B?VEtFeUpkNDloS2E2Vk1ITUtId1lJcWFEZ0p6cGRaSXFNMjVFSHhRRGxLbnJQ?=
 =?utf-8?B?ZVZRdE5ZUDRrUHRpaVFwSktxR1VmUUxCN0FRcHIvc2Z2ZUJlRXVYNFovTFFs?=
 =?utf-8?B?WkFNcXZZak9kbUpxWHo3ZWZpeG1WYjhXK3I2U29wTnZJdEVPbzIwcHR2Vzhi?=
 =?utf-8?B?bzFkOG4wTlRLZnZVMlpiaGc3Nm9EVVlyeW5SUVRlcjZSeXdsRlNUa0NIRmta?=
 =?utf-8?B?NGE5cHV2QUxIN2RGT1FQNFJYNFhZckpxT05hQVhOVWs2eUVaZmNxKzcrU0Fk?=
 =?utf-8?B?aUp3NG0zYXhFSGl1SnBQSW9kWW9ISXQrRkQ4SGZCd3dVaUw4M3EvQWtlN1J0?=
 =?utf-8?B?ZXhMUWdIaXMxZk9FV2VhR1UyRTRIb0UzcjVRYmt1YjhDZ2ZWaFhRcEhHbCtp?=
 =?utf-8?B?UlN3ZU8vT0FiODNuLzB4djhZdmRHbkNoNU5jaHRiUnI4d3VDWU5xSlBKdGFT?=
 =?utf-8?B?aU9oOWl0OWZoMzFQTlhPZkdSSUJsd1loUG8wYU04aXYyOUo4K3lLbUhWbkx0?=
 =?utf-8?B?Tkt1dWMwQkt5bng4bXB2Qmx5cGRHYkI3cHpRQy9zRE9oaHc5VGJSbkxtQURT?=
 =?utf-8?B?R1VuR1FlMy9RdnJlQTVxZCtPTWR1d3NBSmhFZWtvVVFyUlB3eEo2MUllWkVp?=
 =?utf-8?B?QStkTWlZUW9RT1RIc21oYTV5djhGZVhEL2ZvZy82UlZuVHpGdlJ3Zkg0UnpC?=
 =?utf-8?B?K3JpcXl2TUdNbE1pQmxOUk9ORHpkdFFvNFZ3OExnMmJPbkNtTFBOUWhNbEwz?=
 =?utf-8?B?TmJOT0U0aXJxTTVtajU4eWViZ1BIRFlkZThiazQ0emJFckxmV1lEVGg2bDlP?=
 =?utf-8?B?QVM1emdUNEFoVlAxaTVGYTNweGh2U0J3R0lnc1lhbTBxbS9Db3UrR2hkNlEv?=
 =?utf-8?B?b01mSzBpT05lN0IveDdLWDJXU1hrRGZvdmRZdUMvMjRnVUZzMTcyc21mRjc1?=
 =?utf-8?B?MWRZNUl6MEpoZ2hVMDZVRDQ5RW0vR25TYTRRb05uMWErY3dvRlhBMFQ5VVoy?=
 =?utf-8?B?WUttazR6ellsS1hkVllkWU1MZnhhTzJ3UnowUElqazc0SndpSVdNWnE4YWZh?=
 =?utf-8?B?cDZiUkFLcUJLVkdNcTE2M2hUaTd4WFRxNDBMeTBBeWF6WXN2T2x5MFd6NEFY?=
 =?utf-8?B?NzJmZGUrNHJ6L0hWSGU4U3FkZzBxQ1cvN0RnWU5LMlRaWGI5YjJLR0NvQjRK?=
 =?utf-8?B?bHRMMXNOYnV4dUpMTDRLMlE2eGF5M2Q2NlNBMGdkZ3JlSUJDNXpZbUZ3dTBY?=
 =?utf-8?B?K2V0MmRMR05pcDNiMnc4bHg3ZWtLRU11WGhhdUNpVTJKMXF3NjNtS3l0S1Ja?=
 =?utf-8?B?YkRpWERoRjlkci96MTJIamRFNWdBcHVRQ2Z2QXd3YjBNOWJRTEVxM1htRFd4?=
 =?utf-8?B?T0lRNDlsUUJ1WGtTUWRxbGdSOW45eTYwalh4a2tCT3YxcFY3N3ZtMFVTeFV0?=
 =?utf-8?B?ZHg3NWFJam4vOEhMMEtqN1gvZHMwQ2JVejJxMWdHaHE5VHlHS1RTR2xCS3FU?=
 =?utf-8?B?Z05vN3d0NzNGSTErVGRINm1TS1FwbklhM3IyWlhWZVVmRGgxVEh0SENwYU85?=
 =?utf-8?B?Vy80cWszMU9TMnkyN2o1Qko3OUpiR0hUZk1tWFZGRTJyS3d6aXZJdHVtOW5R?=
 =?utf-8?B?a3dHeWsyaVBSZU5ndGpYY2dtMVk4NnVhWDdNaFVXU2djR0hxMm5NV3E3MFhN?=
 =?utf-8?B?bUNGQkxpL2FGcmZ6dFFYYnpZcWpheXpPaWxKa2NBbk5XM3BaQzlkTmZZZWZ3?=
 =?utf-8?B?L3QyZ0NWdmlBL3d4aEk5bjlNTHBQa2Uzb2hyckVlUFp1WS9qOEx6UnVLUzNT?=
 =?utf-8?B?ZDIvaHVPeTVUZFlFc1oweUN5SVFvb3pOeWdNOFBhQzhsWDY1N0lvMDhuS0Vz?=
 =?utf-8?B?SWZTWUYyNkpiak1IMFMrOFUyTW1xMENraGhUdzZXenFRQnE5THljeVNQK0cv?=
 =?utf-8?B?dFpDYlpEMXVEK0svOER6YzdObXRpTEFrVVR5TmNHelhaOW5NRURRTlpCZzlE?=
 =?utf-8?B?STJmT051OTdOaWxtRkxRK3ljWHd5Zzh1VEE0ZTRtQkNpS1NHQjNxdWpaUXps?=
 =?utf-8?B?ZzZjbmgyK3M4Q2dCdE40TkhOQVQxZ1djL21PaFVSYW5sVFp6QmVqZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2139C6AB2100DB40A6751B8A07469942@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4a1f9f-774d-473d-bb1a-08d9e49f8925
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 09:53:29.9963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sJOaMyfPZQwKtMjDwgLLbauXrt8AhHTBLOvKi6mO86rQPWbIkYBPAXSaAq+QJoWlQFV/93dMVoJFBDVXTTS/SrMfuFxuY2MmYuB3JHMIHOZ43K5op1DM1QiZGhMxx4Yc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB5052
X-Proofpoint-GUID: gIi27bAmWPDGWPXEcybjhbT4vM1KB3P_
X-Proofpoint-ORIG-GUID: gIi27bAmWPDGWPXEcybjhbT4vM1KB3P_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_02,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310066

SGksIFJvZ2VyIQ0KDQpPbiAxMi4wMS4yMiAxOTozNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gQSBjb3VwbGUgbW9yZSBjb21tZW50cyBJIHJlYWxpemVkIHdoaWxlIHdhbGtpbmcgdGhlIGRv
Zy4NCj4NCj4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQgMDE6MDI6NDNQTSArMDIwMCwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gQWRkIHJlbGV2YW50
IHZwY2kgcmVnaXN0ZXIgaGFuZGxlcnMgd2hlbiBhc3NpZ25pbmcgUENJIGRldmljZSB0byBhIGRv
bWFpbg0KPj4gYW5kIHJlbW92ZSB0aG9zZSB3aGVuIGRlLWFzc2lnbmluZy4gVGhpcyBhbGxvd3Mg
aGF2aW5nIGRpZmZlcmVudA0KPj4gaGFuZGxlcnMgZm9yIGRpZmZlcmVudCBkb21haW5zLCBlLmcu
IGh3ZG9tIGFuZCBvdGhlciBndWVzdHMuDQo+Pg0KPj4gRW11bGF0ZSBndWVzdCBCQVIgcmVnaXN0
ZXIgdmFsdWVzOiB0aGlzIGFsbG93cyBjcmVhdGluZyBhIGd1ZXN0IHZpZXcNCj4+IG9mIHRoZSBy
ZWdpc3RlcnMgYW5kIGVtdWxhdGVzIHNpemUgYW5kIHByb3BlcnRpZXMgcHJvYmUgYXMgaXQgaXMg
ZG9uZQ0KPj4gZHVyaW5nIFBDSSBkZXZpY2UgZW51bWVyYXRpb24gYnkgdGhlIGd1ZXN0Lg0KPj4N
Cj4+IFJPTSBCQVIgaXMgb25seSBoYW5kbGVkIGZvciB0aGUgaGFyZHdhcmUgZG9tYWluIGFuZCBm
b3IgZ3Vlc3QgZG9tYWlucw0KPj4gdGhlcmUgaXMgYSBzdHViOiBhdCB0aGUgbW9tZW50IFBDSSBl
eHBhbnNpb24gUk9NIGhhbmRsaW5nIGlzIHN1cHBvcnRlZA0KPj4gZm9yIHg4NiBvbmx5IGFuZCBp
dCBtaWdodCBub3QgYmUgdXNlZCBieSBvdGhlciBhcmNoaXRlY3R1cmVzIHdpdGhvdXQNCj4+IGVt
dWxhdGluZyB4ODYuIE90aGVyIHVzZS1jYXNlcyBtYXkgaW5jbHVkZSB1c2luZyB0aGF0IGV4cGFu
c2lvbiBST00gYmVmb3JlDQo+PiBYZW4gYm9vdHMsIGhlbmNlIG5vIGVtdWxhdGlvbiBpcyBuZWVk
ZWQgaW4gWGVuIGl0c2VsZi4gT3Igd2hlbiBhIGd1ZXN0DQo+PiB3YW50cyB0byB1c2UgdGhlIFJP
TSBjb2RlIHdoaWNoIHNlZW1zIHRvIGJlIHJhcmUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogT2xl
a3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0K
Pj4gLS0tDQo+PiBTaW5jZSB2NDoNCj4+IC0gdXBkYXRlZCBjb21taXQgbWVzc2FnZQ0KPj4gLSBz
L2d1ZXN0X2FkZHIvZ3Vlc3RfcmVnDQo+PiBTaW5jZSB2MzoNCj4+IC0gc3F1YXNoZWQgdHdvIHBh
dGNoZXM6IGR5bmFtaWMgYWRkL3JlbW92ZSBoYW5kbGVycyBhbmQgZ3Vlc3QgQkFSDQo+PiAgICBo
YW5kbGVyIGltcGxlbWVudGF0aW9uDQo+PiAtIGZpeCBndWVzdCBCQVIgcmVhZCBvZiB0aGUgaGln
aCBwYXJ0IG9mIGEgNjRiaXQgQkFSIChSb2dlcikNCj4+IC0gYWRkIGVycm9yIGhhbmRsaW5nIHRv
IHZwY2lfYXNzaWduX2RldmljZQ0KPj4gLSBzL2RvbSVwZC8lcGQNCj4+IC0gYmxhbmsgbGluZSBi
ZWZvcmUgcmV0dXJuDQo+PiBTaW5jZSB2MjoNCj4+IC0gcmVtb3ZlIHVubmVlZGVkIGlmZGVmcyBm
b3IgQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQgYXMgbW9yZSBjb2RlDQo+PiAgICBoYXMg
YmVlbiBlbGltaW5hdGVkIGZyb20gYmVpbmcgYnVpbHQgb24geDg2DQo+PiBTaW5jZSB2MToNCj4+
ICAgLSBjb25zdGlmeSBzdHJ1Y3QgcGNpX2RldiB3aGVyZSBwb3NzaWJsZQ0KPj4gICAtIGRvIG5v
dCBvcGVuIGNvZGUgaXNfc3lzdGVtX2RvbWFpbigpDQo+PiAgIC0gc2ltcGxpZnkgc29tZSBjb2Rl
My4gc2ltcGxpZnkNCj4+ICAgLSB1c2UgZ2RwcmludGsgKyBlcnJvciBjb2RlIGluc3RlYWQgb2Yg
Z3ByaW50aw0KPj4gICAtIGdhdGUgdnBjaV9iYXJfe2FkZHxyZW1vdmV9X2hhbmRsZXJzIHdpdGgg
Q09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQsDQo+PiAgICAgc28gdGhlc2UgZG8gbm90IGdl
dCBjb21waWxlZCBmb3IgeDg2DQo+PiAgIC0gcmVtb3ZlZCB1bm5lZWRlZCBpc19zeXN0ZW1fZG9t
YWluIGNoZWNrDQo+PiAgIC0gcmUtd29yayBndWVzdCByZWFkL3dyaXRlIHRvIGJlIG11Y2ggc2lt
cGxlciBhbmQgZG8gbW9yZSB3b3JrIG9uIHdyaXRlDQo+PiAgICAgdGhhbiByZWFkIHdoaWNoIGlz
IGV4cGVjdGVkIHRvIGJlIGNhbGxlZCBtb3JlIGZyZXF1ZW50bHkNCj4+ICAgLSByZW1vdmVkIG9u
ZSB0b28gb2J2aW91cyBjb21tZW50DQo+PiAtLS0NCj4+ICAgeGVuL2RyaXZlcnMvdnBjaS9oZWFk
ZXIuYyB8IDcyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPj4gICB4
ZW4vaW5jbHVkZS94ZW4vdnBjaS5oICAgIHwgIDMgKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2
OSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4v
ZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gaW5k
ZXggYmEzMzNmYjJmOWIwLi44ODgwZDM0ZWJmOGUgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vZHJpdmVy
cy92cGNpL2hlYWRlci5jDQo+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiBA
QCAtNDMzLDYgKzQzMyw0OCBAQCBzdGF0aWMgdm9pZCBiYXJfd3JpdGUoY29uc3Qgc3RydWN0IHBj
aV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+PiAgICAgICBwY2lfY29uZl93cml0ZTMy
KHBkZXYtPnNiZGYsIHJlZywgdmFsKTsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgdm9pZCBn
dWVzdF9iYXJfd3JpdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCBy
ZWcsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHZhbCwgdm9pZCAq
ZGF0YSkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0gZGF0YTsNCj4+ICsg
ICAgYm9vbCBoaSA9IGZhbHNlOw0KPj4gKw0KPj4gKyAgICBpZiAoIGJhci0+dHlwZSA9PSBWUENJ
X0JBUl9NRU02NF9ISSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIEFTU0VSVChyZWcgPiBQQ0lf
QkFTRV9BRERSRVNTXzApOw0KPj4gKyAgICAgICAgYmFyLS07DQo+PiArICAgICAgICBoaSA9IHRy
dWU7DQo+PiArICAgIH0NCj4+ICsgICAgZWxzZQ0KPj4gKyAgICB7DQo+PiArICAgICAgICB2YWwg
Jj0gUENJX0JBU0VfQUREUkVTU19NRU1fTUFTSzsNCj4+ICsgICAgICAgIHZhbCB8PSBiYXItPnR5
cGUgPT0gVlBDSV9CQVJfTUVNMzIgPyBQQ0lfQkFTRV9BRERSRVNTX01FTV9UWVBFXzMyDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogUENJX0JBU0VfQURE
UkVTU19NRU1fVFlQRV82NDsNCj4+ICsgICAgICAgIHZhbCB8PSBiYXItPnByZWZldGNoYWJsZSA/
IFBDSV9CQVNFX0FERFJFU1NfTUVNX1BSRUZFVENIIDogMDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4g
KyAgICBiYXItPmd1ZXN0X3JlZyAmPSB+KDB4ZmZmZmZmZmZ1bGwgPDwgKGhpID8gMzIgOiAwKSk7
DQo+PiArICAgIGJhci0+Z3Vlc3RfcmVnIHw9ICh1aW50NjRfdCl2YWwgPDwgKGhpID8gMzIgOiAw
KTsNCj4+ICsNCj4+ICsgICAgYmFyLT5ndWVzdF9yZWcgJj0gfihiYXItPnNpemUgLSAxKSB8IH5Q
Q0lfQkFTRV9BRERSRVNTX01FTV9NQVNLOw0KPiBZb3UgbmVlZCB0byBhc3NlcnQgdGhhdCB0aGUg
Z3Vlc3Qgc2V0IGFkZHJlc3MgaGFzIHRoZSBzYW1lIHBhZ2Ugb2Zmc2V0DQo+IGFzIHRoZSBwaHlz
aWNhbCBhZGRyZXNzIG9uIHRoZSBob3N0LCBvciBvdGhlcndpc2UgdGhpbmdzIHdvbid0IHdvcmsg
YXMNCj4gZXhwZWN0ZWQuIEllOiBndWVzdF9hZGRyICYgflBBR0VfTUFTSyA9PSBhZGRyICYgflBB
R0VfTUFTSy4NCkdvb2QgY2F0Y2gsIHRoYW5rIHlvdQ0KPg0KPj4gK30NCj4+ICsNCj4+ICtzdGF0
aWMgdWludDMyX3QgZ3Vlc3RfYmFyX3JlYWQoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVu
c2lnbmVkIGludCByZWcsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQg
KmRhdGEpDQo+PiArew0KPj4gKyAgICBjb25zdCBzdHJ1Y3QgdnBjaV9iYXIgKmJhciA9IGRhdGE7
DQo+PiArICAgIGJvb2wgaGkgPSBmYWxzZTsNCj4+ICsNCj4+ICsgICAgaWYgKCBiYXItPnR5cGUg
PT0gVlBDSV9CQVJfTUVNNjRfSEkgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBBU1NFUlQocmVn
ID4gUENJX0JBU0VfQUREUkVTU18wKTsNCj4+ICsgICAgICAgIGJhci0tOw0KPj4gKyAgICAgICAg
aGkgPSB0cnVlOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldHVybiBiYXItPmd1ZXN0X3Jl
ZyA+PiAoaGkgPyAzMiA6IDApOw0KPj4gK30NCj4+ICsNCj4+ICAgc3RhdGljIHZvaWQgcm9tX3dy
aXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgdmFsLCB2b2lkICpkYXRhKQ0KPj4gICB7DQo+
PiBAQCAtNDgxLDYgKzUyMywxNyBAQCBzdGF0aWMgdm9pZCByb21fd3JpdGUoY29uc3Qgc3RydWN0
IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+PiAgICAgICAgICAgcm9tLT5hZGRy
ID0gdmFsICYgUENJX1JPTV9BRERSRVNTX01BU0s7DQo+PiAgIH0NCj4+ICAgDQo+PiArc3RhdGlj
IHZvaWQgZ3Vlc3Rfcm9tX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25l
ZCBpbnQgcmVnLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCB2YWws
IHZvaWQgKmRhdGEpDQo+PiArew0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdWludDMyX3QgZ3Vl
c3Rfcm9tX3JlYWQoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpDQo+PiArew0K
Pj4gKyAgICByZXR1cm4gMHhmZmZmZmZmZjsNCj4+ICt9DQo+PiArDQo+PiAgIHN0YXRpYyBpbnQg
aW5pdF9iYXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICB7DQo+PiAgICAgICB1aW50MTZf
dCBjbWQ7DQo+PiBAQCAtNDg5LDYgKzU0Miw3IEBAIHN0YXRpYyBpbnQgaW5pdF9iYXJzKHN0cnVj
dCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICAgc3RydWN0IHZwY2lfaGVhZGVyICpoZWFkZXIgPSAm
cGRldi0+dnBjaS0+aGVhZGVyOw0KPj4gICAgICAgc3RydWN0IHZwY2lfYmFyICpiYXJzID0gaGVh
ZGVyLT5iYXJzOw0KPj4gICAgICAgaW50IHJjOw0KPj4gKyAgICBib29sIGlzX2h3ZG9tID0gaXNf
aGFyZHdhcmVfZG9tYWluKHBkZXYtPmRvbWFpbik7DQo+PiAgIA0KPj4gICAgICAgc3dpdGNoICgg
cGNpX2NvbmZfcmVhZDgocGRldi0+c2JkZiwgUENJX0hFQURFUl9UWVBFKSAmIDB4N2YgKQ0KPj4g
ICAgICAgew0KPj4gQEAgLTUyOCw4ICs1ODIsMTAgQEAgc3RhdGljIGludCBpbml0X2JhcnMoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgICAgICAgICAgaWYgKCBpICYmIGJhcnNbaSAtIDFdLnR5
cGUgPT0gVlBDSV9CQVJfTUVNNjRfTE8gKQ0KPj4gICAgICAgICAgIHsNCj4+ICAgICAgICAgICAg
ICAgYmFyc1tpXS50eXBlID0gVlBDSV9CQVJfTUVNNjRfSEk7DQo+PiAtICAgICAgICAgICAgcmMg
PSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQzMiwgYmFyX3dyaXRl
LCByZWcsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA0LCAmYmFyc1tp
XSk7DQo+PiArICAgICAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXNfaHdkb20gPyB2cGNpX2h3
X3JlYWQzMiA6IGd1ZXN0X2Jhcl9yZWFkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaXNfaHdkb20gPyBiYXJfd3JpdGUgOiBndWVzdF9iYXJfd3JpdGUsDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcsIDQsICZiYXJzW2ldKTsNCj4+ICAg
ICAgICAgICAgICAgaWYgKCByYyApDQo+PiAgICAgICAgICAgICAgIHsNCj4+ICAgICAgICAgICAg
ICAgICAgIHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2JkZiwgUENJX0NPTU1BTkQsIGNtZCk7DQo+
PiBAQCAtNTY5LDggKzYyNSwxMCBAQCBzdGF0aWMgaW50IGluaXRfYmFycyhzdHJ1Y3QgcGNpX2Rl
diAqcGRldikNCj4+ICAgICAgICAgICBiYXJzW2ldLnNpemUgPSBzaXplOw0KPj4gICAgICAgICAg
IGJhcnNbaV0ucHJlZmV0Y2hhYmxlID0gdmFsICYgUENJX0JBU0VfQUREUkVTU19NRU1fUFJFRkVU
Q0g7DQo+PiAgIA0KPj4gLSAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNp
LCB2cGNpX2h3X3JlYWQzMiwgYmFyX3dyaXRlLCByZWcsIDQsDQo+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZiYXJzW2ldKTsNCj4+ICsgICAgICAgIHJjID0gdnBjaV9hZGRfcmVn
aXN0ZXIocGRldi0+dnBjaSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXNf
aHdkb20gPyB2cGNpX2h3X3JlYWQzMiA6IGd1ZXN0X2Jhcl9yZWFkLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpc19od2RvbSA/IGJhcl93cml0ZSA6IGd1ZXN0X2Jhcl93cml0
ZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnLCA0LCAmYmFyc1tpXSk7
DQo+IFlvdSBuZWVkIHRvIGluaXRpYWxpemUgZ3Vlc3RfcmVnIHRvIHRoZSBwaHlzaWNhbCBob3N0
IHZhbHVlIGFsc28uDQpCdXQgd2h5PyBUaGVyZSB3YXMgYSBjb25jZXJuIHRoYXQgZXhwb3Npbmcg
aG9zdCdzIHZhbHVlIHRvIGEgZ3Vlc3QNCm1heSBiZSBhIHNlY3VyaXR5IGlzc3VlLiBBbmQgd291
bGRuJ3QgaXQgYmUgcG9zc2libGUgZm9yIGEgZ3Vlc3QgdG8gZGVjaWRlDQp0aGF0IHRoZSBmaXJt
d2FyZSBoYXMgc2V0dXAgdGhlIEJBUiBhbmQgaXQgZG9lc24ndCBuZWVkIHRvIGNhcmUgb2YgaXQg
YW5kDQpoZW5jZSB1c2UgYSB3cm9uZyB2YWx1ZSBpbnN0ZWFkIG9mIHNldHRpbmcgaXQgdXAgYnkg
aXRzZWxmPyBJIGhhZCBhbiBpc3N1ZQ0Kd2l0aCB0aGF0IGlmIEknbSBub3QgbWlzdGFrZW4gdGhh
dCBndWVzdCdzIExpbnV4IGRpZG4ndCBzZXQgdGhlIEJBUiBwcm9wZXJseQ0KYW5kIHVzZWQgd2hh
dCB3YXMgcHJvZ3JhbW1lZA0KPg0KPj4gICAgICAgICAgIGlmICggcmMgKQ0KPj4gICAgICAgICAg
IHsNCj4+ICAgICAgICAgICAgICAgcGNpX2NvbmZfd3JpdGUxNihwZGV2LT5zYmRmLCBQQ0lfQ09N
TUFORCwgY21kKTsNCj4+IEBAIC01OTAsOCArNjQ4LDEwIEBAIHN0YXRpYyBpbnQgaW5pdF9iYXJz
KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICAgICAgICAgIGhlYWRlci0+cm9tX2VuYWJsZWQg
PSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcm9tX3JlZykgJg0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBQQ0lfUk9NX0FERFJFU1NfRU5BQkxFOw0KPj4gICANCj4+IC0g
ICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwgdnBjaV9od19yZWFkMzIs
IHJvbV93cml0ZSwgcm9tX3JlZywNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
NCwgcm9tKTsNCj4+ICsgICAgICAgIHJjID0gdnBjaV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXNfaHdkb20gPyB2cGNpX2h3X3Jl
YWQzMiA6IGd1ZXN0X3JvbV9yZWFkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpc19od2RvbSA/IHJvbV93cml0ZSA6IGd1ZXN0X3JvbV93cml0ZSwNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcm9tX3JlZywgNCwgcm9tKTsNCj4+ICAgICAgICAgICBpZiAo
IHJjICkNCj4+ICAgICAgICAgICAgICAgcm9tLT50eXBlID0gVlBDSV9CQVJfRU1QVFk7DQo+IEFs
c28gbWVtb3J5IGRlY29kaW5nIG5lZWRzIHRvIGJlIGluaXRpYWxseSBkaXNhYmxlZCB3aGVuIHVz
ZWQgYnkNCj4gZ3Vlc3RzLCBpbiBvcmRlciB0byBwcmV2ZW50IHRoZSBCQVIgYmVpbmcgcGxhY2Vk
IG9uIHRvcCBvZiBhIFJBTQ0KPiByZWdpb24uIFRoZSBndWVzdCBwaHlzbWFwIHdpbGwgYmUgZGlm
ZmVyZW50IGZyb20gdGhlIGhvc3Qgb25lLCBzbyBpdCdzDQo+IHBvc3NpYmxlIGZvciBCQVJzIHRv
IGVuZCB1cCBwbGFjZWQgb24gdG9wIG9mIFJBTSByZWdpb25zIGluaXRpYWxseQ0KPiB1bnRpbCB0
aGUgZmlybXdhcmUgb3IgT1MgcGxhY2VzIHRoZW0gYXQgYSBzdWl0YWJsZSBhZGRyZXNzLg0KQWdy
ZWUsIG1lbW9yeSBkZWNvZGluZyBtdXN0IGJlIGRpc2FibGVkDQo+DQo+IFRoYW5rcywgUm9nZXIu
DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

