Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE804D7AE6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 07:40:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289916.491614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTeNd-0006Ob-CG; Mon, 14 Mar 2022 06:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289916.491614; Mon, 14 Mar 2022 06:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTeNd-0006M4-9E; Mon, 14 Mar 2022 06:40:33 +0000
Received: by outflank-mailman (input) for mailman id 289916;
 Mon, 14 Mar 2022 06:40:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NoMf=TZ=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1nTeNc-0006Li-Dx
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 06:40:32 +0000
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a358cf7e-a361-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 07:40:30 +0100 (CET)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2022 23:40:27 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 13 Mar 2022 23:40:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 13 Mar 2022 23:40:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 13 Mar 2022 23:40:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Sun, 13 Mar 2022 23:40:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Sun, 13 Mar 2022 23:40:26 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MWHPR1101MB2349.namprd11.prod.outlook.com (2603:10b6:300:79::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 06:40:11 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::c8aa:b5b2:dc34:e893%8]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 06:40:10 +0000
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
X-Inumbo-ID: a358cf7e-a361-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647240030; x=1678776030;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=czyHI8KkCYHqEByd+ZuhEe+bUHITDOyIXb9DONK4qFo=;
  b=e5SCmlz/dKM+CR/h42smQFt+diJVp0EdAv6iHfWWtqEqpWFTgxE4H2Td
   XQaE6o30YsJqQvXkv6br13QD/wac0fk/myP63bw3VaJWs8m6q6+eEdKTv
   IR1+2xdrgQYnnZVYhjHBSngHhistM492W9rDBx+PdRsOjdTCs21OAEkPZ
   zNTS9p3dnRwmMPSRjom7w+9W9A+fRStSM8d3TFV/lQ8PizWaEpZhfzKg9
   iaa5WpFjK6enpDeroepqgRRz4QmL9HoZiDN4z95oYRbc0bDZxJ4W49ePQ
   QTbE7iGMdxBB4+8DGPZqNNSxON7j0OxSkc5ej6bubaW9QTRi5GH++vqMz
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="256135385"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="256135385"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="713598318"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjGgBLn0/LbdXFARncJ0a6YHSL0bBKzd1t3iNy1NXphtil57/gOnzv6h89dbmsDWlMvWFtqYcechTPzQtbDZ2lArYmuGgss8hWqtKm+njoTvdgvuqUqW6KCOwTzo+gd8uEL1IvZFIQPdJmC+o9s6IV4zN8CJLv5RXs5Fxlm2Oc/RsIn2vQAAPSCILdZ1FpnjOENMR+cPJwk2rJDdA7l00GifIJj3GMxW3+L7gju/MbMfNektblt6HgMLDcwHVkTOMvaxW3qypj4aNNZoUrnRYq5cC9A3Tp9OEy2H+dvqgvgN/sdgd6Ul64Ns6kJSXPcB5ApyOMJAn9o8nPaUVwqBIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czyHI8KkCYHqEByd+ZuhEe+bUHITDOyIXb9DONK4qFo=;
 b=UxNuT1oFHahsdj9ET9vLnuZ9oCXu5OqJyif9dFnhMGxpGIJC3DdH0nVHuG/ROpNhmQf8aC3nPJTSa5d5A1IbBdFCz/QscNTPeaGjLQh/dScmzfBvd7C4zQy1bqRk6dG5iLxgdTr4ouAYvM3T0llS3DjB5imY4VfXeGs8FKBsutUTH06a7CilPNVBJUEuAaCbtvCnFemyytbrF8Laf3D9FJg+cIvZcwwbdaKvYeeKoZH6x7e+eB/22MuU/BXfHCGxNUpHd4Llf5nsqWdTN6ryaZblaVdtrW9GdNYEVnsPFmj0BSPTkiy8reJSBQoYpRaK6bwVXvS12h1ri5gkW1PzHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jane Malalane <jane.malalane@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Gross,
 Jurgen" <jgross@suse.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, "Beulich, Jan" <JBeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v5 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Topic: [PATCH v5 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYMjTwrgWmuXEjA0e1vahO/5egnKy+d+KA
Date: Mon, 14 Mar 2022 06:40:10 +0000
Message-ID: <BN9PR11MB527670221482173B63DB02FD8C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-2-jane.malalane@citrix.com>
In-Reply-To: <20220307150609.10662-2-jane.malalane@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f48e5611-f757-4e90-17b5-08da05857cd7
x-ms-traffictypediagnostic: MWHPR1101MB2349:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR1101MB2349745ED5FA3ED89036E2F28C0F9@MWHPR1101MB2349.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g0qnQRI57/4VXM2IZyZzd40YgVSdI0A8pq+ihdy8IC35TA3M662yiQwZd7wDa77NK+hhCBC2JNBVSLOSSdG+2Twbzjlbc/jKX7NR7+9aSw1C3wiH3RhIznsTQAhj30OXCCuz5PcWg0djqf8yaIiCF1tnL1qkPK2debtTIdCt//deAOIDvsJhZz+y0WXH4XWeJdmq7Sji5KinifLB5u9reHGLWbjkawBoPmzvkbsop4i/Ln2TISGiT7tzBXQs0x81PuycHM4UNvLmfxkoxTSuAaNvO4nvaQ40u8ZVMr9r6ivCAzlXVheqCyTN1IIYD0VauQjnWC8jGwktbiJrBKqz7fIjfz0sSSMwDEYzuKzxDdYQlNQHMM9GRPZOnKdaCNA3Efd834s33XNq4z/CJ18ZKKqMlQS3lvV1ewFUQiDcjEfXdg09AubCtfH0H9mEavL1ofPFDQvotzbjPQyVjD5JddONVaoythOZd/ICAVNDOHekz1nEuLsHXmhIJVPytD8X4aper8u13s/jGKhkWX3D6KfzTWxc1NI5W+itO0I5J5wtlqplrG6FR9ihVksC3aQNHRLZD8BQP/DFAHRVPuiI5I6pv1IBRkWrENbpUpvvztn++64lJgLvNShSdD4wM2ej5lA0tLVxBCNdaKOvz/SQzcSORNJA1w7YnN32PbIkQ1IX8Guxwt9PtWdDtaFFDSSwmuXMOopVa4hoNjeNAcqX5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(52536014)(64756008)(71200400001)(38100700002)(66946007)(66446008)(66476007)(66556008)(76116006)(508600001)(7696005)(6506007)(26005)(5660300002)(33656002)(7416002)(82960400001)(186003)(9686003)(122000001)(110136005)(54906003)(2906002)(83380400001)(316002)(8676002)(4326008)(38070700005)(55016003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0hwRkFHZVJONENBaXpxNmN6R1kwSkkyN2ZUTXVSSHRIRFFpMFVVYVZNYUp2?=
 =?utf-8?B?MEwxMWhtVEN0WXBGeWprbTdBalNtZmhibGxCS0laUk9NdlNVNWJ6SDdxZGwv?=
 =?utf-8?B?a3AwV1krdG90NytnZ21LN2NISW9oVmQzY1dFcGdNTkUyeWkrZGpaYUZBUTFp?=
 =?utf-8?B?N0tZQldWWC8yYnV5TDNuR1h2aW1wRzVkM3RZRTRiT2prQlNGUjA1cE03ZzdW?=
 =?utf-8?B?aXhRZSttSFNtbGF3bER0aWR3WndZWjVhMmlaTzVwZDFmdUh6SmV4MmVHZmZh?=
 =?utf-8?B?azBOOEM3TnJwUm9sWnlBemhoeGxYeGUrTmZFSW5lbFZ3bG04aWZ3RzZ0c3Jk?=
 =?utf-8?B?R3pyUTJhdXFvc0x0VVB6QWd0T2NERXBYL2hId2NxS2tvbzZZb2JYbHpnMWZM?=
 =?utf-8?B?RG1kdDFkM0hrSlpLTTNrNXdvU0NBd0dkY0E5ZkRBSFg2OVZhU0xZVWRUWFgw?=
 =?utf-8?B?RGRuL1ZpczJEbEk4TURVWXJKR0F2QnhtRTRMaWlIczI2blhZdkNmY3JnOTMy?=
 =?utf-8?B?WkxSUzVWMkZEODhJUHgzamh6YlhNSGo5Und4VmRYM3BxbmFudnRBdDhwM3ZT?=
 =?utf-8?B?SGppK09UWUV0RXJWby81YWJ0R3FsSk16N3FXdG41eVFSOVpDVWJ0ZGxEcjA4?=
 =?utf-8?B?QkoxUnVnNU9POE44T2cvMHdpdmsyekhmcHNQNUUySzI1M2NZWkZDTFdON0hL?=
 =?utf-8?B?eVRCcnlmUy9nK244L1BmTkZxcVd3anEyU0lPb1BTRnk2NUE0TVFGYURGc2c1?=
 =?utf-8?B?a0p3cWVUM3hBc1VYRG8yUzBWTkJ2VlgzY3VSOThEVFdpSFRwNTI4Zm5qcFJZ?=
 =?utf-8?B?bjB5NjVtL1k0R3g4dmcrWUovS04vMm9iTjM0bWFReHR0UElPT1dxbmw0ODQz?=
 =?utf-8?B?VXJCVFFSOHNzYlJQU0tlL1ZFK2x2eXUxanJSaUtmMzMwb2JNTWIzUjdKQjdM?=
 =?utf-8?B?VXEzbnZGVEdLWDZ2WUE0alZiQy9MNUFUNXVCeitPRXJVdlVqVXR0L29yRG5V?=
 =?utf-8?B?RndJdFUrZW1XTTZVQmtTVndnK3BwUzNjb3pVcC9KTWEycjRpMktuck1XWVpT?=
 =?utf-8?B?WU9PYlZ6MmVGTWJCdzJlVUtMdzJ5cWFZSW1lQzJyMkRmQnlpdW5yWVZUSzNh?=
 =?utf-8?B?VVp2eWkvd0R3K0E2YjZBalRHWTNKMFpieUxySFIyamdLZjB2VDVObThrVnVy?=
 =?utf-8?B?VXFBdVI4c1RIYS9UNWo2T1QvemsvTGFva3JXQ3VrR3V6OHVtL1RtRGorOUNH?=
 =?utf-8?B?VUdwMFFmR01RbCtPY2dmekR2MFE3am05djk5ZSt0OHMwaStla1dTRjloVEkx?=
 =?utf-8?B?TmxVYnNXMnZhN254Qkd4ZmUwT2xxd0dnNUh5bldNTytGMktuenc0RWZjeXkx?=
 =?utf-8?B?VHNhbXVSTWY0RTI0MXVxZytPTGwyQU1SZGVFWXJhaG56Qnd5bmMvM04xd2dn?=
 =?utf-8?B?a2tHdS9xUi80ZHlxZmQ1UCtNeTBuUkJLK2VtZm5hM3FPeTUzcXNhS0JNeUwy?=
 =?utf-8?B?T2VPak9UcGxNbVFmeEQwbloyQm1WTmpZUTdmNCtob01MT0lUbGxtczFFN0g3?=
 =?utf-8?B?Mll2aUthNkk0SHhKUnlyZW96aDN0QnpPNG02OUFJUkkxaTlPK0QvcXkyNW51?=
 =?utf-8?B?bTQ3WEFRaU00SWZFaXFBSmcwcDBDL0RITGI2VWFlZ2htSTdiWmR5WlRBM3hI?=
 =?utf-8?B?YzdFeE5kdXlDRUp2dVRuM3k3c2ErekxJM09vT3pIR3NyWkdYWlBsa3ljK1E4?=
 =?utf-8?B?N2I1UXdvSll2TFFsRzF2L3dlOW50SFlETUYrRWF4VDZPaHN1OHZGQ3A2TXQv?=
 =?utf-8?B?WmV2Kzd2b1BCNEpxMUhsWEV1dDMxNzRSTzk4dTJ0dHd3Y3pXdmxvYzZpUDFC?=
 =?utf-8?B?L2g1TE4wYzZtKy9UV2NxeGtwLzBJd2c2OXR5Z2xUTU1DeS82MXlVR0Rzb1oy?=
 =?utf-8?Q?f0yXBvRRz2/1c+8eJlhDJkM8/jpzyR2S?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f48e5611-f757-4e90-17b5-08da05857cd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 06:40:10.7576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 58We7s/Fovg2sDQyZH0Se8msMWF8c2H2JRx3YRm3lMQII2VXABamS3VNHThf3DoQsE+UXm0SGd1MDT6FC/tLvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2349
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW5lIE1hbGFsYW5lIDxqYW5lLm1hbGFsYW5lQGNpdHJpeC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgTWFyY2ggNywgMjAyMiAxMTowNiBQTQ0KPiANCj4gQWRkIFhFTl9TWVNDVExfUEhZ
U0NBUF9BUkNIX0FTU0lTVEVEX3hhcGljIGFuZA0KPiBYRU5fU1lTQ1RMX1BIWVNDQVBfQVJDSF9B
U1NJU1RFRF94MmFwaWMgdG8gcmVwb3J0IGFjY2VsZXJhdGVkIHhhcGljDQo+IGFuZCB4MmFwaWMs
IG9uIHg4NiBoYXJkd2FyZS4NCj4gTm8gc3VjaCBmZWF0dXJlcyBhcmUgY3VycmVudGx5IGltcGxl
bWVudGVkIG9uIEFNRCBoYXJkd2FyZS4NCj4gDQo+IEhXIGFzc2lzdGVkIHhBUElDIHZpcnR1YWxp
emF0aW9uIHdpbGwgYmUgcmVwb3J0ZWQgaWYgSFcsIGF0IHRoZQ0KPiBtaW5pbXVtLCBzdXBwb3J0
cyB2aXJ0dWFsaXplX2FwaWNfYWNjZXNzZXMgYXMgdGhpcyBmZWF0dXJlIGFsb25lIG1lYW5zDQo+
IHRoYXQgYW4gYWNjZXNzIHRvIHRoZSBBUElDIHBhZ2Ugd2lsbCBjYXVzZSBhbiBBUElDLWFjY2Vz
cyBWTSBleGl0LiBBbg0KPiBBUElDLWFjY2VzcyBWTSBleGl0IHByb3ZpZGVzIGEgVk1NIHdpdGgg
aW5mb3JtYXRpb24gYWJvdXQgdGhlIGFjY2Vzcw0KPiBjYXVzaW5nIHRoZSBWTSBleGl0LCB1bmxp
a2UgYSByZWd1bGFyIEVQVCBmYXVsdCwgdGh1cyBzaW1wbGlmeWluZyBzb21lDQo+IGludGVybmFs
IGhhbmRsaW5nLg0KPiANCj4gSFcgYXNzaXN0ZWQgeDJBUElDIHZpcnR1YWxpemF0aW9uIHdpbGwg
YmUgcmVwb3J0ZWQgaWYgSFcgc3VwcG9ydHMNCj4gdmlydHVhbGl6ZV94MmFwaWNfbW9kZSBhbmQs
IGF0IGxlYXN0LCBlaXRoZXIgYXBpY19yZWdfdmlydCBvcg0KPiB2aXJ0dWFsX2ludHJfZGVsaXZl
cnkuIFRoaXMgaXMgZHVlIHRvIGFwaWNfcmVnX3ZpcnQgYW5kDQo+IHZpcnR1YWxfaW50cl9kZWxp
dmVyeSBwcmV2ZW50aW5nIGEgVk0gZXhpdCBmcm9tIG9jY3VyaW5nIG9yIGF0IGxlYXN0DQo+IHJl
cGxhY2luZyBhIHJlZ3VsYXIgRVBUIGZhdWx0IFZNLWV4aXQgd2l0aCBhbiBBUElDLWFjY2VzcyBW
TS1leGl0IG9uDQo+IHJlYWQgYW5kIHdyaXRlIEFQSUMgYWNjZXNzZXMsIHJlc3BlY3RpdmVseS4g
VGhpcyBhbHNvIG1lYW5zIHRoYXQNCj4gc3lzY3RsIGZvbGxvd3MgdGhlIGNvbmRpdGlvbmFscyBp
biB2bXhfdmxhcGljX21zcl9jaGFuZ2VkKCkuDQo+IA0KPiBGb3IgdGhhdCBwdXJwb3NlLCBhbHNv
IGFkZCBhbiBhcmNoLXNwZWNpZmljICJjYXBhYmlsaXRpZXMiIHBhcmFtZXRlcg0KPiB0byBzdHJ1
Y3QgeGVuX3N5c2N0bF9waHlzaW5mby4NCj4gDQo+IE5vdGUgdGhhdCB0aGlzIGludGVyZmFjZSBp
cyBpbnRlbmRlZCB0byBiZSBjb21wYXRpYmxlIHdpdGggQU1EIHNvIHRoYXQNCj4gQVZJQyBzdXBw
b3J0IGNhbiBiZSBpbnRyb2R1Y2VkIGluIGEgZnV0dXJlIHBhdGNoLiBVbmxpa2UgSW50ZWwgdGhh
dA0KPiBoYXMgbXVsdGlwbGUgY29udHJvbHMgZm9yIEFQSUMgVmlydHVhbGl6YXRpb24sIEFNRCBo
YXMgb25lIGdsb2JhbA0KPiAnQVZJQyBFbmFibGUnIGNvbnRyb2wgYml0LCBzbyBmaW5lLWdyYWlu
aW5nIG9mIEFQSUMgdmlydHVhbGl6YXRpb24NCj4gY29udHJvbCBjYW5ub3QgYmUgZG9uZSBvbiBh
IGNvbW1vbiBpbnRlcmZhY2UuDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEphbmUgTWFsYWxhbmUg
PGphbmUubWFsYWxhbmVAY2l0cml4LmNvbT4NCg0KQ2FuIHlvdSBhZGQgc29tZSBleHBsYW5hdGlv
biB3aHkgdGhpcyBjYXBhYmlsaXR5IG5lZWRzIHRvIGJlDQpyZXBvcnRlZCB0byB0b29sc3RhY2s/
DQoNClRoYW5rcw0KS2V2aW4NCg==

