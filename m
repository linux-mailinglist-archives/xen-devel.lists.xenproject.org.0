Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8BC49F954
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 13:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261983.453939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDQIG-0003zR-T2; Fri, 28 Jan 2022 12:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261983.453939; Fri, 28 Jan 2022 12:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDQIG-0003wX-P0; Fri, 28 Jan 2022 12:23:56 +0000
Received: by outflank-mailman (input) for mailman id 261983;
 Fri, 28 Jan 2022 12:23:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBCP=SM=epam.com=prvs=402709c4a7=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nDQIF-0003wR-BG
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 12:23:55 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26582205-8035-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 13:23:52 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20SCHmu8031754;
 Fri, 28 Jan 2022 12:23:47 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dvgc2r2jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 12:23:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AS8PR03MB7256.eurprd03.prod.outlook.com (2603:10a6:20b:2e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 12:21:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 12:21:09 +0000
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
X-Inumbo-ID: 26582205-8035-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VF5brUyIuxa++prqKXoFYGohFhtEMyQAFsfz6wi8B0ERC3e5D3q+RN/mQ92PgaqxGeqrlyslPIzZ7V3IywORZ2k492A48929KsjnRyc2q9TpU89k8gk8T140dFFf1pgzXNwS4d1JAJzzEMiBq98rCHsJlTpykKeedlfzRs87r1MjQ86WJhcSt6fSHkiP4hKhdlVntN1awdYlOLPmDK5qSt9MODc7Rk4ud+6UBbOjM1PGmW/PgsdGe8pLejqDnQt5Uc7AG9pOMwemX3zY8NXSYVMYeXn/4H2sMgEyh4+ZoB1Z/cC80zRsf13eFxUupbIK50+J7OlWq0tTf/p0JcZIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tx0e/oqjV1uLH9gyiTqXXT74vkpnxNakMYuIGCdco5I=;
 b=ORteBCNkcDeJyavhnFwvVv3j4/pTvSOMAzhQwV4mAHOts0IUAjfWtwqpmHGksg9gFYNO3ceDt5+qVxAZlrF8Hwc2sHscCJoRqFy3GMyf//nYteAE+qn2asdV2Eda6IP7bs6FMFkcdOdxAHDe+QQqLPyY9lxqhcGevLpARmOMSSIxOF+XRvDDGe711aOF9l/hK8L+VX/Ik+9OEsncKSkhEWnVYr2RFr7d1MDBFkxP9KvXVeZxaUW8RqwpFMUqbIsyOnsSa/BQ6Im2Y95Q/By2ailEE1Dt5fA63gpqVGhPwrf5hYO+STi7yV7Pl8gIGMWX+/Ajri5yFpWThiOCAOkz8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tx0e/oqjV1uLH9gyiTqXXT74vkpnxNakMYuIGCdco5I=;
 b=HT7iwKsPX6OpnDqfp+tAEpfQaOiakCNGw9idX2tVFdJN8SOxoSDhO4KMDIr6SelLKPLwlDFQnQkw2xX/SsMJZ/KKnUH4ddEP6FRm2qDtUnPRHoGnZiZ/Kn2UQPUUYVfU4lGP17Tq8bMA0FvKZOzdjPuKt7g0skpXJIPiW6nEUhPnxkRH2q8Va97tkCEqU8MnuE/1v+cUDFvtSCsoynh5Bb6j1u4pSgFjqNNPFmvJML6xw4N+CyDdij+07p+SZ/N1Ls4OjS7h54unA4LwS/sP+pDUnWFX5G1FaLGKEbdV1nmsFDjkNAl52Drru3s0OJ1jOSdVOXD3IQEREggtaJzD6Q==
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
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 04/14] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v5 04/14] vpci: cancel pending map/unmap on vpci removal
Thread-Index: AQHX4ewFMUIx3Ap2dEiG4Ts6A1fyCaxfzfoAgBjxPAA=
Date: Fri, 28 Jan 2022 12:21:08 +0000
Message-ID: <13911739-3d9c-c56b-4f3a-766fbdb0b82d@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-5-andr2000@gmail.com>
 <7dd52b2d-9fe0-0ece-a7f1-9ec2c6da72de@suse.com>
In-Reply-To: <7dd52b2d-9fe0-0ece-a7f1-9ec2c6da72de@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 053e424e-0b56-4e1c-df4b-08d9e258aa39
x-ms-traffictypediagnostic: AS8PR03MB7256:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB7256C8E3E62033C753B49730E7229@AS8PR03MB7256.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NnkLKKiV+JUMQRFp/zKLGFeAFx+s35U33ctt458bhERW7DD3r09t5PdWdyGwB892zDcDqfddFbI2ERG74fv1ljEGl02mymrCq7l3fl9PyKcZlN2RWLe3NiXt2KMYpc5OlRhonpJmIf7Ydv01fZEzblsHk0jIF7Ap6i/EcPjwM7W+yfL9fqW+QrkACLaojYrDSAiqCpfmBCJzjAjCurvtNlt3V5fVSSdJ7LUqY/fGMynwXa51vB4+rJKumUKl7uKGnqoGa0dlmzAkPN+L0DJdHYFWivpxGmvlqnWB2DpucKYklZeO8mI3PwfLXNgqSrUoLTloIUpukkqUtfqwef4LPZSL/xWRgkvjq/WqLjfaj9or+N5yep95faagXA5FRWK3E9lir12QExFQ+hJP5DKAI2MvmYMNSbxcBMnSvyXojPJNMWoR0e+KFI6qLhmVxSdcDKqUKdy9/aMUWY8P86oIDj4r0MGwk7kW78N82sLsbkvj9Km1c8hTwzB6Qcgm8PyHzCf+3O87/26765Jj0tM0iX40xsml1THlcDf8IuAc4S6Z2xuh7c/4bijNtnIxaZH1uvvgY8M4JIkDNNT/xGWUehIMNMkYP9So/dBIDLuVm5BCbXatJnJQmtZ+wQWd2kW9mO1JcWpD7OxP2q3KTol6cFHSvchtHssKYmM2rDsascsp6qQnvgLl5/Z7+cf0mMf/zYpn6YgbdRLg3wbxzl+uCV+yGkEtMReo2LNHA2+z/Y8AsSRgu3CbbpBLSqc71Ozo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(38100700002)(26005)(83380400001)(2616005)(186003)(122000001)(53546011)(71200400001)(6512007)(6506007)(38070700005)(2906002)(8936002)(31696002)(5660300002)(64756008)(66946007)(8676002)(7416002)(66446008)(66476007)(36756003)(86362001)(76116006)(4326008)(66556008)(54906003)(6486002)(91956017)(508600001)(316002)(6916009)(107886003)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MkwwRlV0ZnNoMkRJcGNHa2xtaG9wekpBN2VORjJjS1Q2a2VLdGVXNnU1bHdv?=
 =?utf-8?B?RkpiUWFGZEJFSEFaRThpNVZ2UXNPT0tGc0ZWZU1nVGFtdHhxZzU3U1dRZ1BJ?=
 =?utf-8?B?K1lpM1pDZGYwb2xqR1JjMmpoazJQWE9Fa2MwVkt5YXlIdUEwM09oTjVrVW5w?=
 =?utf-8?B?WmhkZFpHQTVpSXlCeGNWaXBDUHRSV0xBUkJJckVpdUFVb1RzR3ZVKzg2Q25y?=
 =?utf-8?B?R3NWcnlnZkxhYUc5MTlpTk42SVRvM2FNT3U2eGw1b3U2L09Tdmo0WktsdlJE?=
 =?utf-8?B?REg3c1JVSFhvWHNHeE5BbzMwY2hjcFRUdkhKQTR0Rk15K25OeEtoWWcvOHNB?=
 =?utf-8?B?YWp4Zi8zZ2ROd1h4SEZFak51cmhxZ2l3ay9IVklVcHhKUEFsUEk5M081dEd4?=
 =?utf-8?B?WDhtMHJ3a09RQzdlTmlIdmF3anVnOEtFVTUxbWJUMGRkQU9yRnc2QlBucjZp?=
 =?utf-8?B?RzVlUW5LWEsxL2hJQ2ljMzZ6SzVWMERQc3lEL1Y2UTJIRURRZFFLRHIvTGZm?=
 =?utf-8?B?YmlFNUsvc2xma0s1Tlo0Mk4vRExIZU9lRUF1OHROSDIxa0x6Z2VzYVRYT1dZ?=
 =?utf-8?B?WXM2MkJCU2tvTUw1WjdmZGpYMzdJNENhN01vTjFmYUd2UFFGcHN0TURCcGxZ?=
 =?utf-8?B?eDF1di9oOTB3TENTc3lKUE42d0ptc1hsMldRTmF1K2dsRUM3TGN0TFZyeWFm?=
 =?utf-8?B?TVBUNGFSZjl4UXhVU0RwUFFLRFhYc0JRaDdPVGJPNW1xNXArMzJDWWtmUzk3?=
 =?utf-8?B?ZS9iTm5RZStUSlY4YTR5WTZQaFhzNVhmSkEvR2ZLbUg3M0tpaWs5elVXelFv?=
 =?utf-8?B?dGFMV2lOYklhMDRZek55Z2pZdFB3OStSaUtITG1YLzNKa3lFelF6RkxrMzdK?=
 =?utf-8?B?am9RaUhId1FwbXlqSE1QWGxPcEZqVVlpL3IvR1hJUlRzTERWSngrZll1Ujl0?=
 =?utf-8?B?RXNDWlREWWQrNGFOZjV1eFB5ZnRMVlFEd2FzTEpXMWdtVUlXYk5ka085QjA4?=
 =?utf-8?B?NFZScGdNaHRZQW9ZUStzdDFEVmVMdTMwZ1RZVzQyeG5RRkdZK1U1SUNMck5Q?=
 =?utf-8?B?M3dxT0pyU29DbjArYWVSWFBobS9aN0NXS0w5YVluNVJiSE9sa0t0V1grVlVl?=
 =?utf-8?B?MTVybzMwYXJsVmlodG9qRlVWY3hpTWVDcmJMQjZIbXZpbWJCY01VM0pLSjFw?=
 =?utf-8?B?R3pFelJ5VW1wSEErQlg0b2Zha1ViRnloZ2hnY1JCbjRoZWFzSTEvc0grbW5Q?=
 =?utf-8?B?YjhkaEc0d1RrUmtlWk5JcVc4QnA0SmJweUdaRjVBaWMwdWc5TW9aYTBtZHdI?=
 =?utf-8?B?MjYvTEE4OUtqZ05ZZVRhV0tKWnNUODQwamVEb3V1VjJxenVvY2grbkdsb3N1?=
 =?utf-8?B?ZEk2ZFovWWJiRFdHRkxhalNTYnNGODBiU0N4TDgrQkNTL2hvSDNEaDhpNlJP?=
 =?utf-8?B?UVh3aXprYUNkTkFwSVVScFZjeEJiNzFoMnVOKzdDY1RXdGUxSVhRZmdqMThD?=
 =?utf-8?B?Nm9ETk5OZkszVWlZZytXZUlGWUx4MkFJZEZ6TjkyQWE3WDZlSVltTVdoTnJK?=
 =?utf-8?B?amdVZENGcFBoV3k0Y3E5OFJicHhmbkw3L2pWc1ZjOTBFckJCQkJXS3FBREhr?=
 =?utf-8?B?RVRGVnBvblN4b0t3SjRIeUVmeEtEbGJ3R1YxbEQybGJPbTlyUFcwTmY3YVdv?=
 =?utf-8?B?bzlRNVBqZ2grbjBkMnhZSTFoTVNuRTRCNEkwd1RDVzduY0R1OGlBNCtTbGFJ?=
 =?utf-8?B?aXlSdW55djZVSnphSTRzcHNHYW1WZ3pMUC8rZ1lQdjEvZlVjaTZzc3NoVGJF?=
 =?utf-8?B?R25kVzNPOXU3akhpOXNGcm9QTWoyMVBkZStGYVExTWZMbWxoRWtsTXF2ZjdB?=
 =?utf-8?B?R2d4bkhrRWNjbnFxSkZBZ1I2dmlMY0t4bE9hR2lDdnFlRm9rNUQ4cW4vMVgw?=
 =?utf-8?B?S0EvbmVBZFE5NFRHVVIvNVRZZmMvNk11cWphRGVqTU5jQ1hNMThXZXFvb3ZG?=
 =?utf-8?B?Z3R0YmUvMkkwdWhHeDJ2N3lYRmVhdVMyUGNzME9OOU9qajZBMW1xTzNEZmtD?=
 =?utf-8?B?bjU5UnE0elRMQ1hGMjVRTHhTekNLcGQydE9CTnh5aFlxRlRnUHZDSEJicXdp?=
 =?utf-8?B?QmpWY3dWTUhwNGZGRWlvQUdMcXpzSks3U3pxU1RhbVl6YXlFYlE2Y3Zqb0tv?=
 =?utf-8?B?cGJSbVRzOFVPZ0dyYUFXbFMyOGNTb2NBSUg3cnJhRndqR0VIWlVVNVNPbmx6?=
 =?utf-8?B?a0UrWGMxY1lRdlh0TXNiTkZSZDFGSFc0UjVjWFVIV3l1cmJlQk9hd24vOFpW?=
 =?utf-8?B?RXB1NGRabzBWc2ZUYkl3b3B5U000M2FaMldoUXQ2enJhWUxSMDIzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50C82F557F52C849BCE743658958ABC8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 053e424e-0b56-4e1c-df4b-08d9e258aa39
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 12:21:08.9773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 86gh7Sj4Pnz/f4jUHNJxasZSgu9QIbUBFI5UIupZCVNjFIx7XmwGbXY/9IrLWEsEsgyo/iHFog9erAY8N4Zq09K9APMxzX+f+0UP15LI3KrAB/01e6npGU4gFMzv/UfU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7256
X-Proofpoint-GUID: CYoH7y4d97sGIeFjIvHRgIVX-uPWM6XT
X-Proofpoint-ORIG-GUID: CYoH7y4d97sGIeFjIvHRgIVX-uPWM6XT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=923 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280078

DQoNCk9uIDEyLjAxLjIyIDE3OjI3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjUuMTEuMjAy
MSAxMjowMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0K
Pj4gV2hlbiBhIHZQQ0kgaXMgcmVtb3ZlZCBmb3IgYSBQQ0kgZGV2aWNlIGl0IGlzIHBvc3NpYmxl
IHRoYXQgd2UgaGF2ZQ0KPj4gc2NoZWR1bGVkIGEgZGVsYXllZCB3b3JrIGZvciBtYXAvdW5tYXAg
b3BlcmF0aW9ucyBmb3IgdGhhdCBkZXZpY2UuDQo+PiBGb3IgZXhhbXBsZSwgdGhlIGZvbGxvd2lu
ZyBzY2VuYXJpbyBjYW4gaWxsdXN0cmF0ZSB0aGUgcHJvYmxlbToNCj4+DQo+PiBwY2lfcGh5c2Rl
dl9vcA0KPj4gICAgIHBjaV9hZGRfZGV2aWNlDQo+PiAgICAgICAgIGluaXRfYmFycyAtPiBtb2Rp
ZnlfYmFycyAtPiBkZWZlcl9tYXAgLT4gcmFpc2Vfc29mdGlycShTQ0hFRFVMRV9TT0ZUSVJRKQ0K
Pj4gICAgIGlvbW11X2FkZF9kZXZpY2UgPC0gRkFJTFMNCj4+ICAgICB2cGNpX3JlbW92ZV9kZXZp
Y2UgLT4geGZyZWUocGRldi0+dnBjaSkNCj4+DQo+PiBsZWF2ZV9oeXBlcnZpc29yX3RvX2d1ZXN0
DQo+PiAgICAgdnBjaV9wcm9jZXNzX3BlbmRpbmc6IHYtPnZwY2kubWVtICE9IE5VTEw7IHYtPnZw
Y2kucGRldi0+dnBjaSA9PSBOVUxMDQo+Pg0KPj4gRm9yIHRoZSBoYXJkd2FyZSBkb21haW4gd2Ug
Y29udGludWUgZXhlY3V0aW9uIGFzIHRoZSB3b3JzZSB0aGF0DQo+PiBjb3VsZCBoYXBwZW4gaXMg
dGhhdCBNTUlPIG1hcHBpbmdzIGFyZSBsZWZ0IGluIHBsYWNlIHdoZW4gdGhlDQo+PiBkZXZpY2Ug
aGFzIGJlZW4gZGVhc3NpZ25lZC4NCj4+DQo+PiBGb3IgdW5wcml2aWxlZ2VkIGRvbWFpbnMgdGhh
dCBnZXQgYSBmYWlsdXJlIGluIHRoZSBtaWRkbGUgb2YgYSB2UENJDQo+PiB7dW59bWFwIG9wZXJh
dGlvbiB3ZSBuZWVkIHRvIGRlc3Ryb3kgdGhlbSwgYXMgd2UgZG9uJ3Qga25vdyBpbiB3aGljaA0K
Pj4gc3RhdGUgdGhlIHAybSBpcy4gVGhpcyBjYW4gb25seSBoYXBwZW4gaW4gdnBjaV9wcm9jZXNz
X3BlbmRpbmcgZm9yDQo+PiBEb21VcyBhcyB0aGV5IHdvbid0IGJlIGFsbG93ZWQgdG8gY2FsbCBw
Y2lfYWRkX2RldmljZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gLS0tDQo+PiBD
YzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IFNp
bmNlIHY0Og0KPj4gICAtIGNyYXNoIGd1ZXN0IGRvbWFpbiBpZiBtYXAvdW5tYXAgb3BlcmF0aW9u
IGRpZG4ndCBzdWNjZWVkDQo+PiAgIC0gcmUtd29yayB2cGNpIGNhbmNlbCB3b3JrIHRvIGNhbmNl
bCB3b3JrIG9uIGFsbCB2Q1BVcw0KPj4gICAtIHVzZSBuZXcgbG9ja2luZyBzY2hlbWUgd2l0aCBw
ZGV2LT52cGNpX2xvY2sNCj4+IE5ldyBpbiB2NA0KPj4NCj4+IEZpeGVzOiA4NmRiY2Y2ZTMwY2Ig
KCJ2cGNpOiBjYW5jZWwgcGVuZGluZyBtYXAvdW5tYXAgb24gdnBjaSByZW1vdmFsIikNCj4gV2hh
dCBpcyB0aGlzIGFib3V0Pw0KSnVzdCBhIGxlZnRvdmVyIGFmdGVyIHNxdWFzaGluZyBXSVAgcGF0
Y2hlcywgc29ycnkNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

