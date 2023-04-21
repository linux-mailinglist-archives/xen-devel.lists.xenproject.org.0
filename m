Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FCC6EA8BE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 13:00:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524552.815580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppoVK-00045u-MM; Fri, 21 Apr 2023 11:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524552.815580; Fri, 21 Apr 2023 11:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppoVK-000441-JV; Fri, 21 Apr 2023 11:00:38 +0000
Received: by outflank-mailman (input) for mailman id 524552;
 Fri, 21 Apr 2023 11:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfVw=AM=epam.com=prvs=8475e47d9c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1ppoVI-00043t-HW
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 11:00:36 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcf94745-e033-11ed-b220-6b7b168915f2;
 Fri, 21 Apr 2023 13:00:34 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LAYHED000610; Fri, 21 Apr 2023 11:00:26 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3q3ruqg39b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 11:00:26 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAWPR03MB9763.eurprd03.prod.outlook.com (2603:10a6:102:2f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Fri, 21 Apr
 2023 11:00:23 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3%3]) with mapi id 15.20.6298.045; Fri, 21 Apr 2023
 11:00:23 +0000
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
X-Inumbo-ID: bcf94745-e033-11ed-b220-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k43S677qxAtYNyAvJdhUCAeF4vLrCy4T31FiMLoufSBaQLw2vedKeXXHjOhAQf3Bg3rqVeV5F1WstPMWdNV9YHdR6etFcsyn7G3TD8QyJ+QSaK017MvSCo7UQ5BqRfQ4iNwdK61EUjXOwiDWxxbYeIsjVU2K1/wZKpb1yLhBJEMXhbAtTDTsQ+B66l8guKy8N/T3mj2D62qIo7ko6vITWrr7kytrRbf/fOaUHfrikfELpfXB75I+rn7dunG3bXCva5Jjp4gev1UsrTsjjqjJfiML43qFgv37NtjTdeP7j8VWyCZxRlgAn5MdabO95gJOzPcIfDpqIURE6wWZej3a5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXpGAsbDl1+pcBwnQ4KaJ4T5yV79/jNFVUPdgjrUxcI=;
 b=UXq1LG4UvqNHFwNG2TcGfatLKIQhZ/h71ea3lmB0G+iGqG48Mr1+XTCngchwac35VQl/jVtynbK4X+8262T+RPqHv3PUTwRoH3SnuGAlJ0S3RhsOLUsUMOPxXVltXw2l4pt/q6sC4qk+HLO557tbWOXug/e4+tP1TwBDG99ur71j23J0o+nKGVN/Wt8JzTReNTn0Tr4RZPOLEUcdHfxFrUJbzBuysXh25L/oHqpZ0Yfcgt6YiTjs0yyRTHHSo14PwIeYHr66OCH8rozPcvf6bimZXLjAzrEGpAqNgMRZb5KWYW+D0XgBWaEKObo5ZCfHEGAg5549WNkT+KfMavj/iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXpGAsbDl1+pcBwnQ4KaJ4T5yV79/jNFVUPdgjrUxcI=;
 b=HUVAvyUDZi0GMvGAdwI2kc1IzkCRGl3zX9J+SXZ3iU3D6rrby6xWJNL0m3Y6sC77rqDDr8nVPcJS3mxsI+X3cYJ1V3ASZtr66oyNZV4/Q9Uwyjii6s6Ma4XGmekqacjAfbhpWt+dPNhVVpe9j3irxF7IlXT3aZu5vEcPNXn8O//jet8MG+wcAIxpwLkjQ+uhuKjhcMlRPYWyjAN+rz7I4GUhaiNbef3GsfS0F+r5trFfslZRe53Is/mUI/rvXmsDy+iLy3rodSOB9fswvnQLFwKZH60lwrdsEqUFS1nEgHzpHDqBvMQlXf8MMg3dj+ySBNSvX7oVWzxoiFh/y4DGfQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Thread-Topic: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Thread-Index: 
 AQHZVrdzsdckomMx4kauxHkZQ597Iq79mAMAgClI2ACAAK/igIAAVGGAgAGe14CAAJvOAIAFXoKAgAAEr4CAAAS6AIAGQ32A
Date: Fri, 21 Apr 2023 11:00:23 +0000
Message-ID: <87354t8pqg.fsf@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger> <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger> <87v8i0wyv0.fsf@epam.com>
 <ZDgZEZIG89oW6rEw@Air-de-Roger> <87leivw8qp.fsf@epam.com>
 <ZD0cyXLt1knXyUzA@Air-de-Roger>
 <963624f1-a36a-5d48-c34f-552d9d6c4950@suse.com>
 <ZD0krtCOrEwiKMFP@Air-de-Roger>
In-Reply-To: <ZD0krtCOrEwiKMFP@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAWPR03MB9763:EE_
x-ms-office365-filtering-correlation-id: b5c0f831-f678-4d12-3abf-08db42579aee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u/1Eiw5zqfnewMciSVzRrTFXH8dFUtSzgG43z1yVf80yMzk8UKaX1LZ5TtSj5EeLPJmpb4hRa7uKryW5NOztxrGexhQHg99sI3DDG3og4Und3YrBP80Wy0mb7vVCKvt+rWR/978MrcX+88LjmcA23bQ8o2PlYSPTBQmMHznkDUE090MdtoOQZqqOkx/wFimAA/lHne5jEm5Wjn+ZnuHfQw1tLW9azeYUYQERls31mvZJ2z6TbJ5u+8MeUMM1Zs6ZXY4eDAK1ff72W1gY/8GhPZWWwSDOtkyjto/OewolhvrR/dsRi4WEUW5yRXwLj50olY8FoLHYk0yrN7kMQCCkhbzxEtrCTkLO+p3zTjacn4J6U7bf1g87IdT3SEA21Z4yCQZhkcQIi20VoaHJ7Uh3eExY1ZnQ/fjlTo+lNgv7UzusGU12SK4wbwCr7XxHU5aJUHd9oJeoCms4st7vwMs0A8t+lPIc5py6gf0A9MHe5EPnmVjO1xpN1W/bN+C5iLLHELFD7LmRN1RCk3TAY0sQT0u+NZ4qyhdClz2IkxbwQh6j8GUSBETP2j4+8TYwIgMxZVp7TRlldZvXvJdGa8U3fy0JX9Y3mgyb7IRubIqDir5DK+q6apjzJPwjsSHSlv6j
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(451199021)(66556008)(66446008)(64756008)(66946007)(66476007)(316002)(6916009)(4326008)(76116006)(91956017)(6486002)(86362001)(54906003)(71200400001)(478600001)(5660300002)(36756003)(7416002)(2616005)(8936002)(8676002)(122000001)(83380400001)(2906002)(38100700002)(41300700001)(38070700005)(186003)(26005)(53546011)(55236004)(6506007)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?alVNVG1leStFMjUzSS9XelJSQ1VYVlNNdWlweEtyczJib24yNGlyNCtsT3Zp?=
 =?utf-8?B?K29XMElRVkk1cVY3NElmNnlqZ1dUc3BRYXdNbjdNTUswWmVVbG51ZHgrS3J6?=
 =?utf-8?B?bGpNVEIralRYeW9DSERKR211SFhUOEdJYjhndWUzM01xelRmZElLaUhNM29G?=
 =?utf-8?B?VGRUTnlYaWxQQThMVXNIdndPZHJ4NVRXbjZnNnA5VWpTeHRSY3Z3OGxsUGR3?=
 =?utf-8?B?YWJnR3ZWYVJMclRPb1lYanZjeFcraTRkL2pBSkJZT3Q5cDl1N2hqSy9IY2tl?=
 =?utf-8?B?NUd3cVQvNEsyQkJMdUZ1azRCSDJOWTBkdmVqLzMvTXA1eXlBVkpocFptaHV6?=
 =?utf-8?B?d3VCR0ZVUGVWRWpRT29WVzM2MjM5YTJQeTZvRlQxU2JUMjFZRVI0MDNhSmR6?=
 =?utf-8?B?VjVXWENpUitvd0hPUUIvSlJ4eFZPeVdYZWtFa0VlQUpKWXdJbXhOaGw4K2pI?=
 =?utf-8?B?WWxKZXR3bXU1SUcxejRaeTZTTmU1QmdFSzYxU3dERVNVZzU5emd6T25GdlFv?=
 =?utf-8?B?cjFzQWowd1BCOVE4L2VUSStOTmZPaWR4eUtORFNKQmVnQWpVL3Y1aFZTKzNI?=
 =?utf-8?B?K0hvb1pYNTVjVXg3MFFtREJmbWYyV3ZzOTZVbG5DelhQcUw5ckF4VUFXc0Rv?=
 =?utf-8?B?cHYrU2FzTFprWjBtMHdNWHkyS1UzVFpqVVlDa29DMXFjdmhzb3AySHVFdEhP?=
 =?utf-8?B?cGQrQTJlYnJpd0l3cm9XZHZ4YjNpdCs0K0tjQ3lrVTliSzZ3MWVxWVlUKzdn?=
 =?utf-8?B?NmFHUEdhbmdOTHorSThHVGNvWDk3RmJuZENtOS9CK0l1ZGtMb2ZHd3dTMUo1?=
 =?utf-8?B?VUtDRDUzZ3RROHpFU0kyMVJUWXl2RlNwRTU3TkYwamo0bHFNSlhvR2tXdG9M?=
 =?utf-8?B?VTJRZnRNaXN5cUtaeUNwak5jbmdGS0FybTZ2aXVWcERIb01MZjZBUzVGVVNm?=
 =?utf-8?B?UkxXYzNUM0xOa2ZsWGxpMU44TjdIMFRtb2FsaFZQSjVzS20xMW1JOUxDaU9v?=
 =?utf-8?B?OFhPRURwY2hqdVFXU0s0TXZTaXVZaXdSSjZNQkRpaUJPSFYwV052M1kyTkdp?=
 =?utf-8?B?WEZhTkoyZzEvZGtES3VmQkdlVHJCNVFTNnRzL2hnMmgrd3VVTWwrcTNqSFl2?=
 =?utf-8?B?eEtjRGVhc2xIL01ZelhtWVhkcGErbWFUZDFPTXBDdHRnUEh2elkzelQveHRr?=
 =?utf-8?B?M2Ywa3VHamNQRExQaWduNSthSlJaVEs3dGdZQm8rV3dMY1lYRkR0cTRyZVBU?=
 =?utf-8?B?RktiVWtnZm1NSUZSblJaMEtFWSs3RDZhSlo0d3ZFbEVQUUZDUWwxVGVkWDUv?=
 =?utf-8?B?SmptVUZFSGFLc0toY1ZMRUx6dTdwYzlpaXNIM2JCNWlyVnhENzRyNUkxbUhP?=
 =?utf-8?B?QnV3SHZEWjhZUEhzZjE1U25PanlSa1R1N2pwZndFM0tDVGlack9POGsrdXhG?=
 =?utf-8?B?dm03QlNuL0ZiRFg0QUxpQVUrR1A1Q3IvQXo1OU11YzdSZnI1OG9qTVdhTGRG?=
 =?utf-8?B?QTVwMlpoQ2dnNWNqVVlKWVpPQ2FWZUpocUhPd0NuUVEycUZRNnNFYVpCVmJQ?=
 =?utf-8?B?RVFWTzRYYVZVaGNKK1hhSG0wdzVUN0xpVjUvZkRiZnBZRnBlT1pGcW85OVNn?=
 =?utf-8?B?RXg1OWlGUjR6UEdIMVk2R00zRXI3SjFsTDh0VzZaVUNucE1nSlByMGlvc2RS?=
 =?utf-8?B?cHJ1K0JuT1Y0MnNoUTFZL2htT3RON2RMMEpaL2t3MVFDWldibFYrMEJaVUFy?=
 =?utf-8?B?M2ZZUDdlaWpTN0N3UWpKNEpKNkc1MlRES1ZNT1R5RGFkQzRjcE9PM3dpQXRU?=
 =?utf-8?B?WnF5Y1FWdC9VR0lBeGhvbyt2UDdxeFI2eC9xVy9MeE9MaW8rM2lQdEJsVlZi?=
 =?utf-8?B?WEU4VUlGcmFHc051QkpONW03dWlsbWh6RkhoME93ODRtYi95OGpOOFRaN3A3?=
 =?utf-8?B?djQ4b2pmcFpKbVU1ZlQ1RHZMd0Q0YmJZV1BLR2J6Q25JbUVET1lGbjA2WDFS?=
 =?utf-8?B?K3d6MmlmUUtYUkp4azdGTEwwbFVheENsTFN3TmczMHZKUjZIU3hEbWFTRkZi?=
 =?utf-8?B?eEVKYXVUYWloUENWelhEbWlIMjdmMjlxcmFSaS9oSWRkWGU1enJ6SllmM0hU?=
 =?utf-8?B?SEF1NlVmZ25hRTE2T1BGd0FMaGdmZ3I0OWZqYWdKbXEwaDJCenNNTmF1ZEU5?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9C7CAA54E123547B6EA5B3E53AAC3EB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c0f831-f678-4d12-3abf-08db42579aee
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 11:00:23.1857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XiIilNslULr/JeE4s5tfHPWf1AuKhb7ZS19ACn75h9HwjgBDomvbk0HLNPhwsoJvBjXsvjzHL5iJxzv57rc8kJUMPMeIqtfuC1OOaORsrAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9763
X-Proofpoint-ORIG-GUID: 27dSJjLw8rel6mzE-qVgG2R72_XhfpYh
X-Proofpoint-GUID: 27dSJjLw8rel6mzE-qVgG2R72_XhfpYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_04,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=885 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304210095

DQpIZWxsbyBSb2dlciwNCg0KUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
IHdyaXRlczoNCg0KPiBPbiBNb24sIEFwciAxNywgMjAyMyBhdCAxMjozNDozMVBNICswMjAwLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDE3LjA0LjIwMjMgMTI6MTcsIFJvZ2VyIFBhdSBNb25u
w6kgd3JvdGU6DQo+PiA+IE9uIEZyaSwgQXByIDE0LCAyMDIzIGF0IDAxOjMwOjM5QU0gKzAwMDAs
IFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPj4gPj4gQWJvdmUgSSBoYXZlIHByb3Bvc2VkIGFu
b3RoZXIgdmlldyBvbiB0aGlzLiBJIGhvcGUsIGl0IHdpbGwgd29yayBmb3INCj4+ID4+IHlvdS4g
SnVzdCB0byByZWl0ZXJhdGUsIGlkZWEgaXMgdG8gYWxsb3cgImhhcm1sZXNzIiByZWZjb3VudHMg
dG8gYmUgbGVmdA0KPj4gPj4gYWZ0ZXIgcmV0dXJuaW5nIGZyb20gcGNpX3JlbW92ZV9kZXZpY2Uo
KS4gQnkgImhhcm1sZXNzIiBJIG1lYW4gdGhhdA0KPj4gPj4gb3duZXJzIG9mIHRob3NlIHJlZmNv
dW50cyB3aWxsIG5vdCB0cnkgdG8gYWNjZXNzIHRoZSBwaHlzaWNhbCBQQ0kNCj4+ID4+IGRldmlj
ZSBpZiBwY2lfcmVtb3ZlX2RldmljZSgpIGlzIGFscmVhZHkgZmluaXNoZWQuDQo+PiA+IA0KPj4g
PiBJJ20gbm90IHN0cmljdGx5IGEgbWFpbnRhaW5lciBvZiB0aGlzIHBpZWNlIGNvZGUsIGFsYmVp
dCBJIGhhdmUgYW4NCj4+ID4gb3Bpbmlvbi4gIEkgd2lsbCBsaWtlIHRvIGFsc28gaGVhciBKYW5z
IG9waW5pb24sIHNpbmNlIGhlIGlzIHRoZQ0KPj4gPiBtYWludGFpbmVyLg0KPj4gDQo+PiBJJ20g
YWZyYWlkIEkgY2FuJ3QgcmVhbGx5IGFwcHJlY2lhdGUgdGhlIHRlcm0gImhhcm1sZXNzIHJlZmNv
dW50cyIuIFdob2V2ZXINCj4+IGhvbGRzIGEgcmVmIGlzIGVudGl0bGVkIHRvIGFjY2VzcyB0aGUg
ZGV2aWNlLiBBcyBzdGF0ZWQgYmVmb3JlLCBJIHNlZSBvbmx5DQo+PiB0d28gd2F5cyBvZiBnZXR0
aW5nIHRoaW5ncyBjb25zaXN0ZW50OiBFaXRoZXIgcGNpX3JlbW92ZV9kZXZpY2UoKSBpcw0KPj4g
aW52b2tlZCB1cG9uIGRyb3BwaW5nIG9mIHRoZSBsYXN0IHJlZiwNCj4NCj4gV2l0aCB0aGlzIGFw
cHJvYWNoLCB3aGF0IHdvdWxkIGJlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZg0KPiBQSFlTREVWT1Bf
bWFuYWdlX3BjaV9yZW1vdmU/ICBXb3VsZCBpdCBqdXN0IGNoZWNrIHdoZXRoZXIgdGhlIHBkZXYN
Cj4gZXhpc3QgYW5kIGVpdGhlciByZXR1cm4gMCBvciAtRUJVU1k/DQo+DQoNCk9rYXksIEkgYW0g
cHJlcGFyaW5nIHBhdGNoZXMgd2l0aCB0aGUgYmVoYXZpb3IgeW91IHByb3Bvc2VkLiBUbyB0ZXN0
IGl0LA0KSSBhcnRpZmljaWFsbHkgc2V0IHJlZmNvdW50IHRvIDIgYW5kIGluZGVlZCBQSFlTREVW
T1BfbWFuYWdlX3BjaV9yZW1vdmUNCnJldHVybmVkIC1FQlVTWSwgd2hpY2ggcHJvcGFnYXRlZCB0
byB0aGUgbGludXggZHJpdmVyLiBQcm9ibGVtIGlzIHRoYXQNCkxpbnV4IGRyaXZlciBjYW4ndCBk
byBhbnl0aGluZyB3aXRoIHRoaXMuIEl0IGp1c3QgZGlzcGxheWVkIGFuIGVycm9yDQptZXNzYWdl
IGFuZCByZW1vdmVkIGRldmljZSBhbnl3YXlzLiBUaGlzIGlzIGJlY2F1c2UgTGludXggc2VuZHMN
ClBIWVNERVZPUF9tYW5hZ2VfcGNpX3JlbW92ZSBpbiBkZXZpY2VfcmVtb3ZlKCkgY2FsbCBwYXRo
IGFuZCB0aGVyZSBpcyBubw0Kd2F5IHRvIHByZXZlbnQgdGhlIGRldmljZSByZW1vdmFsLiBTbywg
YWRtaW4gaXMgbm90IGNhcGFibGUgdG8gdHJ5IHRoaXMNCmFnYWluLg0KDQpBcyBJIHdvcmthcm91
bmQsIEkgY2FuIGNyZWF0ZSBoeXBlcmNhbGwgY29udGludWF0aW9uIGluIGNhc2UgaWYNCnBjaV9y
ZW1vdmVfZGV2aWNlKCkgcmV0dXJucyAtRUJVU1kuIFdoYXQgaXMgeW91ciBvcGluaW9uPw0KDQoN
Ci0tIA0KV0JSLCBWb2xvZHlteXI=

