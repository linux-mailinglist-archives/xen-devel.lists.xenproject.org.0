Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A99D87DE12
	for <lists+xen-devel@lfdr.de>; Sun, 17 Mar 2024 16:45:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694355.1083180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlshT-0005JC-1Y; Sun, 17 Mar 2024 15:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694355.1083180; Sun, 17 Mar 2024 15:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlshS-0005GQ-Us; Sun, 17 Mar 2024 15:45:26 +0000
Received: by outflank-mailman (input) for mailman id 694355;
 Sun, 17 Mar 2024 15:45:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m/C3=KX=epam.com=prvs=9806532c19=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1rlshS-0005GK-CL
 for xen-devel@lists.xenproject.org; Sun, 17 Mar 2024 15:45:26 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d2df6bf-e475-11ee-a1ee-f123f15fe8a2;
 Sun, 17 Mar 2024 16:45:23 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42H3g2Z6002322; Sun, 17 Mar 2024 15:45:11 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ww3jrhw9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 17 Mar 2024 15:45:11 +0000 (GMT)
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AS4PR03MB8650.eurprd03.prod.outlook.com (2603:10a6:20b:589::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Sun, 17 Mar
 2024 15:45:07 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::cb1c:3d36:163:e23]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::cb1c:3d36:163:e23%7]) with mapi id 15.20.7386.023; Sun, 17 Mar 2024
 15:45:07 +0000
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
X-Inumbo-ID: 5d2df6bf-e475-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTxXyClXLhL8BrH4P3Oom+POK4GHGUMRGPRJgau915EZLu63K62Om6LB5mMNR/wQT+ZYL5L24AFO26LHjY70sxLawArdPblIPfNQm7ARIKsZZnaYKIH8UuTAw4mUkYZ85Bc6BtWie1WZCzh0VBjKzWcsdGYqncWQ3Gq9ENBL0q6Q+xPIu3hELcEQqGUa5HFB2feRn7wHeO9OtL7JOgUE+V8Xt4tEtY6CNS9603OLZJ8iwfcA0SeV7MUi0nOL3AryrAcXHAto9CeFoLPvApH2ldQeGhHR0wjYPq/kcyju+/eXNiAOSc1nn400qISWIE0NCdkRC6lez74TnUg0Zi4uIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SLbOqfradRDs2Wlbhbhjele5KQOavepKjZl/yDqo40=;
 b=l+2Hk2eqQwxGmMeCXZN/sjSbsKT5vjdKBoycD4MH0C11WuOqOWZbCKBK/iQkfx1fuktA+HmRAJIeJ0Wfggy8aP95SHUxRmK8g3eA2Usk8hiTSadxihD58XEffVJal2QY+fYjYFKaq/iFzkGyCo3E1PyeSMlKcuhsh6Z0CdQ0Kr4StFPKhsstYg/lzlWViy664aEgQMFZRngRL9Vblkxt6MqNHX17TnuH4TV7MgrcMh1JK3ScfyrqwZwlIIGlOY48ErkqyFKYP4JuAXfvNb7vg0JxG50VTkbs5j+iiHg3/uzDKn33LB9BR8O9P9PhpRW/TTNi5IeS+zvqkP6YhMdwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SLbOqfradRDs2Wlbhbhjele5KQOavepKjZl/yDqo40=;
 b=nHq5vRY6C8lzDZ7JDdW/lnNAhsyrBe7b3UmpfBwlEDcVvxHFmcYkwFuKX8/rjMjG6QDNNQeCfkiTeu0MUBCkgkQFW2QRMr4xV7dhWFrfBkdb5W2yXkE2a7LZh1qMCmaFIvdCdWZWrRysOK6s/NxoRIGgIYAy8Y405Bal9Df+A7Rx7NiSyzspHVJ0YcRQPpvpOVc141blwUns5gmAWGlQ1xIPNVU8Cq1pu00c69Nj5TVAYbgZwK9WjDBGhM6vNAn6xgWtzI90aabDvcwXmrvb1PdIMqGfkuAYEEelsgJ1WDoeF19esY2l22fdqR9W+/PjfLxanZeoZArDQCMI2Jgf0Q==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Juergen Gross <jgross@suse.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Demi Marie
 Obenour <demi@invisiblethingslab.com>
Subject: Re: [PATCH 1/2] xen/evtchn: avoid WARN() when unbinding an event
 channel
Thread-Topic: [PATCH 1/2] xen/evtchn: avoid WARN() when unbinding an event
 channel
Thread-Index: AQHadRYXv0kOlvmk5E2hHL7QAKtBUrE8GfkA
Date: Sun, 17 Mar 2024 15:45:07 +0000
Message-ID: <45f63f9b-43c7-494b-b10d-e2b43d16d448@epam.com>
References: <20240313071409.25913-1-jgross@suse.com>
 <20240313071409.25913-2-jgross@suse.com>
In-Reply-To: <20240313071409.25913-2-jgross@suse.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|AS4PR03MB8650:EE_
x-ms-office365-filtering-correlation-id: 5d5d2cc3-2283-4d24-06e6-08dc46993892
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1dbxxCFZPEk1X10fidK8U9z+TNnJ6ofQC5A363aU6lsJawNZInEcdeLgEd4qRpQGGooXwKUKVIEOrwOF7EkI70xISRxjN+uZ/sjFRKI0HCUi5Xg5E5wJdSCAEjgzKCPSBlMrp4uaWEie+6EYjRoQzcr7XF+EUcn8O7kr6hECpUT5N5ZQrWf8EXm4cHdtIbk7arv6Y0t1gzNVmlqWmzzxVpKD+KkyZS2lNGOIshvpcAGIBv4SqZvDLVjDuQdgSlhnreJywJt5glAWvlRsE5z9ycY72jDmD81R1OwangW7ok4tWZTPMzF381PU3SJT3/Yh1SwTzwL3Ch4sduSf1fg8QetlOvvZ1EN7k5pLZhwaXNE7i/uYlpDUxa+0qz9/YyUioOyKxbpdkGpE9XT+Nltjz1cn7/ClftsWYuDRTNJljo9OfkLMRu11oBH6NfkO7VT2WoKAe+hs6WqgmoDOhOoxokbmxBgZGfOJ5Yxs9Q4cWk+TaWghX/bUs9rwQp8AYNjqVZ/Ql4naG9txMordJab7KnbLgPRq4w/EiJ7CbzYnMiNuZ+U5qcCa9HDsTtH7+rp4MmKkWUmI2TfH5YogB42mbVg0yFGR+wv+ISWvyH9fO811zg8gX05x9AZGih8PXLQ047wQrlhLXPTLN8z3we79vFZkFvMqkkF+mG92yV4dPPHmpEFRquNW/v6kj1kWmt5AJW+Yyj9movLy7e937emkEQlMNAxbNHGamiaKyQDk8RE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L1U2dEc4VFdWYlRIcnk3MmFxbWV3OUo3UWM1bTRGcjAvaDlOTGM5d3R0UVVn?=
 =?utf-8?B?OWJ6ZTRicVJBM3pNbVdHL3hSWkZYTEtrTmJzR2RLRG1vT1BKL3laTXpLd0p2?=
 =?utf-8?B?RTlKeGVDa20xYUN3ZGoweFViU3pKcnFrTXF0OXVIM0ZpWFBXcGVpVVlOWDR4?=
 =?utf-8?B?N0hkeHMzUys3N0FBU3YyWkJSRmJqK3JwTGZIWUJRM2wvMjVkV3F3YjdnMjh5?=
 =?utf-8?B?WFRrY21RNTJlaHpsMXB6Y0NRMktrTGNUZ0VDRG45emNoaWc4d00wbHdkOUJF?=
 =?utf-8?B?cUpQWSt3VnhoaGtIN2hqWUF1YXFiVThvd2dIeWUrNnFYSWdZbys2WFRVY2VI?=
 =?utf-8?B?Yzh3dFczRXIxNTN6VFJmRW9OaTZka21QLzc0VnJlMWJiR2FIWGtKMUhnN3BJ?=
 =?utf-8?B?MmZNbEUwRGlpOUE5b05WUUhvUVdralhKVjdEZ2N1akhub1Jjdlk1Z0pydFh3?=
 =?utf-8?B?VEJ0Rk4zUEpUbFQ1eXUrMnlXVE43bVFpVDBJOUJyK0lYY3BDdFI0bnZ3Tzl3?=
 =?utf-8?B?TzdIY0RtOVVHN2xSajY4bzRxc3AwekUwV09qVC9OMnFuMGZxd2pkVy9BZ0ZG?=
 =?utf-8?B?VzgwU2FpanBaWm9veWdLQW5wVHh2dnNqeHJxL01mem8vcHBOcnVtWXB5M0Fn?=
 =?utf-8?B?Q2NsVjB4eXozS05TUG02eGlEM2ppRzJyWStYa3VkSHlMMUxqemorRFg2Riti?=
 =?utf-8?B?Rkdvb0FHQXViZzMycTZNbDNuNnhYcmhvaWRRcC9oeENwQkxGR0EyeXRjdkNU?=
 =?utf-8?B?eWJVUlJxaEJTVzJ5RkxYbmVoaEtvdEJrSzJ3WndRejVtdUhZV0lpWTEybmhy?=
 =?utf-8?B?U0drSlQzQTFMazJpS1dpcGJOSm10eVk1SHJ3YTlDSTg4ZmdmK0pOSU9EOVo5?=
 =?utf-8?B?QnA3TUdkanJrVWZpK0xyQnM0b09WYldiYUpsUTVRNHVsLzY2eHpmK0loczFk?=
 =?utf-8?B?QmhCbWpjdXFaeDNSczE1VXVVUzdJNzFMRDZNMnVENGE4WlRqckt0SUFSdWtj?=
 =?utf-8?B?ZDZQS3oyQWRFSERhY2VsQmpzYUIyMk1kdnRPL0JwVnBKczFOYzBFL0k4UDZ1?=
 =?utf-8?B?Q0ZBb09kVE1PNVJ2aG5iRWNpalpYS3NFZWVwQXM1USt2bjVHWE9UNTRBSG1I?=
 =?utf-8?B?dVpsYjJGRXp6OS9nenViK2JTOC9QUk9mNDRoSE5RSkZydTNtanM5UjFLYnpC?=
 =?utf-8?B?QlNUdlI1WTNXT0tPL2M1cWdRTjhTTWhkeVhCc2VLNVZONW5lQkxCWVJvYlBY?=
 =?utf-8?B?cnY5V2REQW9ualdrL1NIWkF5OWMzelZrdnlzeU53cUJUcktaOUV2ZlJyTXkv?=
 =?utf-8?B?elFkVllyWTFhay9TckRIYzZxcTBDZVcxMnNHcElFaDZLOFJRYmRnYmZqbUx5?=
 =?utf-8?B?RURac2F2Y2xhdkpQYWV1Mkp2bEs4NlBkQmpxNHdhOU0wcWNUcGF2Z0lubk81?=
 =?utf-8?B?TTREcGVmbUJBTWNYVW02ZUhodm9Va2tQZkI4V1V4Q2dIMVFVSXpqSmxLakpH?=
 =?utf-8?B?VmdoT0I1aHJKeW9OMjBXQ0N6M1BlS3k2Z3Irb3NhZThHZ0hLRDZ4ZzdtZXd6?=
 =?utf-8?B?TlFMTzQ3S0pTQlJQUjFGeDkyUmZNUXI5UHpPS0U1VlBYY0NPUyt2SkhzZzhZ?=
 =?utf-8?B?OUlRTUhUU2J6MU1xVjk2dlpaUmxENTJKdjZpVjBPcktPNlhyTUZCM1E1RGww?=
 =?utf-8?B?Y0NqREJrcGtZNnp2SmxZQWNqaFV0d0d2bnhscTRKMmVYMHdYOTF6OWphYm1F?=
 =?utf-8?B?Z3hDYU92OVpvdVNYaGwwRmNEOEl1RXJ2bmI3ZXI2eE5IWjRxQ1BHbXVCMmVw?=
 =?utf-8?B?TkxEM3dxaW82azBsVFYzK3dQRWtJZlRZSWtLOWs4U3l1UHQvK202dUt4SWlR?=
 =?utf-8?B?SEVzS1RtSVRaMUxTTGI4YllPbDhGVHBuNGtJU3oweTVpMEZWUVdrUGJkNnhJ?=
 =?utf-8?B?VlJtajFuVTRXNUlwMDZtSHE1bnd2UjdpUGpDa0tzZ2gwd3RUb3VFMWJIS0l6?=
 =?utf-8?B?RU01Q0hKdlZSVGFNWkR3azUyNUVMR0MvVVYxRnR4N3BRbDBHVG1rNEZUbzN5?=
 =?utf-8?B?emNGVHl1UFZtamFzSGFVRFkwRGE3Rm0vL1pnWmpEdVdMYndibzJUdmNsRVVV?=
 =?utf-8?B?UlgrVEhoRFNuYnVtb0RYZndJNEk1MXVSaEszUWh1Y1N0MHRDUlVCcm9rRktD?=
 =?utf-8?Q?rZuYtP3dHe9151deBZGLKxg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <996C6E110021CD47BC77497A62B2FE1B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5d2cc3-2283-4d24-06e6-08dc46993892
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2024 15:45:07.2424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jU/gjjh+2vFzojpDaAPL7JsavPeTdO34ZNqOvrYxzKubmYEubTXQ2On8s5SSs4m34mwtvv+m1obp5o5/gWMi3K1a938F7IRoDvNrFdsVZks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8650
X-Proofpoint-ORIG-GUID: NuRuHINoOci2C9RIOSFundAzoEsy2n-y
X-Proofpoint-GUID: NuRuHINoOci2C9RIOSFundAzoEsy2n-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_11,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403170123

DQoNCk9uIDEzLjAzLjI0IDA5OjE0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KDQpIZWxsbyBKdWVy
Z2VuDQoNCg0KPiBXaGVuIHVuYmluZGluZyBhIHVzZXIgZXZlbnQgY2hhbm5lbCwgdGhlIHJlbGF0
ZWQgaGFuZGxlciBtaWdodCBiZQ0KPiBjYWxsZWQgYSBsYXN0IHRpbWUgaW4gY2FzZSB0aGUga2Vy
bmVsIHdhcyBidWlsdCB3aXRoDQo+IENPTkZJR19ERUJVR19TSElSUS4gVGhpcyBtaWdodCBjYXVz
ZSBhIFdBUk4oKSBpbiB0aGUgaGFuZGxlci4NCj4gDQo+IEF2b2lkIHRoYXQgYnkgYWRkaW5nIGFu
ICJ1bmJpbmRpbmciIGZsYWcgdG8gc3RydWN0IHVzZXJfZXZlbnQgd2hpY2gNCj4gd2lsbCBzaG9y
dCBjaXJjdWl0IHRoZSBoYW5kbGVyLg0KPiANCj4gRml4ZXM6IDllOTBlNThjMTFiNyAoInhlbjog
ZXZ0Y2huOiBBbGxvdyBzaGFyZWQgcmVnaXN0cmF0aW9uIG9mIElSUSBoYW5kZXJzIikNCj4gUmVw
b3J0ZWQtYnk6IERlbWkgTWFyaWUgT2Jlbm91ciA8ZGVtaUBpbnZpc2libGV0aGluZ3NsYWIuY29t
Pg0KPiBUZXN0ZWQtYnk6IERlbWkgTWFyaWUgT2Jlbm91ciA8ZGVtaUBpbnZpc2libGV0aGluZ3Ns
YWIuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
DQoNCg0KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNo
ZW5rb0BlcGFtLmNvbT4NCg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMveGVuL2V2dGNobi5jIHwgNiAr
KysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy94ZW4vZXZ0Y2huLmMgYi9kcml2ZXJzL3hlbi9ldnRjaG4uYw0KPiBpbmRl
eCA1OTcxNzYyOGNhNDIuLmY2YTIyMTZjMmM4NyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy94ZW4v
ZXZ0Y2huLmMNCj4gKysrIGIvZHJpdmVycy94ZW4vZXZ0Y2huLmMNCj4gQEAgLTg1LDYgKzg1LDcg
QEAgc3RydWN0IHVzZXJfZXZ0Y2huIHsNCj4gICAJc3RydWN0IHBlcl91c2VyX2RhdGEgKnVzZXI7
DQo+ICAgCWV2dGNobl9wb3J0X3QgcG9ydDsNCj4gICAJYm9vbCBlbmFibGVkOw0KPiArCWJvb2wg
dW5iaW5kaW5nOw0KPiAgIH07DQo+ICAgDQo+ICAgc3RhdGljIHZvaWQgZXZ0Y2huX2ZyZWVfcmlu
ZyhldnRjaG5fcG9ydF90ICpyaW5nKQ0KPiBAQCAtMTY0LDYgKzE2NSwxMCBAQCBzdGF0aWMgaXJx
cmV0dXJuX3QgZXZ0Y2huX2ludGVycnVwdChpbnQgaXJxLCB2b2lkICpkYXRhKQ0KPiAgIAlzdHJ1
Y3QgcGVyX3VzZXJfZGF0YSAqdSA9IGV2dGNobi0+dXNlcjsNCj4gICAJdW5zaWduZWQgaW50IHBy
b2QsIGNvbnM7DQo+ICAgDQo+ICsJLyogSGFuZGxlciBtaWdodCBiZSBjYWxsZWQgd2hlbiB0ZWFy
aW5nIGRvd24gdGhlIElSUS4gKi8NCj4gKwlpZiAoZXZ0Y2huLT51bmJpbmRpbmcpDQo+ICsJCXJl
dHVybiBJUlFfSEFORExFRDsNCj4gKw0KPiAgIAlXQVJOKCFldnRjaG4tPmVuYWJsZWQsDQo+ICAg
CSAgICAgIkludGVycnVwdCBmb3IgcG9ydCAldSwgYnV0IGFwcGFyZW50bHkgbm90IGVuYWJsZWQ7
IHBlci11c2VyICVwXG4iLA0KPiAgIAkgICAgIGV2dGNobi0+cG9ydCwgdSk7DQo+IEBAIC00MjEs
NiArNDI2LDcgQEAgc3RhdGljIHZvaWQgZXZ0Y2huX3VuYmluZF9mcm9tX3VzZXIoc3RydWN0IHBl
cl91c2VyX2RhdGEgKnUsDQo+ICAgDQo+ICAgCUJVR19PTihpcnEgPCAwKTsNCj4gICANCj4gKwll
dnRjaG4tPnVuYmluZGluZyA9IHRydWU7DQo+ICAgCXVuYmluZF9mcm9tX2lycWhhbmRsZXIoaXJx
LCBldnRjaG4pOw0KPiAgIA0KPiAgIAlkZWxfZXZ0Y2huKHUsIGV2dGNobik7

