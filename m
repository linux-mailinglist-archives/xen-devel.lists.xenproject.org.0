Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF64314FC3
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 17:14:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNfHU-0005pu-Mr; Mon, 06 May 2019 15:11:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vAR1=TG=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hNfHT-0005pm-8Z
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:11:51 +0000
X-Inumbo-ID: 45a0dfe8-7011-11e9-843c-bc764e045a96
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe45::62a])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 45a0dfe8-7011-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 15:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdeGlBvs9mS0EnNMn02YqJmZjEctbtoF2CCR62FqT4I=;
 b=Hk9R6SRpB4K76PieMZ9OXJpU3uuYl2RlTrWEaytdw6dx12sj3t9kosbDS7fmJ6rfCQcyxhfy0KWiALDd0A4UFpsqaIVB6LIonB2U2El9zzXfCMgFa35GwENxd7GJ6Bd/kXAbIHSKAPJ5r50uoJSy15fLXD+f+kvjuL48RAWnVik=
Received: from MWHPR12MB1597.namprd12.prod.outlook.com (10.172.56.10) by
 MWHPR12MB1743.namprd12.prod.outlook.com (10.175.55.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Mon, 6 May 2019 15:11:45 +0000
Received: from MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::e17e:557b:cac8:755a]) by MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::e17e:557b:cac8:755a%2]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 15:11:45 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Thread-Topic: [ANNOUNCE] Xen Project Community Call May 9th @15:00 UTC Call
 for agenda items
Thread-Index: AQHVBBLNsvndihfdkUydE/OfSeViBKZeM9yA
Date: Mon, 6 May 2019 15:11:44 +0000
Message-ID: <20190506151138.GA27876@amd.com>
References: <3BB17B7E-8CC6-4CEE-9A6C-1AA68EB503F3@xenproject.org>
In-Reply-To: <3BB17B7E-8CC6-4CEE-9A6C-1AA68EB503F3@xenproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR04CA0085.namprd04.prod.outlook.com
 (2603:10b6:805:f2::26) To MWHPR12MB1597.namprd12.prod.outlook.com
 (2603:10b6:301:10::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ebbf9aa-6d5a-487e-1661-08d6d235266b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1743; 
x-ms-traffictypediagnostic: MWHPR12MB1743:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR12MB1743B05E5AABCF21CAFE4A53E5300@MWHPR12MB1743.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(396003)(346002)(376002)(39860400002)(53754006)(199004)(189003)(72206003)(256004)(478600001)(316002)(410100003)(53936002)(6246003)(54906003)(7416002)(33656002)(2906002)(64756008)(36756003)(6116002)(71190400001)(102836004)(86362001)(66556008)(66446008)(66476007)(66946007)(4744005)(73956011)(71200400001)(26005)(3846002)(1076003)(6506007)(386003)(6916009)(8936002)(8676002)(99286004)(81166006)(81156014)(186003)(6306002)(6512007)(76176011)(52116002)(486006)(25786009)(229853002)(6486002)(5660300002)(66066001)(2616005)(476003)(11346002)(446003)(4326008)(6436002)(966005)(7736002)(305945005)(14454004)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1743;
 H:MWHPR12MB1597.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Qw/jBOFRWv5V2K+nKtbPQiUernYy9lDk0EXBy8LuLOevG+6TBpJ2XKBpMcyDn25s4rWmfUogl3YSCzN72WeClDgR1vu91ZphXeURGo88O6upacbAjuuAG2SzWI7PbluI5INFIb9yH/Ha4iCloXLjzcYVBMduGEmccNrDZlTpxexelbQ5N8VSj9sxqFZij5KjfTdYWcTk3Iu4ACX5Vx4UUMkZoQSnt7lGZlGc0NXONSy85c080qjb/PdayhMEuMhPqs4pLJnTkzQFpd0MWkkLYDcG5D4ZYEgMS/4WiaEknlNd7VFmNfyczS4NH8RlxjFi1KRm32dpy4LNZ0u5QP7vtkkkkzzZYs9cc/oYmFiVm90im1IS0xW/jA5qnoyCpjkAhfik/iIk3n6bjS2WO5mWoUm5iTZXiy16jI+Bskqf82w=
Content-ID: <FC8B72E49D5D944B83F5B0214DC4E114@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebbf9aa-6d5a-487e-1661-08d6d235266b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 15:11:44.8063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1743
Subject: Re: [Xen-devel] [ANNOUNCE] Xen Project Community Call May 9th
 @15:00 UTC Call for agenda items
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>, "Natarajan,
 Janakarajan" <Janakarajan.Natarajan@amd.com>,
 "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
 Julien Grall <julien.grall@arm.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, "Ji, John" <john.ji@intel.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, "Woods,
 Brian" <Brian.Woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMDYsIDIwMTkgYXQgMDc6NTE6MTdBTSAtMDYwMCwgTGFycyBLdXJ0aCB3cm90
ZToKPiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdCj4gCj4gSGkgYWxsLAo+IAo+IFBsZWFzZSBw
cm9wb3NlIHRvcGljcyBieSBlaXRoZXIgZWRpdGluZyB0aGUgcnVubmluZyBhZ2VuZGEgZG9jdW1l
bnQgYXQgaHR0cHM6Ly9kb2NzLmdvb2dsZS5jb20vZG9jdW1lbnQvZC8xa3ROLTV1OHVTY0V2aGY5
TjhVbTVvNnBvRjEybFZFbm55U0hKd183Sms4ay9lZGl0IyBvciBieSByZXBseWluZyB0byB0aGUg
bWFpbC4gSWRlYWxseSBieSBXZWRuZXNkYXkhCj4gCj4gQmVzdCBSZWdhcmRzCj4gTGFycwo+IAoK
SSdkIGxpa2UgdG8gYWRkIHRoZSBBTUQgbXdhaXQgVjIgcGF0Y2ggc2V0IHRvIHRoZSBsaXN0IG9m
IHRvcGljcy4gIEknZApsaWtlIHRvIGNvbWUgdG8gc29tZSBzb3J0IG9mIGNvbmNsdXNpb24gYWJv
dXQgdGhhdCBzZXQuCgotLSAKQnJpYW4gV29vZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
