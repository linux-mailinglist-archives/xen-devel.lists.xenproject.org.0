Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7449D510FD5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 06:10:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314329.532340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njYzf-0008SV-Vr; Wed, 27 Apr 2022 04:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314329.532340; Wed, 27 Apr 2022 04:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njYzf-0008Qf-R9; Wed, 27 Apr 2022 04:09:35 +0000
Received: by outflank-mailman (input) for mailman id 314329;
 Wed, 27 Apr 2022 04:09:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/sE=VF=intel.com=kevin.tian@srs-se1.protection.inumbo.net>)
 id 1njYze-0008QZ-9P
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 04:09:34 +0000
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5861b15-c5df-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 06:09:32 +0200 (CEST)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 21:09:28 -0700
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 26 Apr 2022 21:09:28 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 21:09:27 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 21:09:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 26 Apr 2022 21:09:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 26 Apr 2022 21:09:27 -0700
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 27 Apr
 2022 04:09:24 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::24dd:37c2:3778:1adb%2]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 04:09:24 +0000
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
X-Inumbo-ID: d5861b15-c5df-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651032572; x=1682568572;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5CEBpfM0nnYYOZ8kAid6Ce67P6Tfk0FK38+Fe9mQ86Y=;
  b=mFGvGljAZOGOFSjwk0SQD78ukkrv6VorfjPzhUmbnpgb/ShvBDXzHtRr
   O18JzJWN+1NSVv9VJju5V6fceyZvA8sDpruq0VFiVZt+2yND6oyX9MG8r
   XKu6PaqCretZVdTr2gLPi8oO7N5QFhMW6CTZu2SoKQ+nea3Wncd70Fjuq
   uigMpMPjKTrcE5QfnxCRz3MeTolSokfpj1FP1ewdDfygbeESa6BcRkfxH
   yJVRyeIR4PlKTy6mAhFBgN9H0BCP8kTLcDFjjrVth4MkDVLDKsbUuRETN
   Sd23uA7KWrq4gHAzJhk/L40R5dguTKy2PJMdKT3pyB0XfCalzBKBVEP92
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="290955640"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="290955640"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="533006992"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsTVSQC8BJBsI0SOwqOFaGe17iQvNwXboEB0tK4RoWvhgx7uIRNSDeVwImFecr3D3apZlSLJ2/9uKmZBhZibAE/PHIvi2H41eAniiDtxrsLzyEWG9/WjTIZaFgdEaZ7Zs/XtcoMrhj3mW9LTv8YvU2GDU79kDRsDxyp2xWvd6OyYgHLUhRxN45NQPiNY/kSv/yY5McVmEbO6U1aIOpVBs9qjHkJo7G/JPDgBqgkIjHvbF33FBwwdEwNzzbBYc2eKgS25LWGNbyKrTCBqaf8Dt13yPcIJn0042CYClbm74rTf6ps+dh7RdKgToH4/L6TJcsqd5rWpbCR681zSVneVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CEBpfM0nnYYOZ8kAid6Ce67P6Tfk0FK38+Fe9mQ86Y=;
 b=eYlFX7p1qR5kBjP5+QosPLxCKg1Kz+3lFrJY6eT6Nqs8OnqAA7yikLTD4OrbS/Y3Rcb6+k12C+3uciTDyA7pyoEPJi96VAQ52lp6ElbBEIUNyeU++nhMeRR9bBuPA40hIYPzdcV4ADDsXtk/v5ROg6JB2dhD/ywScmd3+F8PKRnXGg7iCEIRn7GUeHvRM24hYhbNWYjSLbEYQ/XTKybOSVbOQLlgZQFAXDjPi+JDViGW3I0iQ5PYmlRZtEGEhlnpNTQWSzkkDaezmCbe2LYmPRcXd3SFiZYRUQnCz1leBhQTtOnnm0b4m3X8WQBLqPt/NMZeTWFTtbBQWhLbPl9cuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Beulich, Jan" <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?UGF1IE1vbm7DqSwgUm9nZXI=?= <roger.pau@citrix.com>
Subject: RE: [PATCH v4 16/21] VT-d: free all-empty page tables
Thread-Topic: [PATCH v4 16/21] VT-d: free all-empty page tables
Thread-Index: AQHYWIB55LiJis4LlU+Of8jQSBwnua0DJPWw
Date: Wed, 27 Apr 2022 04:09:24 +0000
Message-ID: <BN9PR11MB52769CDA1125C76E74EA0F658CFA9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <b9a2be8d-3bb9-3718-6e3b-f07f6dcdde20@suse.com>
In-Reply-To: <b9a2be8d-3bb9-3718-6e3b-f07f6dcdde20@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 655ab111-d532-4683-83cf-08da2803b71d
x-ms-traffictypediagnostic: CO1PR11MB4804:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CO1PR11MB4804DF94A838270CFA5D35638CFA9@CO1PR11MB4804.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RXhnWxkzcVK8Bhl98ov5t9lSSdCByfiHRn7m2GdSj7+mV4s+1GxD2tXZ+RxMJ64QUdp94z2bDnnTnamVaT1PMxI9bTFD3qf4Ka1uvsTsm9RUPYELe6ULp1eEhApJlynHwaEk/ZLBTlEeWEXWCBrAMxVpktIF8vEbR1uN2mUv1M74zbHqekx69NEyKuUce5qpu24WIQGMtS0F3wLMsukXe6rxmnMHvr6f2TGft0qXfDJuIkVVKmfz363LB+XxSPKqmkXOVz30tOMTKjjmao7s2JdhpjIEfvVay49/SJbuyedzsQziXTimhTK7qCgnMd8OjkTmmts0MpAKglRycV8O+t4TWaUCJ1gg8c6K14kjqq56Sel6f6orN0GWPmeH8QpFWWz5Cp2uGacalzjnrR4kXqq0w8G9xzS+RRliT8rX79OBhhfdKKt9Adqtp7/QN+nI2xGRMCZMgv0Ax5c1UOdNnpiOSBPx0LwzJBWMkH7dkgSYMdxw/vHHSi6LIbESwS+/0tvPxm7nG1gTavk+81/p9FPy5JbHgWQZrEPCcuqNIzkNMIb3xC8seugjKAQHcmxBE6d9MniaueAIOTV+Wymy/fBxKxOVLs8uSZq5KuOsGlIweoueLA2RyV/+RK2WDzvj4tW8C0FD9p6I8zw5TQcrfvJhBbkC3RNxlsm0/58UuAkNwpx5hldEtashPjAalA3am+//Fe2UgXSutvMYlHnRAQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(66476007)(66446008)(64756008)(8676002)(26005)(2906002)(186003)(83380400001)(71200400001)(76116006)(66946007)(66556008)(9686003)(86362001)(7696005)(6506007)(508600001)(52536014)(5660300002)(33656002)(8936002)(38100700002)(55016003)(38070700005)(54906003)(316002)(82960400001)(110136005)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tk96MFYzVHIxV0Y2V2RIbU9pNWdBUk9uaHNqdFIxOEEwU2FpUVF4Qm84QmNx?=
 =?utf-8?B?Wi9taXNaZmxCVDczQUsydks5RFJHRzlHTGlDMG9XUVNpWlBWZ290d2JIaW5p?=
 =?utf-8?B?ZUVNcXJrc0wySmZyRWpVSC9EZXB5NnhlYVhIcVZvbTF5MFVhdGJPRFVOaHJq?=
 =?utf-8?B?dkxIWHF4RElBcFJsaXBKSGdiQU8rdXFuc3g3YTZaY2JwT29hS0w0NHgranRs?=
 =?utf-8?B?MWlsdnZBdzFmKzBTOHpsRkY1T0laejQ4TnFtVlI5elNVaXFnQmNoQW50eVZo?=
 =?utf-8?B?TDZpaHpET2xPdVF5VmRZdFozQisxeFlUZ1g3ZjVMendxbVkycm02Q2FFcW1v?=
 =?utf-8?B?VU5KQjROdFhTbGdVRHV5YlpGelZNZ0FjRFJYTjdTSWs1cEkwQ0pXYjNNdzdw?=
 =?utf-8?B?SDFEVm5oRkExcGp2bytvVXpPbDdhQUw3RWZPZi9ySnNoOVh3V2ZrTnBWRnJx?=
 =?utf-8?B?V1RTOWxyZ1F4dTNNMGM2RWJEL21EYU42YWVEK29ldHpiZVR0REUxdDZPQ08v?=
 =?utf-8?B?NG9nUlNJdXkzWU9mT1V6Z1FrK1N4Y1YwYlNrcGdGV01XSTREaDdzM2J3YStG?=
 =?utf-8?B?Vml3ejBGYlFKbzB3TVNtV3NCckFsdmJva25yczEvVHhwak5XY3RDMk8yQnpH?=
 =?utf-8?B?QTliNTdpZjAvYVJYcDY3MWpLQ3B0aUpmUVFoczVFbXNGNGtNdit1Rk9pekx1?=
 =?utf-8?B?dm9ycXdwRjRVeDRJTVBkdTZVOUlkTytQVXcraVRQRlR0T3dROXRIWGZQT1Vi?=
 =?utf-8?B?QXJrcGdPSDJueDdWNUdCSDBEWlhSbVNwU0NJRXdQbS9hUUVWWVVaU0ZBNzc2?=
 =?utf-8?B?U0RUSE52MCt0T21uZmdRSmFqc3h0cktOSTkvdDJhZWoxVmdUUDZvUWpHVTd3?=
 =?utf-8?B?c20zaEJLc2RKOXFFTFE3NFZvTEdGU0Z6bEh2bDQrdldzZUN2bDFhVTJMT3R6?=
 =?utf-8?B?NWZmN25zWkNucmlJK3RaQkFBYU9oVWJ1SHpoVUEwLzlhWmlMcXA2Rzhjb2Fz?=
 =?utf-8?B?VkVGVFU5Nk5va294V3lRMUk5TGZWeHJiYncwZG14QmZCeE1CYjNONkRwek1y?=
 =?utf-8?B?cXBIREVzeDNmNkJuWWhXTElrUVljRW1NK00zMmxicnlqSUVzNXNCblNxMFpa?=
 =?utf-8?B?QVk3RC9qcEl0eElxaFVzMHFXQ1oxdmZvTlhScVRjRGRWTnpFdlR0cHRwVGps?=
 =?utf-8?B?NVNIVit6aWNiSTFncEJ2QnNGMStmVjFEbEJNSHBhUUIwQU9TWEhrcG5odW0w?=
 =?utf-8?B?ZWhHeE4zYjZKVm5Hc3pGZzJPSkRSN214U0I5MWFMc2o2TVJjbGkzdDZYZWRV?=
 =?utf-8?B?YzdzbGpHcWU3cVBmYmRjQUx5OWZ1YjZqUzRQME1VdEMyb2V2MTIvamZlZm5a?=
 =?utf-8?B?QmxXQjlRWXhFUFFCeWdIaFZOUC9NR05LbEgwVjhvMjBHN1IvVDFtWmlWVDAw?=
 =?utf-8?B?RElPbjV1eVhIOTl5bHhpMTBZbXErRG9EV1lKcEFuVHorc2Y0bU9peGhxdDNS?=
 =?utf-8?B?czVqbGtpYjJ2K1QvNUluVitQL0pwNGdZSXlOd3R1TFRpRVVCU0tSbWp3VklR?=
 =?utf-8?B?YlNWRkhOdzRRVTVuWVpWS3JjTlRhbTRzVUJBNHI2YzA1Z2YyVUdHb1lRVXpE?=
 =?utf-8?B?dGJQSldBK2wvTnJ1N3hUQ3JIRkZpTWNVeWNReFFIZ3lVTHo2OXZ5Zm1wdVB1?=
 =?utf-8?B?OS9uYnB1bFBxS3FDWFVlbzZVd0JyM2FwUzhReXdwUWpWS3puam5LaTZzNHdZ?=
 =?utf-8?B?QWhjejVLNFhuOE5CVWtiVjJmbkRNNEJxekhPODhtTVlabE5idkVzL0VNUjM4?=
 =?utf-8?B?eU1ORUlZOWVvK2paZXRtZDhpTWltS2JSaHdaMnZCUDhpWEwxUmlaTjUzeUFl?=
 =?utf-8?B?V05lQW1Hd2xGTUs5TGFqTy80VGxYTkZmNm1ENWhYUVdyS1hJUytqeEw4YzFk?=
 =?utf-8?B?OW9oYUdrOGM3eHF5a0xEcWFzMUFBTWxYTnUxRzNzRFpxNHV0cU0yajJaZGFR?=
 =?utf-8?B?QmhudEs5WHprTE44aDI0R010TWRoS0d2N296RjZRdzhTYjZ0NHJMOEVlM1FQ?=
 =?utf-8?B?YThlbGI4SFA4Z210NTIvM0dXVUdPNzhId2J3VCs0T2hJSE1QUzBCYVhCOERo?=
 =?utf-8?B?RC8zWWVTcmJRVXlQNnBraFoxVzc4UldvZWpNM3czbWZQZmVhZXNhdjdaV1Qz?=
 =?utf-8?B?Zmo3aEx2QW03cHRPdU56ZDZMcEhJT2E3SDBPSmhjeE1zNmNxZ21FK2V6aThn?=
 =?utf-8?B?OGRHWCttaHhpSzh5TzQrQVNFckZQRnU4SW9IdnRMTG44OXY2L1kwakpkVXVZ?=
 =?utf-8?B?TXQwMzFodC94VTBPQm1weUxJTm5hRUM1RjJnR0hoQ01HYzBCZjc2dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655ab111-d532-4683-83cf-08da2803b71d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 04:09:24.8368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fSLQKKB1ButPZv/q9siv/bepivx9/r8TjrBL9dXWuDBk4N33z8qcNYglESv3Q0wr+6omaNum0hKKCfhW38HHYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwg
QXByaWwgMjUsIDIwMjIgNDo0MyBQTQ0KPiANCj4gV2hlbiBhIHBhZ2UgdGFibGUgZW5kcyB1cCB3
aXRoIG5vIHByZXNlbnQgZW50cmllcyBsZWZ0LCBpdCBjYW4gYmUNCj4gcmVwbGFjZWQgYnkgYSBu
b24tcHJlc2VudCBlbnRyeSBhdCB0aGUgbmV4dCBoaWdoZXIgbGV2ZWwuIFRoZSBwYWdlIHRhYmxl
DQo+IGl0c2VsZiBjYW4gdGhlbiBiZSBzY2hlZHVsZWQgZm9yIGZyZWVpbmcuDQo+IA0KPiBOb3Rl
IHRoYXQgd2hpbGUgaXRzIG91dHB1dCBpc24ndCB1c2VkIHRoZXJlIHlldCwNCj4gcHRfdXBkYXRl
X2NvbnRpZ19tYXJrZXJzKCkgcmlnaHQgYXdheSBuZWVkcyB0byBiZSBjYWxsZWQgaW4gYWxsIHBs
YWNlcw0KPiB3aGVyZSBlbnRyaWVzIGdldCB1cGRhdGVkLCBub3QganVzdCB0aGUgb25lIHdoZXJl
IGVudHJpZXMgZ2V0IGNsZWFyZWQuDQo+IA0KPiBOb3RlIGZ1cnRoZXIgdGhhdCB3aGlsZSBwdF91
cGRhdGVfY29udGlnX21hcmtlcnMoKSB1cGRhdGVzIHBlcmhhcHMNCj4gc2V2ZXJhbCBQVEVzIHdp
dGhpbiB0aGUgdGFibGUsIHNpbmNlIHRoZXNlIGFyZSBjaGFuZ2VzIHRvICJhdmFpbCIgYml0cw0K
PiBvbmx5IEkgZG8gbm90IHRoaW5rIHRoYXQgY2FjaGUgZmx1c2hpbmcgd291bGQgYmUgbmVlZGVk
IGFmdGVyd2FyZHMuIFN1Y2gNCj4gY2FjaGUgZmx1c2hpbmcgKG9mIGVudGlyZSBwYWdlcywgdW5s
ZXNzIGFkZGluZyB5ZXQgbW9yZSBsb2dpYyB0byBtZSBtb3JlDQo+IHNlbGVjdGl2ZSkgd291bGQg
YmUgcXVpdGUgbm90aWNhYmxlIHBlcmZvcm1hbmNlLXdpc2UgKHZlcnkgcHJvbWluZW50DQo+IGR1
cmluZyBEb20wIGJvb3QpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRl
bC5jb20+DQoNCj4gLS0tDQo+IHY0OiBSZS1iYXNlIG92ZXIgY2hhbmdlcyBlYXJsaWVyIGluIHRo
ZSBzZXJpZXMuDQo+IHYzOiBQcm9wZXJseSBib3VuZCBsb29wLiBSZS1iYXNlIG92ZXIgY2hhbmdl
cyBlYXJsaWVyIGluIHRoZSBzZXJpZXMuDQo+IHYyOiBOZXcuDQo+IC0tLQ0KPiBUaGUgaGFuZyBk
dXJpbmcgYm9vdCBvbiBteSBMYXRpdHVkZSBFNjQxMCAoc2VlIHRoZSByZXNwZWN0aXZlIGNvZGUN
Cj4gY29tbWVudCkgd2FzIHByZXR0eSBjbG9zZSBhZnRlciBpb21tdV9lbmFibGVfdHJhbnNsYXRp
b24oKS4gTm8gZXJyb3JzLA0KPiBubyB3YXRjaGRvZyB3b3VsZCBraWNrIGluLCBqdXN0IHNvbWV0
aW1lcyB0aGUgZmlyc3QgZmV3IHBpeGVsIGxpbmVzIG9mDQo+IHRoZSBuZXh0IGxvZyBtZXNzYWdl
J3MgKFhFTikgcHJlZml4IHdvdWxkIGhhdmUgbWFkZSBpdCBvdXQgdG8gdGhlIHNjcmVlbg0KPiAo
YW5kIHRoZXJlJ3Mgbm8gc2VyaWFsIHRoZXJlKS4gSXQncyBiZWVuIGEgbG90IG9mIGV4cGVyaW1l
bnRpbmcgdW50aWwgSQ0KPiBmaWd1cmVkIHRoZSB3b3JrYXJvdW5kICh3aGljaCBJIGNvbnNpZGVy
IHVnbHksIGJ1dCBoYWxmd2F5IGFjY2VwdGFibGUpLg0KPiBJJ3ZlIGJlZW4gdHJ5aW5nIGhhcmQg
dG8gbWFrZSBzdXJlIHRoZSB3b3JrYXJvdW5kIHdvdWxkbid0IGJlIG1hc2tpbmcgYQ0KPiByZWFs
IGlzc3VlLCB5ZXQgSSdtIHN0aWxsIHdhcnkgb2YgaXQgcG9zc2libHkgZG9pbmcgc28gLi4uIE15
IGJlc3QgZ3Vlc3MNCj4gYXQgdGhpcyBwb2ludCBpcyB0aGF0IG9uIHRoZXNlIG9sZCBJT01NVXMg
dGhlIGlnbm9yZWQgYml0cyA1Mi4uLjYxDQo+IGFyZW4ndCByZWFsbHkgaWdub3JlZCBmb3IgcHJl
c2VudCBlbnRyaWVzLCBidXQgYWxzbyBhcmVuJ3QgInJlc2VydmVkIg0KPiBlbm91Z2ggdG8gdHJp
Z2dlciBmYXVsdHMuIFRoaXMgZ3Vlc3MgaXMgZnJvbSBoYXZpbmcgdHJpZWQgdG8gc2V0IG90aGVy
DQo+IGJpdHMgaW4gdGhpcyByYW5nZSAodW5jb25kaXRpb25hbGx5LCBhbmQgd2l0aCB0aGUgd29y
a2Fyb3VuZCBoZXJlIGluDQo+IHBsYWNlKSwgd2hpY2ggeWllbGRlZCB0aGUgc2FtZSBiZWhhdmlv
ci4NCj4gDQo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jDQo+IEBAIC00Myw2ICs0Myw5
IEBADQo+ICAjaW5jbHVkZSAidnRkLmgiDQo+ICAjaW5jbHVkZSAiLi4vYXRzLmgiDQo+IA0KPiAr
I2RlZmluZSBDT05USUdfTUFTSyBETUFfUFRFX0NPTlRJR19NQVNLDQo+ICsjaW5jbHVkZSA8YXNt
L3B0LWNvbnRpZy1tYXJrZXJzLmg+DQo+ICsNCj4gIC8qIGRvbV9pbyBpcyB1c2VkIGFzIGEgc2Vu
dGluZWwgZm9yIHF1YXJhbnRpbmVkIGRldmljZXMgKi8NCj4gICNkZWZpbmUgUVVBUkFOVElORV9T
S0lQKGQsIHBnZF9tYWRkcikgKChkKSA9PSBkb21faW8gJiYgIShwZ2RfbWFkZHIpKQ0KPiAgI2Rl
ZmluZSBERVZJQ0VfRE9NSUQoZCwgcGRldikgKChkKSAhPSBkb21faW8gPyAoZCktPmRvbWFpbl9p
ZCBcDQo+IEBAIC00MDUsNiArNDA4LDkgQEAgc3RhdGljIHVpbnQ2NF90IGFkZHJfdG9fZG1hX3Bh
Z2VfbWFkZHIocw0KPiANCj4gICAgICAgICAgICAgIHdyaXRlX2F0b21pYygmcHRlLT52YWwsIG5l
d19wdGUudmFsKTsNCj4gICAgICAgICAgICAgIGlvbW11X3N5bmNfY2FjaGUocHRlLCBzaXplb2Yo
c3RydWN0IGRtYV9wdGUpKTsNCj4gKyAgICAgICAgICAgIHB0X3VwZGF0ZV9jb250aWdfbWFya2Vy
cygmcGFyZW50LT52YWwsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YWRkcmVzc19sZXZlbF9vZmZzZXQoYWRkciwgbGV2ZWwpLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGxldmVsLCBQVEVfa2luZF90YWJsZSk7DQo+ICAgICAgICAgIH0N
Cj4gDQo+ICAgICAgICAgIGlmICggLS1sZXZlbCA9PSB0YXJnZXQgKQ0KPiBAQCAtODM3LDkgKzg0
MywzMSBAQCBzdGF0aWMgaW50IGRtYV9wdGVfY2xlYXJfb25lKHN0cnVjdCBkb21hDQo+IA0KPiAg
ICAgIG9sZCA9ICpwdGU7DQo+ICAgICAgZG1hX2NsZWFyX3B0ZSgqcHRlKTsNCj4gKyAgICBpb21t
dV9zeW5jX2NhY2hlKHB0ZSwgc2l6ZW9mKCpwdGUpKTsNCj4gKw0KPiArICAgIHdoaWxlICggcHRf
dXBkYXRlX2NvbnRpZ19tYXJrZXJzKCZwYWdlLT52YWwsDQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYWRkcmVzc19sZXZlbF9vZmZzZXQoYWRkciwgbGV2ZWwpLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxldmVsLCBQVEVfa2luZF9udWxs
KSAmJg0KPiArICAgICAgICAgICAgKytsZXZlbCA8IG1pbl9wdF9sZXZlbHMgKQ0KPiArICAgIHsN
Cj4gKyAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGcgPSBtYWRkcl90b19wYWdlKHBnX21hZGRy
KTsNCj4gKw0KPiArICAgICAgICB1bm1hcF92dGRfZG9tYWluX3BhZ2UocGFnZSk7DQo+ICsNCj4g
KyAgICAgICAgcGdfbWFkZHIgPSBhZGRyX3RvX2RtYV9wYWdlX21hZGRyKGRvbWFpbiwgYWRkciwg
bGV2ZWwsDQo+IGZsdXNoX2ZsYWdzLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZmFsc2UpOw0KPiArICAgICAgICBCVUdfT04ocGdfbWFkZHIgPCBQQUdFX1NJ
WkUpOw0KPiArDQo+ICsgICAgICAgIHBhZ2UgPSBtYXBfdnRkX2RvbWFpbl9wYWdlKHBnX21hZGRy
KTsNCj4gKyAgICAgICAgcHRlID0gJnBhZ2VbYWRkcmVzc19sZXZlbF9vZmZzZXQoYWRkciwgbGV2
ZWwpXTsNCj4gKyAgICAgICAgZG1hX2NsZWFyX3B0ZSgqcHRlKTsNCj4gKyAgICAgICAgaW9tbXVf
c3luY19jYWNoZShwdGUsIHNpemVvZigqcHRlKSk7DQo+ICsNCj4gKyAgICAgICAgKmZsdXNoX2Zs
YWdzIHw9IElPTU1VX0ZMVVNIRl9hbGw7DQo+ICsgICAgICAgIGlvbW11X3F1ZXVlX2ZyZWVfcGd0
YWJsZShoZCwgcGcpOw0KPiArICAgIH0NCj4gDQo+ICAgICAgc3Bpbl91bmxvY2soJmhkLT5hcmNo
Lm1hcHBpbmdfbG9jayk7DQo+IC0gICAgaW9tbXVfc3luY19jYWNoZShwdGUsIHNpemVvZihzdHJ1
Y3QgZG1hX3B0ZSkpOw0KPiANCj4gICAgICB1bm1hcF92dGRfZG9tYWluX3BhZ2UocGFnZSk7DQo+
IA0KPiBAQCAtMjE4Miw4ICsyMjEwLDIxIEBAIHN0YXRpYyBpbnQgX19tdXN0X2NoZWNrIGNmX2No
ZWNrIGludGVsX2kNCj4gICAgICB9DQo+IA0KPiAgICAgICpwdGUgPSBuZXc7DQo+IC0NCj4gICAg
ICBpb21tdV9zeW5jX2NhY2hlKHB0ZSwgc2l6ZW9mKHN0cnVjdCBkbWFfcHRlKSk7DQo+ICsNCj4g
KyAgICAvKg0KPiArICAgICAqIFdoaWxlIHRoZSAoYWIpdXNlIG9mIFBURV9raW5kX3RhYmxlIGhl
cmUgYWxsb3dzIHRvIHNhdmUgc29tZSB3b3JrIGluDQo+ICsgICAgICogdGhlIGZ1bmN0aW9uLCB0
aGUgbWFpbiBtb3RpdmF0aW9uIGZvciBpdCBpcyB0aGF0IGl0IGF2b2lkcyBhIHNvIGZhcg0KPiAr
ICAgICAqIHVuZXhwbGFpbmVkIGhhbmcgZHVyaW5nIGJvb3QgKHdoaWxlIHByZXBhcmluZyBEb20w
KSBvbiBhIFdlc3RtZXJlDQo+ICsgICAgICogYmFzZWQgbGFwdG9wLg0KPiArICAgICAqLw0KPiAr
ICAgIHB0X3VwZGF0ZV9jb250aWdfbWFya2VycygmcGFnZS0+dmFsLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBhZGRyZXNzX2xldmVsX29mZnNldChkZm5fdG9fZGFkZHIoZGZuKSwg
bGV2ZWwpLA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZXZlbCwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKGhkLT5wbGF0Zm9ybV9vcHMtPnBhZ2Vfc2l6ZXMgJg0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKDFVTCA8PCBsZXZlbF90b19vZmZzZXRf
Yml0cyhsZXZlbCArIDEpKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPyBQVEVf
a2luZF9sZWFmIDogUFRFX2tpbmRfdGFibGUpKTsNCj4gKw0KPiAgICAgIHNwaW5fdW5sb2NrKCZo
ZC0+YXJjaC5tYXBwaW5nX2xvY2spOw0KPiAgICAgIHVubWFwX3Z0ZF9kb21haW5fcGFnZShwYWdl
KTsNCj4gDQoNCg==

