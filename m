Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E70E283213
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 10:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2878.8213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPLuk-000175-EI; Mon, 05 Oct 2020 08:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2878.8213; Mon, 05 Oct 2020 08:32:10 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPLuk-00016g-AT; Mon, 05 Oct 2020 08:32:10 +0000
Received: by outflank-mailman (input) for mailman id 2878;
 Mon, 05 Oct 2020 08:32:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xuOL=DM=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1kPLui-00016b-SP
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:32:09 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9be9baae-a1a3-4ca8-a155-912478111101;
 Mon, 05 Oct 2020 08:32:06 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xuOL=DM=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
	id 1kPLui-00016b-SP
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 08:32:09 +0000
X-Inumbo-ID: 9be9baae-a1a3-4ca8-a155-912478111101
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9be9baae-a1a3-4ca8-a155-912478111101;
	Mon, 05 Oct 2020 08:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601886726;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EECC2hHZI4ec+eb9JInRiWAWRRbgpMEQSCnMH2DnY+U=;
  b=MdwhCt42zrYEbwewesPbJxV6fMELs5gZ+ZxkeFnvJq6DC80twJ3SD+9t
   rVW33HtBW+c/bwlWBRuJTr/w3U2E7ps1BRNZV0gxZKDYzYKMPpaBIqu93
   k76FRnUqvljqJBk1Jq7XkAax2QJ9RNouFZIsq/atpyyC1NNVTfo1AogfJ
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 2Gn5YxardgT9ITyvFDjEAECuok5dQsNr7Kc5kYhqXRnrKu5uWYTqgyVsF4iqgAitcf7s88IDtF
 vxfkNUTfKe1j3Cag8giODm2KbiOAct5If+Ho5H6Ah7Rkk7ECMDJrcXLmHrdO6RmLig4433jZau
 qKq9XzLtViFV4th236uUdk0rlD1NUUdvnM7L8A6hJXUsWQrGw9BSSoKZQP0f3Z6vsUdymeU0IM
 zGOSlk4afIXUs+nHLmyrw95Dcm4DfKg2JKCVkVB+3kxkTEBOcgVwp/XANUzXlsn0OQtLQCjPfB
 nXk=
X-SBRS: None
X-MesageID: 28535591
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,338,1596513600"; 
   d="scan'208";a="28535591"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNNb3cdN3e2TDH9RvCj4e6njZCHlTBhXyERKbStKrZ5DSLMwjCmMxJsUjGn/Wl2Rw6DYHER+r6Wb1x5jx/AHpNNn6oF/aGjcDmzcly9rzOciaRsMebNXhiPnA/HJYi1urCQTnDTxmtVXvFKWkBgMgss/quJehudCETpFJ6mcuh1bc6bLYlWRONI7v2g+Sh/7tJPiQavnpkDFqGByWoyrMbang3sKDlflEDg2crBOG9KwX71oTZ3SbkKru+drml0ro1jSu8mqLMl3QU0gzngAExVQj8bE002PNjHOGh4T3TUCerbgs2yFtlBjplrSLOO1OcIDmGSK3nwdhEBEzU+s6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBFWe4FusilT2++nnrktdpnGTHNllFZN9SNle7DHB/k=;
 b=U01yngFiqAaPcggZZNtVfhKxLoKS3sj01y83/Hdlxco0p7GiLEW2MOhp3PSjhJdacyWkEQlmnASOdycSgfk0zl9lWgbVmWwRZ0m7jtD7SD9G/+5nUsKoSudqjFvECi7H1/jwjjDkA4t1es6174IYw8iWM+OnaxgK7DRD/6EbQCSnHJoII7CxK/HnpZeoSKB5Rcd3xsZ1JPGytk9jxMBsTvCQYfaZ/qUAnHnUFt4PBTR89xEjBzH6Ld+Whtxm5uSOp91OceiDlh2FhOX1qYSQQGu/HihGabUVVIrF9YQ9pf/nx2tNsYjbjMIvMi8o/5VpRaHqlMCxI6eRvW9fwKswRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBFWe4FusilT2++nnrktdpnGTHNllFZN9SNle7DHB/k=;
 b=X65X+WewrkkPDn4Q+kBArwG+F3sC2pcfHCY3YRMY0kBuCOKH84ZKKw1ezaLQcVkFUuiHFvab3URclbahhYZP+Ll5MZDUHIF72XqicxGXT5t2LBWYzi2MEtXAJUR5uma6dqlfWwa9M68viYtG93+pb+AsIkvLLlI509cqoTR6TzQ=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH 3/8] xen/domctl: Introduce and use
 XEN_DOMCTL_CDF_nested_virt
Thread-Topic: [PATCH 3/8] xen/domctl: Introduce and use
 XEN_DOMCTL_CDF_nested_virt
Thread-Index: AQHWlzAJkAo6XskIDU6SR0iyiMzfOamCi3aAgAAK6ICABh8oLg==
Date: Mon, 5 Oct 2020 08:32:03 +0000
Message-ID: <DS7PR03MB56550E490547FB1E15C6EBB6F60C0@DS7PR03MB5655.namprd03.prod.outlook.com>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-4-andrew.cooper3@citrix.com>
 <32a955ad-9995-6df2-3d7b-6b3eb7b1d656@suse.com>,<8e25a67b-21f1-5203-6531-4ed378a74bfb@citrix.com>
In-Reply-To: <8e25a67b-21f1-5203-6531-4ed378a74bfb@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76ad5313-dacb-438d-9a4d-08d8690922ea
x-ms-traffictypediagnostic: DM5PR03MB3355:
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR03MB3355F4C86A051EEEA0D6B457F60C0@DM5PR03MB3355.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k6NPbBzCZIV6nrksy05UXdt4WP/gz8LycQ0RGkamLOnoUNHT5Tt37quFYaaMSgwFNWF5X8vdsNSjFiMW9qJt8Rzo7aoM3BjU/MxMz98uXm9ZIYKlaVAbHGwJ6Ku+peBi5hn63QY/Ta43J2jKRsH7VGpH6aA2MJ2yiEYzdkpSAWK1uVGSXoQ17rwFOEx4ZelxLv7hwDaqUJzQAfEqqZywpBfTth/HathavZRNibUh/yYD67fn0HhQZtsFIRR3a2WhcGsaz0QkM+cn2VoyN1s3KdyZBMWX/o1gAO6tLK0MqUc3SKg93QXmXEGplEXLhpfTlLzCS5lCFAS4ivqLS2kDWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5655.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39850400004)(136003)(55016002)(52536014)(66476007)(9686003)(8936002)(66946007)(8676002)(316002)(4326008)(2906002)(107886003)(5660300002)(478600001)(83380400001)(110136005)(54906003)(33656002)(6506007)(53546011)(76116006)(91956017)(26005)(7696005)(186003)(55236004)(44832011)(64756008)(66556008)(71200400001)(86362001)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: P97zFfbJOMHA6PnCr0BK05vU7xNEN1tTfLqosnzH18UKNZ34IQKOLl4YDkN80B487u5yq5xC4hZfEHvKkEfWYYx1NlSfaXmXK2LfZgn5kDZxijF+E/O70DH7jePk1/ZspaxSR/KBiwNNJMq9g113BCEsIYFwIPHm9VG5una6s7kryMKfZdPM6L/h55PrxSgFxb5c0reYJM09JM0OL+WV7LEoc4232VqZuRsO79cBW1BILa7gMOq7uADkIxZIi1gHB7OBASA/w90M76Yus0Wd0OoDW8IHpTTKSQ0J84rV7sJLAPKgxqc/K8WXtbvj1BxjjzzswnwZobpjsgbB0b1iFOc9Oj3rZhFF40Q/+JalqBIXH/YhtuwWyxwn7tm/7u6RSjbfJdfC57wQvSGFr49Ups29HDCzEu3WeUVsyby2PgQ8kpet7zPqSFAm5JiIZL6A5SAh71JS5zq/sVYxxBstRViOSJGS5Wy5qozrHjloil+ZanqdFMst+N5AE6pZYb12yC6qUvevPNEqytUqRBJ0wAdecJ5Hb8HKin4yGA7mJhOoUF4hT+xx04UiAs+uIoPM+8upk+6dlNBBV1qiqmNUMcvEm6IX1z8JAcQd4uW2E1kn0++7kMGuajppVKLRHDQm+n4tIVlpTQc5Ie+7478fcg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5655.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ad5313-dacb-438d-9a4d-08d8690922ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2020 08:32:03.1987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LSdfAVAiDPKzwGcxECw6XnbGw+Vu6NJKvYPgF9abmNYPMDEfJcMNCk96cibBplRHba25a5NnkKrisEzE9lA7AnFSC5qQaTUceoXt7sq0sYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3355
X-OriginatorOrg: citrix.com

--
Acked-by: Christian Lindig <christian.lindig@citrix.com>

________________________________________
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
Sent: 01 October 2020 12:02
To: Jan Beulich
Cc: Xen-devel; Roger Pau Monne; Wei Liu; Ian Jackson; Christian Lindig; Edw=
in Torok; Rob Hoes
Subject: Re: [PATCH 3/8] xen/domctl: Introduce and use XEN_DOMCTL_CDF_neste=
d_virt

On 01/10/2020 11:23, Jan Beulich wrote:
> On 30.09.2020 15:42, Andrew Cooper wrote:
>> @@ -667,6 +668,12 @@ int arch_sanitise_domain_config(struct xen_domctl_c=
reatedomain *config)
>>           */
>>          config->flags |=3D XEN_DOMCTL_CDF_oos_off;
>>
>> +    if ( nested_virt && !hap )
>> +    {
>> +        dprintk(XENLOG_INFO, "Nested virt not supported without HAP\n")=
;
>> +        return -EINVAL;
>> +    }
> Initially I was merely puzzled by this not being accompanied by
> any removal of code elsewhere. But when I started looking I couldn't
> find any such enforcement, but e.g. did find nsvm_vcpu_hostrestore()
> covering the shadow mode case. For this to be "No functional change
> yet" as the description claims, could you point me at where this
> restriction is currently enforced?

Currently enforced in the HVM_PARAM_NESTEDHVM write side effect, which
is deleted in patch 5.

~Andrew

