Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4232295A
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 12:15:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88712.166934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEVeq-0008PQ-1R; Tue, 23 Feb 2021 11:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88712.166934; Tue, 23 Feb 2021 11:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEVep-0008P0-Tv; Tue, 23 Feb 2021 11:15:11 +0000
Received: by outflank-mailman (input) for mailman id 88712;
 Tue, 23 Feb 2021 11:15:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lEVen-0008Ov-C7
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 11:15:09 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 908aba94-1a6b-4d1a-9bfb-bc224baf8f87;
 Tue, 23 Feb 2021 11:15:07 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11NBBraW001552; Tue, 23 Feb 2021 11:15:06 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by mx0a-0039f301.pphosted.com with ESMTP id 36vyuyr8gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 11:15:05 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by VI1PR0302MB2656.eurprd03.prod.outlook.com (2603:10a6:800:de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Tue, 23 Feb
 2021 11:15:01 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.042; Tue, 23 Feb 2021
 11:15:01 +0000
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
X-Inumbo-ID: 908aba94-1a6b-4d1a-9bfb-bc224baf8f87
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lT+oemMdgS4N/vE7x1U0FclQfxbGuwd9dZZ3MCNtrGNs44UIEe8lFZC0APf/DF04huH4KVkVqwrkvXxqVcIZCYT6FpuchEVGhM+HGIH2Uktd32DHypakdkcPTsxwdQo3c5gicpKTREG9AUQ8IOymmev8HvN0JDM0NuvMPtpzKJbTHJAuldvv39MkWmaOQ5AI7cRHGQoqCxII+B0vT6RPN2R13GE605qgqYFp01Gc4tq3kLbRBVMTSxPTyY8kfG7PjyDERjsx45GWxmdIrxi0cY4kFR7OJ0sKzLpaGfBQVGorKUJK7OeEAazFXgR+CdKX9CU+JJoP3Y+Soh18ZlUBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfewKRC2yYhTMHG5MnDpna+lxbBIa+KZm1m7ThfTP48=;
 b=SU2kmH1zrbwWpNNvH5q+GvRPybgzY/yFjBoEUHdFN39oCnFMvBOWKXKzeCk1ueac/kFySDkzHCEPuk8z+wApcMqT7q/q1EKMpIdmJI678jYUKEGIHkiFINAceS7khCBBIY6Vw/tLTeuFzJSFbDXyRnNfVGZYC6INg7Qevar5kk7jtl8xGRhHeWkrjbYXC4VCXJo5zF7lfrME4EbakVEzrQPPrdC0I4lTWfSdG65XnSFo51DU2L9EbMeGxEIMPv6+Gf9JK9rsVoY+D3IbDo4J+JVL9eq/zkeBgMUKT9ZhjB8Mlc4DPc52TepvXFLNeMelS+M1b0dfchjM10svnUe9wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfewKRC2yYhTMHG5MnDpna+lxbBIa+KZm1m7ThfTP48=;
 b=wd+kAKIym5Jkp0b58X6QbnnHPEcPzQo7F2tppauaIJryrKgq07F2ni/f38nDuC4YVj3Wb+qu6d5wswCR/F6HSPmVvx78+p0xw1Es4mlEYolX1bGt4fNgvypK9OFADEm31AknTxG/vos/FP84aOAt6HgijtZBvGZXdkOxKr2Fdd/x/AjJQ4F8309IlVs3LNS0fFyH8GP7iV8kw/iERyhoXRmToH1/SUut62q+KnL3lyN9pE0mqSFnYHajJgiVYQHem0CAxyvepRyRPrSLzqavCcJtVlCJXXUJ+Dqc1ooMN9+G1eIwvy86yLemlqrHXfgHr4p9d1eRnikn/ZJOLOrDVA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>,
        Dario Faggioli
	<dfaggioli@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 01/10] sched: core: save IRQ state during locking
Thread-Topic: [RFC PATCH 01/10] sched: core: save IRQ state during locking
Thread-Index: AQHXCYx4NBzFu5keaEOeI3LkFrTKiKplb3mAgAAnrgA=
Date: Tue, 23 Feb 2021 11:15:00 +0000
Message-ID: <877dmz6nnv.fsf@epam.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <20210223023428.757694-2-volodymyr_babchuk@epam.com>
 <4f7b4788-3b2e-8501-6aec-948b70320af2@suse.com>
In-Reply-To: <4f7b4788-3b2e-8501-6aec-948b70320af2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4df97325-8a04-47b5-f3cc-08d8d7ec4322
x-ms-traffictypediagnostic: VI1PR0302MB2656:
x-microsoft-antispam-prvs: 
 <VI1PR0302MB265675DF9804B74786DCE978E6809@VI1PR0302MB2656.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 l9zMv5k4tlITt4wz0uzk5RGQbbYr6U8rImJ0swht7VXXeexAKHxlSxydAEuRoVQcKJF0sLYEtKkYm4eXKpX+F+8rhxijTgYuJzozQhqsXat8ZCA5x4EKlvlcqrTcc40/CbJPJAda52lpYdoq7VMun36mKFFyzOr6NeeyRNoaHVk0+ECkYYwJtTYPGM/a92mywnj6/SVsETjAe/J0pHlFRcBlrwfDaWl0MciW/FeYOeA6uSzbAE3TlrIGKmTs9wH3h8+hIGafkdM4ffDSt4eW89wVx0OHJ60RcXQsWvukSfgnRNPV1HCq3MniYCp5IVi0ULxbjzDFTKpN+2VO9aM19zObS+Mf3WiRO7B34+W2y2lVgRoPGWLB+smUd+uQRcUjMn43czy6bCoikCVzJp1B6Wy+ZynctwbjyIsfHxR/Dg5XgkUnKBOJpAe2BFvKEBID3VzQ9DqzyEvokeNsxH2K+TwHPBVJC7Srptg4hEnOChd8YhhlF38gzmLGKVo1l2R7WXedYlq1a1QkuWEbPoRFmw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(366004)(6916009)(66946007)(53546011)(2616005)(478600001)(4326008)(66574015)(83380400001)(71200400001)(6506007)(5660300002)(66446008)(76116006)(66476007)(66556008)(8936002)(6512007)(86362001)(36756003)(8676002)(64756008)(26005)(2906002)(6486002)(54906003)(186003)(55236004)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?UTBSS0w3SDh2ZEo4WEdMQlR5c2ZmaFJrR3hzcy9vd1M3c3M0N0h2TW93L2RZ?=
 =?utf-8?B?Q0xtTXF6STlOVnRKMUE2QnVnbmxXa2l0b2Frdy9ZWFZMSWpKeXl4TW45aUU0?=
 =?utf-8?B?T2JEamFIZk9VbmF4SEhlWkJNWWNpNjhkblVEWGlhRndYRlFxRXN6c25mOS9t?=
 =?utf-8?B?NUJwTktOR0hiVlJtZTlBblFiaW9JNXFWejcrbkVQRUtTdnpjbVFlWjB3SHpp?=
 =?utf-8?B?bGwvVWxHbmlPUzZGdDd4dFExSEY3MzJKK1FRYm5GVVp4R3owSUg3NHBYWmVJ?=
 =?utf-8?B?V0xWK203aDJ3cVdvc1M0d2E0UzRBUDVGeFVUbVhUQUhwRFY0U1Q2Wm1RaGpQ?=
 =?utf-8?B?akZadWJwNHlBN0c0Mk04Tjg2UW1XTFBJZ2pxdTUwRGFJWmpyN01obzB6ZHRa?=
 =?utf-8?B?S3JmUjRlTHpXdm56UVNEbzRjenR1SWNwL25YYW4yYTlxUysrSjZMU3dySkE0?=
 =?utf-8?B?V1d5Vi9kQk5Ocy90dTdON0l0MVRFUFRqdm1JcUZvNTk0TnQwUG9Bam1kdVJH?=
 =?utf-8?B?MGZWdzVYajBqY2JoQzBLQjZUK2h4eTVwSE5oclNYdXV1K2RjVTRNUCt5K0RM?=
 =?utf-8?B?NEdER1hwbk5hQnpKUjk2TGpLMUVmVGZDL29PTWl6UDBqRnlSajA2blk5cXBt?=
 =?utf-8?B?bTEyUm5qVkN1REZ4UUJRbllZaGlZQ2JjUEZBTGtMWmhwcDNFMHdUejZiVmFr?=
 =?utf-8?B?c1ZybTNkSjlqd2c3S3daejZUYTVGWEYrL3pPME9IQjBpUnFuYWhCbkt1Q1BW?=
 =?utf-8?B?ZkszVSs0K0l1UUN0SjhtTEVkNGwzeWpqTkhROTV2UnRQaDYxeklRMHc0NkVU?=
 =?utf-8?B?bnNJeE45dTdhTERZMmdQVnF0Y1U5YnRxcCtQbHdBS3ptZ1VJdnNranVFRFNO?=
 =?utf-8?B?Y0o4VS9ZcDhMRkZRRTB2c0dheWlqa2EvdzNaMkpaRGZmZVNiU09OVjFLdmg1?=
 =?utf-8?B?WUZxeEprUzd6ckFJNjBJcWxKaitROG12aG9RSDhraEZUYk15S2N4TzZ5WFlB?=
 =?utf-8?B?NTNxcmcwS0xqdWVUb2gzQzFlUWgxR3VQcU43MzI5bnpEWkxKVU1UN1VqRmdU?=
 =?utf-8?B?Yzk5S2VueG9iNGlwVVI0d0lJZ042UUU3M0YzcWtwbGQxdnBEWnZPVm8rb3k3?=
 =?utf-8?B?cTZVWkp4QWpXV0F5bm5HUjU1T2V3SHF3UDBwUzZTd2ordE1GMHNZS3BqZ3Zy?=
 =?utf-8?B?d2c3TVo0NDRZSmx4TU9XVDJKZXZ6b2ViNXVKdmVEZExFajRLd2JKMnhqaDFH?=
 =?utf-8?B?b3lvamhpVGQ4SzF2Y3ZwTUxkVDFSL1VvNHowdFJrNTI4YVIvTklnTDlKamlB?=
 =?utf-8?B?Vm1GVGVseW9Ub3RKSkFMclBPWnRaTVhSREZQbkVNLy9MaHdBbVB2UmFxOWF2?=
 =?utf-8?B?UjJTdHFDT2t1aUplc05DUGhKaUJLK1NUSFJuNDlkZE5LTFdhd3A0RFhIemtj?=
 =?utf-8?B?Yk9ieWFrYVM5SDdhdmM3WjFZL0pnV3NiK2RwZnhURXlNMzZHSUttY1poa21L?=
 =?utf-8?B?dmJnMVZrZW5SaUp2NTlIbzAvOURiSWNhV1RmdU9sSDFCaUtKczVEZ3RMeWlZ?=
 =?utf-8?B?WEtUNVkrdWtKbmZiMWlaaHdHVFBYck9ESEN2Y21nVVhzdjYrbUdPdXRlN1Nm?=
 =?utf-8?B?dkxlc2JGZDFMaCtQYUs3OHRTSjFaRGVrTDBpZkpScTdRSE0wSHVUajRpNlN1?=
 =?utf-8?B?STlWTVpMdHBIV1M0UGYycHhFZS9LcVk2VjF4YWhQWVc3SEN6blJpWmdibWh6?=
 =?utf-8?B?Y0t4TGdWSTI1UmMzTHVyd0lxRFVtYlJnbEx2dlZDVExQMFcrNm9YSG1NSkRk?=
 =?utf-8?B?RU5BR1QrdlZIMTA5UnUvQT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <28EDA844F069D04CA1A1C75AD8A5F5C9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df97325-8a04-47b5-f3cc-08d8d7ec4322
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 11:15:01.0203
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wvXfoUG67ZZvTq0OLp8POL/hlr22kh486LRRo6ROGJdaaLxkaTHa2yc5eknvjFou+z68pckDWyyksDOsF2kIozC+0MiJ9YeAQGJVT8xL3mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2656
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230096

DQpIaSBKdXJnZW4sDQoNCkrDvHJnZW4gR3Jvw58gd3JpdGVzOg0KDQo+IE9uIDIzLjAyLjIxIDAz
OjM0LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IFdpdGggWEVOIHByZWVtcHRpb24gZW5h
YmxlZCwgc2NoZWR1bGVyIGZ1bmN0aW9ucyBjYW4gYmUgY2FsbGVkIHdpdGgNCj4+IElSUXMgZGlz
YWJsZWQgKGZvciBleGFtcGxlLCBhdCBlbmQgb2YgSVJRIGhhbmRsZXIpLCBzbyB3ZSBzaG91bGQN
Cj4+IHNhdmUgYW5kIHJlc3RvcmUgSVJRIHN0YXRlIGluIHNjaGVkdWxlcnMgY29kZS4NCj4NCj4g
VGhpcyBicmVha3MgY29yZSBzY2hlZHVsaW5nLg0KDQpZZXMsIHRoYW5rIHlvdS4gSSBmb3Jnb3Qg
dG8gbWVudGlvbiB0aGF0IHRoaXMgUG9DIGlzIG5vdCBjb21wYXRpYmxlIHdpdGgNCmNvcmUgc2No
ZWR1bGluZy4gSXQgaXMgbm90IHVzZWQgb24gQVJNLCBzbyBJIGNvdWxkIG5vdCB0ZXN0IGl0IGFu
eXdheXMuDQoNCj4gV2FpdGluZyBmb3IgYW5vdGhlciBzaWJsaW5nIHdpdGggaW50ZXJydXB0cyBk
aXNhYmxlZCBpcyBhbiBhYnNvbHV0ZQ0KPiBubyBnbywgYXMgZGVhZGxvY2tzIGFyZSB0aGUgY29u
c2VxdWVuY2UuDQo+DQo+IFlvdSBjb3VsZCAoaW4gdGhlb3J5KSBtYWtlIHByZWVtcHRpb24gYW5k
IGNvcmUgc2NoZWR1bGluZyBtdXR1YWxseQ0KPiBleGNsdXNpdmUsIGJ1dCB0aGlzIHdvdWxkIGJy
ZWFrIHRoZSBmb3J3YXJkIHBhdGggdG8gbXV0ZXhlcyBldGMuDQo+DQoNCldlbGwsIEkgaW1wbGVt
ZW50ZWQgdGhlIG1vc3QgbmFpdmUgd2F5IHRvIGVuYWJsZSBoeXBlcnZpc29yDQpwcmVlbXB0aW9u
LiBJJ20gc3VyZSB0aGF0IHdpdGggYSBiaXQgbW9yZSBjYXJlZnVsIGFwcHJvYWNoIEkgY2FuIG1h
a2UgaXQNCmNvbXBhdGlibGUgd2l0aCBjb3JlIHNjaGVkdWxpbmcuIFRoZXJlIGlzIG5vIHN0cmlj
dCByZXF1aXJlbWVudCB0byBydW4NCnNjaGVkdWxlciB3aXRoIElSUXMgZGlzYWJsZWQuDQoNCj4N
Cj4gSnVlcmdlbg0KPg0KPj4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9k
eW15cl9iYWJjaHVrQGVwYW0uY29tPg0KPj4gLS0tDQo+PiAgIHhlbi9jb21tb24vc2NoZWQvY29y
ZS5jIHwgMzMgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4+IGRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiBp
bmRleCA5NzQ1YTc3ZWVlLi43ZTA3NTYxM2Q1IDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9z
Y2hlZC9jb3JlLmMNCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvY29yZS5jDQo+PiBAQCAtMjQ3
MCw3ICsyNDcwLDggQEAgc3RhdGljIHN0cnVjdCB2Y3B1ICpzY2hlZF9mb3JjZV9jb250ZXh0X3N3
aXRjaChzdHJ1Y3QgdmNwdSAqdnByZXYsDQo+PiAgICAqIHNjaGVkX3Jlc19yY3Vsb2NrIGhhcyBi
ZWVuIGRyb3BwZWQuDQo+PiAgICAqLw0KPj4gICBzdGF0aWMgc3RydWN0IHNjaGVkX3VuaXQgKnNj
aGVkX3dhaXRfcmVuZGV6dm91c19pbihzdHJ1Y3Qgc2NoZWRfdW5pdCAqcHJldiwNCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzcGlubG9ja190
ICoqbG9jaywgaW50IGNwdSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzcGlubG9ja190ICoqbG9jaywNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICpmbGFncywg
aW50IGNwdSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc190aW1lX3Qgbm93KQ0KPj4gICB7DQo+PiAgICAgICBzdHJ1Y3Qgc2NoZWRfdW5p
dCAqbmV4dDsNCj4+IEBAIC0yNTAwLDcgKzI1MDEsNyBAQCBzdGF0aWMgc3RydWN0IHNjaGVkX3Vu
aXQgKnNjaGVkX3dhaXRfcmVuZGV6dm91c19pbihzdHJ1Y3Qgc2NoZWRfdW5pdCAqcHJldiwNCj4+
ICAgICAgICAgICAgICAgICAgIHByZXYtPnJlbmRlenZvdXNfaW5fY250Kys7DQo+PiAgICAgICAg
ICAgICAgICAgICBhdG9taWNfc2V0KCZwcmV2LT5yZW5kZXp2b3VzX291dF9jbnQsIDApOw0KPj4g
ICAtICAgICAgICAgICAgICAgIHBjcHVfc2NoZWR1bGVfdW5sb2NrX2lycSgqbG9jaywgY3B1KTsN
Cj4+ICsgICAgICAgICAgICAgICAgcGNwdV9zY2hlZHVsZV91bmxvY2tfaXJxcmVzdG9yZSgqbG9j
aywgKmZsYWdzLCBjcHUpOw0KPj4gICAgICAgICAgICAgICAgICAgICBzY2hlZF9jb250ZXh0X3N3
aXRjaCh2cHJldiwgdiwgZmFsc2UsIG5vdyk7DQo+PiAgIEBAIC0yNTMwLDcgKzI1MzEsNyBAQCBz
dGF0aWMgc3RydWN0IHNjaGVkX3VuaXQNCj4+ICpzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4oc3Ry
dWN0IHNjaGVkX3VuaXQgKnByZXYsDQo+PiAgICAgICAgICAgICAgIHByZXYtPnJlbmRlenZvdXNf
aW5fY250Kys7DQo+PiAgICAgICAgICAgICAgIGF0b21pY19zZXQoJnByZXYtPnJlbmRlenZvdXNf
b3V0X2NudCwgMCk7DQo+PiAgIC0gICAgICAgICAgICBwY3B1X3NjaGVkdWxlX3VubG9ja19pcnEo
KmxvY2ssIGNwdSk7DQo+PiArICAgICAgICAgICAgcGNwdV9zY2hlZHVsZV91bmxvY2tfaXJxcmVz
dG9yZSgqbG9jaywgKmZsYWdzLCBjcHUpOw0KPj4gICAgICAgICAgICAgICAgIHJhaXNlX3NvZnRp
cnEoU0NIRURfU0xBVkVfU09GVElSUSk7DQo+PiAgICAgICAgICAgICAgIHNjaGVkX2NvbnRleHRf
c3dpdGNoKHZwcmV2LCB2cHJldiwgZmFsc2UsIG5vdyk7DQo+PiBAQCAtMjUzOCwxMSArMjUzOSwx
MSBAQCBzdGF0aWMgc3RydWN0IHNjaGVkX3VuaXQgKnNjaGVkX3dhaXRfcmVuZGV6dm91c19pbihz
dHJ1Y3Qgc2NoZWRfdW5pdCAqcHJldiwNCj4+ICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7ICAg
ICAgICAgLyogQVJNIG9ubHkuICovDQo+PiAgICAgICAgICAgfQ0KPj4gICAtICAgICAgICBwY3B1
X3NjaGVkdWxlX3VubG9ja19pcnEoKmxvY2ssIGNwdSk7DQo+PiArICAgICAgICBwY3B1X3NjaGVk
dWxlX3VubG9ja19pcnFyZXN0b3JlKCpsb2NrLCAqZmxhZ3MsIGNwdSk7DQo+PiAgICAgICAgICAg
ICBjcHVfcmVsYXgoKTsNCj4+ICAgLSAgICAgICAgKmxvY2sgPSBwY3B1X3NjaGVkdWxlX2xvY2tf
aXJxKGNwdSk7DQo+PiArICAgICAgICAqbG9jayA9IHBjcHVfc2NoZWR1bGVfbG9ja19pcnFzYXZl
KGNwdSwgZmxhZ3MpOw0KPj4gICAgICAgICAgICAgLyoNCj4+ICAgICAgICAgICAgKiBDaGVjayBm
b3Igc2NoZWR1bGluZyByZXNvdXJjZSBzd2l0Y2hlZC4gVGhpcyBoYXBwZW5zIHdoZW4gd2UgYXJl
DQo+PiBAQCAtMjU1Nyw3ICsyNTU4LDcgQEAgc3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hl
ZF93YWl0X3JlbmRlenZvdXNfaW4oc3RydWN0IHNjaGVkX3VuaXQgKnByZXYsDQo+PiAgICAgICAg
ICAgICAgIEFTU0VSVChpc19pZGxlX3VuaXQocHJldikpOw0KPj4gICAgICAgICAgICAgICBhdG9t
aWNfc2V0KCZwcmV2LT5uZXh0X3Rhc2stPnJlbmRlenZvdXNfb3V0X2NudCwgMCk7DQo+PiAgICAg
ICAgICAgICAgIHByZXYtPnJlbmRlenZvdXNfaW5fY250ID0gMDsNCj4+IC0gICAgICAgICAgICBw
Y3B1X3NjaGVkdWxlX3VubG9ja19pcnEoKmxvY2ssIGNwdSk7DQo+PiArICAgICAgICAgICAgcGNw
dV9zY2hlZHVsZV91bmxvY2tfaXJxcmVzdG9yZSgqbG9jaywgKmZsYWdzLCBjcHUpOw0KPj4gICAg
ICAgICAgICAgICByY3VfcmVhZF91bmxvY2soJnNjaGVkX3Jlc19yY3Vsb2NrKTsNCj4+ICAgICAg
ICAgICAgICAgcmV0dXJuIE5VTEw7DQo+PiAgICAgICAgICAgfQ0KPj4gQEAgLTI1NzQsMTIgKzI1
NzUsMTMgQEAgc3RhdGljIHZvaWQgc2NoZWRfc2xhdmUodm9pZCkNCj4+ICAgICAgIHNwaW5sb2Nr
X3QgICAgICAgICAgICpsb2NrOw0KPj4gICAgICAgYm9vbCAgICAgICAgICAgICAgICAgIGRvX3Nv
ZnRpcnEgPSBmYWxzZTsNCj4+ICAgICAgIHVuc2lnbmVkIGludCAgICAgICAgICBjcHUgPSBzbXBf
cHJvY2Vzc29yX2lkKCk7DQo+PiArICAgIHVuc2lnbmVkIGxvbmcgICAgICAgICBmbGFnczsNCj4+
ICAgICAgICAgQVNTRVJUX05PVF9JTl9BVE9NSUMoKTsNCj4+ICAgICAgICAgcmN1X3JlYWRfbG9j
aygmc2NoZWRfcmVzX3JjdWxvY2spOw0KPj4gICAtICAgIGxvY2sgPSBwY3B1X3NjaGVkdWxlX2xv
Y2tfaXJxKGNwdSk7DQo+PiArICAgIGxvY2sgPSBwY3B1X3NjaGVkdWxlX2xvY2tfaXJxc2F2ZShj
cHUsICZmbGFncyk7DQo+PiAgICAgICAgIG5vdyA9IE5PVygpOw0KPj4gICBAQCAtMjU5MCw3ICsy
NTkyLDcgQEAgc3RhdGljIHZvaWQgc2NoZWRfc2xhdmUodm9pZCkNCj4+ICAgICAgICAgICAgIGlm
ICggdiApDQo+PiAgICAgICAgICAgew0KPj4gLSAgICAgICAgICAgIHBjcHVfc2NoZWR1bGVfdW5s
b2NrX2lycShsb2NrLCBjcHUpOw0KPj4gKyAgICAgICAgICAgIHBjcHVfc2NoZWR1bGVfdW5sb2Nr
X2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIGNwdSk7DQo+PiAgICAgICAgICAgICAgICAgc2NoZWRf
Y29udGV4dF9zd2l0Y2godnByZXYsIHYsIGZhbHNlLCBub3cpOw0KPj4gICBAQCAtMjYwMiw3ICsy
NjA0LDcgQEAgc3RhdGljIHZvaWQgc2NoZWRfc2xhdmUodm9pZCkNCj4+ICAgICAgICAgaWYgKCAh
cHJldi0+cmVuZGV6dm91c19pbl9jbnQgKQ0KPj4gICAgICAgew0KPj4gLSAgICAgICAgcGNwdV9z
Y2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIGNwdSk7DQo+PiArICAgICAgICBwY3B1X3NjaGVkdWxl
X3VubG9ja19pcnFyZXN0b3JlKGxvY2ssIGZsYWdzLCBjcHUpOw0KPj4gICAgICAgICAgICAgcmN1
X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7DQo+PiAgIEBAIC0yNjE1LDExICsyNjE3
LDExIEBAIHN0YXRpYyB2b2lkIHNjaGVkX3NsYXZlKHZvaWQpDQo+PiAgICAgICAgIHN0b3BfdGlt
ZXIoJmdldF9zY2hlZF9yZXMoY3B1KS0+c190aW1lcik7DQo+PiAgIC0gICAgbmV4dCA9IHNjaGVk
X3dhaXRfcmVuZGV6dm91c19pbihwcmV2LCAmbG9jaywgY3B1LCBub3cpOw0KPj4gKyAgICBuZXh0
ID0gc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKHByZXYsICZsb2NrLCAmZmxhZ3MsIGNwdSwgbm93
KTsNCj4+ICAgICAgIGlmICggIW5leHQgKQ0KPj4gICAgICAgICAgIHJldHVybjsNCj4+ICAgLSAg
ICBwY3B1X3NjaGVkdWxlX3VubG9ja19pcnEobG9jaywgY3B1KTsNCj4+ICsgICAgcGNwdV9zY2hl
ZHVsZV91bmxvY2tfaXJxcmVzdG9yZShsb2NrLCBmbGFncywgY3B1KTsNCj4+ICAgICAgICAgc2No
ZWRfY29udGV4dF9zd2l0Y2godnByZXYsIHNjaGVkX3VuaXQydmNwdV9jcHUobmV4dCwgY3B1KSwN
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlzX2lkbGVfdW5pdChuZXh0KSAmJiAhaXNf
aWRsZV91bml0KHByZXYpLCBub3cpOw0KPj4gQEAgLTI2MzcsNiArMjYzOSw3IEBAIHN0YXRpYyB2
b2lkIHNjaGVkdWxlKHZvaWQpDQo+PiAgICAgICBzX3RpbWVfdCAgICAgICAgICAgICAgbm93Ow0K
Pj4gICAgICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpzcjsNCj4+ICAgICAgIHNwaW5sb2NrX3Qg
ICAgICAgICAgICpsb2NrOw0KPj4gKyAgICB1bnNpZ25lZCBsb25nICAgICAgICAgZmxhZ3M7DQo+
PiAgICAgICBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOw0KPj4gICAgICAgdW5zaWduZWQg
aW50ICAgICAgICAgIGdyYW47DQo+PiAgIEBAIC0yNjQ2LDcgKzI2NDksNyBAQCBzdGF0aWMgdm9p
ZCBzY2hlZHVsZSh2b2lkKQ0KPj4gICAgICAgICByY3VfcmVhZF9sb2NrKCZzY2hlZF9yZXNfcmN1
bG9jayk7DQo+PiAgIC0gICAgbG9jayA9IHBjcHVfc2NoZWR1bGVfbG9ja19pcnEoY3B1KTsNCj4+
ICsgICAgbG9jayA9IHBjcHVfc2NoZWR1bGVfbG9ja19pcnFzYXZlKGNwdSwgJmZsYWdzKTsNCj4+
ICAgICAgICAgc3IgPSBnZXRfc2NoZWRfcmVzKGNwdSk7DQo+PiAgICAgICBncmFuID0gc3ItPmdy
YW51bGFyaXR5Ow0KPj4gQEAgLTI2NTcsNyArMjY2MCw3IEBAIHN0YXRpYyB2b2lkIHNjaGVkdWxl
KHZvaWQpDQo+PiAgICAgICAgICAgICogV2UgaGF2ZSBhIHJhY2U6IHNjaGVkX3NsYXZlKCkgc2hv
dWxkIGJlIGNhbGxlZCwgc28gcmFpc2UgYSBzb2Z0aXJxDQo+PiAgICAgICAgICAgICogaW4gb3Jk
ZXIgdG8gcmUtZW50ZXIgc2NoZWR1bGUoKSBsYXRlciBhbmQgY2FsbCBzY2hlZF9zbGF2ZSgpIG5v
dy4NCj4+ICAgICAgICAgICAgKi8NCj4+IC0gICAgICAgIHBjcHVfc2NoZWR1bGVfdW5sb2NrX2ly
cShsb2NrLCBjcHUpOw0KPj4gKyAgICAgICAgcGNwdV9zY2hlZHVsZV91bmxvY2tfaXJxcmVzdG9y
ZShsb2NrLCBmbGFncywgY3B1KTsNCj4+ICAgICAgICAgICAgIHJjdV9yZWFkX3VubG9jaygmc2No
ZWRfcmVzX3JjdWxvY2spOw0KPj4gICBAQCAtMjY3Niw3ICsyNjc5LDcgQEAgc3RhdGljIHZvaWQg
c2NoZWR1bGUodm9pZCkNCj4+ICAgICAgICAgICBwcmV2LT5yZW5kZXp2b3VzX2luX2NudCA9IGdy
YW47DQo+PiAgICAgICAgICAgY3B1bWFza19hbmRub3QobWFzaywgc3ItPmNwdXMsIGNwdW1hc2tf
b2YoY3B1KSk7DQo+PiAgICAgICAgICAgY3B1bWFza19yYWlzZV9zb2Z0aXJxKG1hc2ssIFNDSEVE
X1NMQVZFX1NPRlRJUlEpOw0KPj4gLSAgICAgICAgbmV4dCA9IHNjaGVkX3dhaXRfcmVuZGV6dm91
c19pbihwcmV2LCAmbG9jaywgY3B1LCBub3cpOw0KPj4gKyAgICAgICAgbmV4dCA9IHNjaGVkX3dh
aXRfcmVuZGV6dm91c19pbihwcmV2LCAmbG9jaywgJmZsYWdzLCBjcHUsIG5vdyk7DQo+PiAgICAg
ICAgICAgaWYgKCAhbmV4dCApDQo+PiAgICAgICAgICAgICAgIHJldHVybjsNCj4+ICAgICAgIH0N
Cj4+IEBAIC0yNjg3LDcgKzI2OTAsNyBAQCBzdGF0aWMgdm9pZCBzY2hlZHVsZSh2b2lkKQ0KPj4g
ICAgICAgICAgIGF0b21pY19zZXQoJm5leHQtPnJlbmRlenZvdXNfb3V0X2NudCwgMCk7DQo+PiAg
ICAgICB9DQo+PiAgIC0gICAgcGNwdV9zY2hlZHVsZV91bmxvY2tfaXJxKGxvY2ssIGNwdSk7DQo+
PiArICAgIHBjcHVfc2NoZWR1bGVfdW5sb2NrX2lycXJlc3RvcmUobG9jaywgZmxhZ3MsIGNwdSk7
DQo+PiAgICAgICAgIHZuZXh0ID0gc2NoZWRfdW5pdDJ2Y3B1X2NwdShuZXh0LCBjcHUpOw0KPj4g
ICAgICAgc2NoZWRfY29udGV4dF9zd2l0Y2godnByZXYsIHZuZXh0LA0KPj4gDQoNCg0KLS0gDQpW
b2xvZHlteXIgQmFiY2h1ayBhdCBFUEFN

