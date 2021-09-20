Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859234113A6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 13:39:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190802.340594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSHdZ-0003aZ-Ig; Mon, 20 Sep 2021 11:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190802.340594; Mon, 20 Sep 2021 11:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSHdZ-0003Xj-F3; Mon, 20 Sep 2021 11:39:05 +0000
Received: by outflank-mailman (input) for mailman id 190802;
 Mon, 20 Sep 2021 11:39:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OU0u=OK=epam.com=prvs=9897642576=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mSHdY-0003Xd-8Q
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 11:39:04 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fe7d193-f0c5-4e21-baf0-afa5a6afb683;
 Mon, 20 Sep 2021 11:39:03 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18K9vsJd027588; 
 Mon, 20 Sep 2021 11:39:01 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b6nf58vwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 11:39:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR0302MB3425.eurprd03.prod.outlook.com (2603:10a6:208:3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 11:38:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 11:38:56 +0000
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
X-Inumbo-ID: 0fe7d193-f0c5-4e21-baf0-afa5a6afb683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNchorLNEEEy5J9hDMuYsJcCLjjdS13dsjWYlq0fhubdi/SACFFxuHr2SLSzE6QeSb8HxjuX/TbP0aCJ6T/aszDG7n0tBejTOYJic+TblhT8vnTNiIKjuU0jO+TQ1HITHqZcGQd+KvV7e4ofxp8uo0yNFUjQQns0KuSw69kfQj2hGLehFrtH34QtJDx0fcBBGx+zSSdz5o4I9kyi1opBk7uwwSyjihUdg9INcRxpRTBAEUTf4mRyHOJAJ7jEsEIVxwmDffra9taPIhO/IPMYamit5pmLYnaTdjJXLpnHqL0plioH6VfhDiyg83tVP7fL7ZpaXvwceipnsPM8gFraJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gLPEPmNqvodFxSNvrsQXjNALp/bhHYk2JHzMRRn8SMQ=;
 b=irsNS4Mzm5dXMc8WDlapYbOgAL0MxWd5AygZm/+4+8M9tFBVaQ5rko59HcJUvgNqQYp3cUYmFX2wngZ0ZXg4tTVfynmvZPG35XajZaZabr3rTfR8EpC7izWpKBHj1jshHO5dJvxG97a1KqDcB2ljn5RtAxwlQaeqNiAswPNyytEIH7/CIe8TTk8qmRlsVQCexxRk5XVZMAuX3yhDyj7YdQnSvMUZhDmExmNXlwr3ThormF3xiBss2eXgtcTNhwIzzG/w/7LshMsu1klgiwEtZBYJEYD4+dSIQzqFIUo7Et6EpM9TCBz11mddLis60+ewPyKxCnHdsA1kmjnHXv1VBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLPEPmNqvodFxSNvrsQXjNALp/bhHYk2JHzMRRn8SMQ=;
 b=eotOO9wzB38SfNj2ZPlbUDVleaWQk2HnZYKXQe08vGkcuXWtO+tyPZtVQajtqQNUaGeAvl4vn/abqFI9ETrwo7Rgz/47YOS33SaeyhU+25nPiRNFopJwAOAMkI5GW58zbo2TNMN3M6lK9S3SYwrHaaq6d1wybx1s94YdRhhj8xzHCJ3QMre5x/3+67CBQlhc3Ip0RMynjZb7XB9PE/E/kOQkbtnKJ4BQujavmeVXhPq72MgerNmPwW/9x00MfwHv9AsP/z/tS0GIaeDVIaIp2WZ/05T8MD+o+zf3dXGRyiU4MOlOpH+bT9KyggjXRE4/IxciA3TzUgtVLnD+DIRCZQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Anastasiia
 Lukianenko <Anastasiia_Lukianenko@epam.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Topic: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Index: AQHXq8QnOfGIukpGqE2hMWXmS9bdmKuow0KAgAOkhICAAGZ9AIAAAmOA
Date: Mon, 20 Sep 2021 11:38:55 +0000
Message-ID: <7f873e38-0362-1f60-7347-a490c9dc8572@epam.com>
References: <20210917130123.1764493-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s>
 <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>
 <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
In-Reply-To: <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe436960-046c-4877-1678-08d97c2b3abe
x-ms-traffictypediagnostic: AM0PR0302MB3425:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR0302MB3425621378B5E9C4EECC8B77E7A09@AM0PR0302MB3425.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rPG4IowOL6wV33kmd8FXejJiL6xEcTJkC6FU8d7yPgTHOl7sTrqehyn8GUlKNmMEdA/JwSd5g/ceR0xn26UZi7UsyFGmQJdRA4NXkuN6RSsN61L8sMEfI7FYsJGSCt865kD/w9z1he3mMJFfXhU+ruyZvJHUScaDwS/vfkkzvfnyNulOdEntEjqxo6pegfAKaQUrOjkb901Csq62+bylQy48xFfObLT1cCM+hzf2Q+MmyYq0MnXYpNdNWyipYD1H+kU9gZfOq/CmklP/0oLdCHjLW8NoS00wixUFFGxJ9SjpQ7YSVGuP1hoBX3C9yGFh/wKCckw7Pmulk238zu2L8IN1VnVGfZ+xNSxJSPXcU9frO/a5CgPh9p/OlAEQnU76u5eT///c6B7LqES+Nk6tCjMC1c4QcSdfLaz7xFMoQt1MB4XtQB9hnVDfVjchNThEeKpQTFVWwcsuTPq/9ly/M196ANEqEL/nCP3Ax+hn4c6vTEA0PYBchJF5Oquowvhp9+meg4peZulqZ7RowU11WMMFXzJIc4YN5WudgUNeKo5dZ1Xx2orkUMBbLHa1ZhRYssDast0Myn5mHZL5aENm4O41Q2GzhvODhjBPjVeGv8usYoP7kVzSU7hwJMUzHJLJebl4wubU0RqgAWwxaXr5OvjuFWirp18xQD5SRK23O/svBJoYUsN1gqlvU7dYoHLPQs0kZRPnaVCrghk67X67cDtx0jWrugmDtZHtTk+1PBAWWCY9scE4Mm3llAc+PcY+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(36756003)(6512007)(26005)(6506007)(83380400001)(2616005)(8676002)(38100700002)(31686004)(8936002)(122000001)(186003)(53546011)(508600001)(5660300002)(6486002)(66946007)(316002)(54906003)(86362001)(66446008)(38070700005)(66556008)(71200400001)(66476007)(64756008)(76116006)(31696002)(110136005)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?THVWQjZKbmU1QzdHMFFqTVc4MEErY2dBSjZkVlg4MldjRndkNzZwUjlqMFY2?=
 =?utf-8?B?aUd3Vm0vTDhtVVpqWmZhZmxhRTFzSUJzaXBuVC9JZzZXRVNrRlpyV2t0OHox?=
 =?utf-8?B?eTRSYjNFRkF6RUVqTFVBSzg4UFRpNDUwSXRVOW1QdjdPMFk5Z1hIODNlK0ZE?=
 =?utf-8?B?Y1hIWEZlNms2bFdqN25sVTZKZ3BMV21nazIrTm9QT3ZXVDgvdmQwN1U1YUt6?=
 =?utf-8?B?VUp1V3dJcWV4blFsRkxOZE15aUM5eUZ1WlB6M0toOVpGdURaRnZlU2F0OFlr?=
 =?utf-8?B?NVd1WGNIQTFwNlg4dXZsWWxXcDVvQW5WUy9oTlExWTlJNFo1RWx4NWgvWEJ2?=
 =?utf-8?B?WmY4OEpjNjQ2STNoSTYyTm9KM1R5WnRqdlNFUE1SWExYQVVLZGxwUzBjR2cx?=
 =?utf-8?B?cWJ6YU13QUd1S1c4R0lWUTZYVXNjT2VjSFdwSUJ4dStxRzI5c3BvNHhxaDk1?=
 =?utf-8?B?L1g2M1lIOWRBUm8yaTVlUDNUdmFoM2NVendtL2hmK21mSmk1bUllblNmR3po?=
 =?utf-8?B?SEpRbzU5R0IxWGhwQ28wQ25CRWhVSW5XaEgveGpja2NZRE9mTGhHdW04UmlT?=
 =?utf-8?B?cVlBVlR0NlBsMmNnbkdkQzRqSGFPZFdlTS9mSC9EaXdmZEtpS1psZmRocENj?=
 =?utf-8?B?WjEvU0s3bnJURzBFTklpdmZLNHhXTkZjZ2JYY21zSUNHS1pCMW9oNkVRVFB4?=
 =?utf-8?B?V2lTaDZCc1dLaWY0YjlxZEM2czFnbzZ1TzI5Y3RldGtrUnV5WDMvdUo2WFRC?=
 =?utf-8?B?ZG5KbWpOUUxJdEF5aE9abEVweTFVQjlVMmJZeUdLb0I5ZG1aYjBUMVROdFJT?=
 =?utf-8?B?SGVmNUVFbi9yNG15Y2pFNWxPTU81U1c5M2FtZ0NDN3pFSUxCS1EvYkdVMEdP?=
 =?utf-8?B?UlpBTERWVnFzUm9UM0EvS1VaYmhrL0tWcm1JcW1kVDZkY3Y0SUtacXArUFB3?=
 =?utf-8?B?NDU4QVhNR25uVHIxMkxCMDdEVXU1L2hOSXJHR1hzM0UxUEI5SzIrVHQrWnRM?=
 =?utf-8?B?ZzFZcnFqS2JsUmtORkZ4SHV0ZFlFQTZ6Z2p5akNsTHVEcitJNnpJQ3pxZzdx?=
 =?utf-8?B?NmJXS2NVSHorcUhZTFRPY1h4cWZFWVBRd2QxUnRqNlM5ZWo5ekJBamZvOUhQ?=
 =?utf-8?B?bTEwd0JkSTJ4S3FsaXJFSlJJUDQrVEd0aXk0MThVY29rWGRkVmUwVzcyV0pC?=
 =?utf-8?B?UWh1VFFiT1JGVHBYVXhkTG9qUk9hdDJnekk5VFZpaW5DajB5bFlmUnFWNlUy?=
 =?utf-8?B?NXk3OXVIdFp6bFB0OFRpTzk0dE4rNGR2L0dWZThBbm5vKzZ2V2JLWE5LZ2Zl?=
 =?utf-8?B?bEZ5R3FhQTBZcUlmVjg4TGhzcVlQL1U4azVXN054UnVOdUU1TlJFNjVsM2xU?=
 =?utf-8?B?WGtKT3lwSjNuVGYwSC95M2ROelpMeEdBRTNLcGo2Mlp1UjdKZWxUMnpCaEF0?=
 =?utf-8?B?YzlUaDJ5Z0tvbFJPRDREVk9DejZGeEFqMjA1d3NQY1UvQWk0cVlDTlpLVFEz?=
 =?utf-8?B?RDdQOUJmVzFtV2VuSkgxYi9oRWlTeHlOYUNvV0dHbjdqK3ZMUXRZVVdZeFJp?=
 =?utf-8?B?aTVvQTFRdVczYjlqbVZ0czcrT2wzVmkzQVo3TG9yUFlJUDM1MFZGNEhFRVNH?=
 =?utf-8?B?VjhaSzJWR1g0aGpFK0haRmdkVXp5NEZ1aW4rN2FpOUpZTTVSdDNzSWdidjN6?=
 =?utf-8?B?L1lxSG5YS0pzVWtKSEZFTXNoT0IyNitRUTd3UGRKaWh6M2p0aVpzRGNPMjBu?=
 =?utf-8?Q?wZ54eA/QuHlRGKIJSuAd5bmVQB68vlrKQQ8DlfT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9385FCB10ECAD4DA369973DD1032D68@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe436960-046c-4877-1678-08d97c2b3abe
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2021 11:38:55.9693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FHqEuwk4/397eSOjdrUmf/ceNyBsmpvlNAwVB4mX0RNa43nr8SB2Fh3zp8TazhAcyGzP7DRIyDSQq0fqWX4aesk07HUYPOz/zRqD8gVGZ1k/jU20t7MYLSoqs3k2/SK8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0302MB3425
X-Proofpoint-ORIG-GUID: yubpBfw5fDnaiQ5sWxWSjt1GkKUtA1-D
X-Proofpoint-GUID: yubpBfw5fDnaiQ5sWxWSjt1GkKUtA1-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_06,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=985 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109200073

SGVsbG8sIEp1ZXJnZW4hDQoNCk9uIDIwLjA5LjIxIDE0OjMwLCBKdWVyZ2VuIEdyb3NzIHdyb3Rl
Og0KPiBPbiAyMC4wOS4yMSAwNzoyMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+
PiBIZWxsbywgU3RlZmFubyENCj4+DQo+PiBPbiAxOC4wOS4yMSAwMDo0NSwgU3RlZmFubyBTdGFi
ZWxsaW5pIHdyb3RlOg0KPj4+IEhpIE9sZWtzYW5kciwNCj4+Pg0KPj4+IFdoeSBkbyB5b3Ugd2Fu
dCB0byBlbmFibGUgcGNpYmFjayBvbiBBUk0/IElzIGl0IG9ubHkgdG8gImRpc2FibGUiIGEgUENJ
DQo+Pj4gZGV2aWNlIGluIERvbTAgc28gdGhhdCBpdCBjYW4gYmUgc2FmZWx5IGFzc2lnbmVkIHRv
IGEgRG9tVT8NCj4+IE5vdCBvbmx5IHRoYXQNCj4+Pg0KPj4+IEkgYW0gYXNraW5nIGJlY2F1c2Ug
YWN0dWFsbHkgSSBkb24ndCB0aGluayB3ZSB3YW50IHRvIGVuYWJsZSB0aGUgUFYgUENJDQo+Pj4g
YmFja2VuZCBmZWF0dXJlIG9mIHBjaWJhY2sgb24gQVJNLCByaWdodD8gVGhhdCB3b3VsZCBjbGFz
aCB3aXRoIHRoZSBQQ0kNCj4+PiBhc3NpZ25tZW50IHdvcmsgeW91IGhhdmUgYmVlbiBkb2luZyBp
biBYZW4uIFRoZXkgY291bGRuJ3QgYm90aCB3b3JrIGF0DQo+Pj4gdGhlIHNhbWUgdGltZS4NCj4+
IENvcnJlY3QsIGl0IGlzIG5vdCB1c2VkDQo+Pj4NCj4+PiBJZiB3ZSBvbmx5IG5lZWQgcGNpYmFj
ayB0byAicGFyayIgYSBkZXZpY2UgaW4gRG9tMCwgd291bGRuJ3QgaXQgYmUNCj4+PiBwb3NzaWJs
ZSBhbmQgYmV0dGVyIHRvIHVzZSBwY2ktc3R1YiBpbnN0ZWFkPw0KPj4NCj4+IE5vdCBvbmx5IHRo
YXQsIHNvIHBjaS1zdHViIGlzIG5vdCBlbm91Z2gNCj4+DQo+PiBUaGUgZnVuY3Rpb25hbGl0eSB3
aGljaCBpcyBpbXBsZW1lbnRlZCBieSB0aGUgcGNpYmFjayBhbmQgdGhlIHRvb2xzdGFjaw0KPj4g
YW5kIHdoaWNoIGlzIHJlbGV2YW50L21pc3NpbmcvbmVlZGVkIGZvciBBUk06DQo+Pg0KPj4gMS4g
cGNpYmFjayBpcyB1c2VkIGFzIGEgZGF0YWJhc2UgZm9yIGFzc2lnbmFibGUgUENJIGRldmljZXMs
IGUuZy4geGwNCj4+IMKgIMKgwqAgcGNpLWFzc2lnbmFibGUte2FkZHxyZW1vdmV8bGlzdH0gbWFu
aXB1bGF0ZXMgdGhhdCBsaXN0LiBTbywgd2hlbmV2ZXIgdGhlDQo+PiDCoCDCoMKgIHRvb2xzdGFj
ayBuZWVkcyB0byBrbm93IHdoaWNoIFBDSSBkZXZpY2VzIGNhbiBiZSBwYXNzZWQgdGhyb3VnaCBp
dCByZWFkcw0KPj4gwqAgwqDCoCB0aGF0IGZyb20gdGhlIHJlbGV2YW50IHN5c2ZzIGVudHJpZXMg
b2YgdGhlIHBjaWJhY2suDQo+Pg0KPj4gMi4gcGNpYmFjayBpcyB1c2VkIHRvIGhvbGQgdGhlIHVu
Ym91bmQgUENJIGRldmljZXMsIGUuZy4gd2hlbiBwYXNzaW5nIHRocm91Z2gNCj4+IMKgIMKgwqAg
YSBQQ0kgZGV2aWNlIGl0IG5lZWRzIHRvIGJlIHVuYm91bmQgZnJvbSB0aGUgcmVsZXZhbnQgZGV2
aWNlIGRyaXZlciBhbmQgYm91bmQNCj4+IMKgIMKgwqAgdG8gcGNpYmFjayAoc3RyaWN0bHkgc3Bl
YWtpbmcgaXQgaXMgbm90IHJlcXVpcmVkIHRoYXQgdGhlIGRldmljZSBpcyBib3VuZCB0bw0KPj4g
wqAgwqDCoCBwY2liYWNrLCBidXQgcGNpYmFjayBpcyBhZ2FpbiB1c2VkIGFzIGEgZGF0YWJhc2Ug
b2YgdGhlIHBhc3NlZCB0aHJvdWdoIFBDSQ0KPj4gwqAgwqDCoCBkZXZpY2VzLCBzbyB3ZSBjYW4g
cmUtYmluZCB0aGUgZGV2aWNlcyBiYWNrIHRvIHRoZWlyIG9yaWdpbmFsIGRyaXZlcnMgd2hlbg0K
Pj4gwqAgwqDCoCBndWVzdCBkb21haW4gc2h1dHMgZG93bikNCj4+DQo+PiAzLiBEZXZpY2UgcmVz
ZXQNCj4+DQo+PiBXZSBoYXZlIHByZXZpb3VzbHkgZGlzY3Vzc2VkIG9uIHhlbi1kZXZlbCBNTCBw
b3NzaWJsZSBzb2x1dGlvbnMgdG8gdGhhdCBhcyBmcm9tIHRoZQ0KPj4gYWJvdmUgd2Ugc2VlIHRo
YXQgcGNpYmFjayBmdW5jdGlvbmFsaXR5IGlzIGdvaW5nIHRvIGJlIG9ubHkgcGFydGlhbGx5IHVz
ZWQgb24gQXJtLg0KPj4NCj4+IFBsZWFzZSBzZWUgWzFdIGFuZCBbMl06DQo+Pg0KPj4gMS4gSXQg
aXMgbm90IGFjY2VwdGFibGUgdG8gbWFuYWdlIHRoZSBhc3NpZ25hYmxlIGxpc3QgaW4gWGVuIGl0
c2VsZg0KPj4NCj4+IDIuIHBjaWJhY2sgY2FuIGJlIHNwbGl0IGludG8gdHdvIHBhcnRzOiBQQ0kg
YXNzaWduYWJsZS9iaW5kL3Jlc2V0IGhhbmRsaW5nIGFuZA0KPj4gdGhlIHJlc3QgbGlrZSB2UENJ
IGV0Yy4NCj4+DQo+PiAzLiBwY2lmcm9udCBpcyBub3QgdXNlZCBvbiBBcm0NCj4NCj4gSXQgaXMg
bmVpdGhlciBpbiB4ODYgUFZIL0hWTSBndWVzdHMuDQpEaWRuJ3Qga25vdyB0aGF0LCB0aGFuayB5
b3UgZm9yIHBvaW50aW5nDQo+DQo+PiBTbywgbGltaXRlZCB1c2Ugb2YgdGhlIHBjaWJhY2sgaXMg
b25lIG9mIHRoZSBicmlja3MgdXNlZCB0byBlbmFibGUgUENJIHBhc3N0aHJvdWdoDQo+PiBvbiBB
cm0uIEl0IHdhcyBlbm91Z2ggdG8ganVzdCByZS1zdHJ1Y3R1cmUgdGhlIGRyaXZlciBhbmQgaGF2
ZSBpdCBydW4gb24gQXJtIHRvIGFjaGlldmUNCj4+IGFsbCB0aGUgZ29hbHMgYWJvdmUuDQo+Pg0K
Pj4gSWYgd2Ugc3RpbGwgdGhpbmsgaXQgaXMgZGVzaXJhYmxlIHRvIGJyZWFrIHRoZSBwY2liYWNr
IGRyaXZlciBpbnRvICJjb21tb24iIGFuZCAicGNpZnJvbnQgc3BlY2lmaWMiDQo+PiBwYXJ0cyB0
aGVuIGl0IGNhbiBiZSBkb25lLCB5ZXQgdGhlIHBhdGNoIGlzIGdvaW5nIHRvIGJlIHRoZSB2ZXJ5
IGZpcnN0IGJyaWNrIGluIHRoYXQgYnVpbGRpbmcuDQo+DQo+IERvaW5nIHRoaXMgc3BsaXQgc2hv
dWxkIGJlIGRvbmUsIGFzIHRoZSBwY2lmcm9udCBzcGVjaWZpYyBwYXJ0IGNvdWxkIGJlDQo+IG9t
aXR0ZWQgb24geDg2LCB0b28sIGluIGNhc2Ugbm8gUFYgZ3Vlc3RzIHVzaW5nIFBDSSBwYXNzdGhy
b3VnaCBoYXZlIHRvDQo+IGJlIHN1cHBvcnRlZC4NCkFncmVlLCB0aGF0IHRoZSBmaW5hbCBzb2x1
dGlvbiBzaG91bGQgaGF2ZSB0aGUgZHJpdmVyIHNwbGl0DQo+DQo+PiBTbywgSSB0aGluayB0aGlz
IHBhdGNoIGlzIHN0aWxsIGdvaW5nIHRvIGJlIG5lZWRlZCBiZXNpZGVzIHdoaWNoIGRpcmVjdGlv
biB3ZSB0YWtlLg0KPg0KPiBTb21lIGtpbmQgb2YgdGhpcyBwYXRjaCwgeWVzLiBJdCBtaWdodCBs
b29rIGRpZmZlcmVudCBpbiBjYXNlIHRoZSBzcGxpdA0KPiBpcyBkb25lIGZpcnN0Lg0KPg0KPiBJ
IGRvbid0IG1pbmQgZG9pbmcgaXQgaW4gZWl0aGVyIHNlcXVlbmNlLg0KPg0KV2l0aCB0aGlzIHBh
dGNoIHdlIGhhdmUgQXJtIG9uIHRoZSBzYW1lIHBhZ2UgYXMgdGhlIGFib3ZlIG1lbnRpb25lZCB4
ODYgZ3Vlc3RzLA0KDQplLmcuIHRoZSBkcml2ZXIgaGFzIHVudXNlZCBjb2RlLCBidXQgeWV0IGFs
bG93cyBBcm0gdG8gZnVuY3Rpb24gbm93Lg0KDQpBdCB0aGlzIHN0YWdlIG9mIFBDSSBwYXNzdGhy
b3VnaCBvbiBBcm0gaXQgaXMgeWV0IGVub3VnaC4gTG9uZyB0ZXJtLCB3aGVuDQoNCnRoZSBkcml2
ZXIgZ2V0cyBzcGxpdCwgQXJtIHdpbGwgYmVuZWZpdCBmcm9tIHRoYXQgc3BsaXQgdG9vLCBidXQg
dW5mb3J0dW5hdGVseSBJIGRvIG5vdA0KDQpoYXZlIGVub3VnaCBiYW5kd2lkdGggZm9yIHRoYXQg
cGllY2Ugb2Ygd29yayBhdCB0aGUgbW9tZW50Lg0KDQo+DQo+IEp1ZXJnZW4NCg0KVGhhbmsgeW91
LA0KDQpPbGVrc2FuZHINCg==

