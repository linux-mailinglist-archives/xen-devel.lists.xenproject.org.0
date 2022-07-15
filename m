Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD81575F72
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 12:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368096.599279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCIg1-0005Sx-9R; Fri, 15 Jul 2022 10:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368096.599279; Fri, 15 Jul 2022 10:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCIg1-0005Pi-4m; Fri, 15 Jul 2022 10:36:05 +0000
Received: by outflank-mailman (input) for mailman id 368096;
 Fri, 15 Jul 2022 10:36:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xid4=XU=citrix.com=prvs=188d5c0a5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oCIfz-0005Pc-1b
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 10:36:03 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea32776c-0429-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 12:36:00 +0200 (CEST)
Received: from mail-bn8nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Jul 2022 06:35:54 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SJ0PR03MB6239.namprd03.prod.outlook.com (2603:10b6:a03:3ad::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Fri, 15 Jul
 2022 10:35:50 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::ec74:68a1:2448:721b]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::ec74:68a1:2448:721b%6]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 10:35:50 +0000
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
X-Inumbo-ID: ea32776c-0429-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657881360;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=k9r1jD/6gnkECBcJIOg/D08LS7wQzsFoNBipF+j4veM=;
  b=XVly6BQhVwDdgcdintf1ygHaBjqUmW5Lh2Y21ZQz43V7HW3XNKlyKa3L
   mfV4ylPXted+Mqwzav27isMZJu15d5xFfiiSHVa3h6lKDMOU2Dco/7ZP3
   AVo+8JR1e+kfOKTWsY3VdN4rO2P5pBP1XLDmbjRydY/to/uMEjJtiBbGN
   8=;
X-IronPort-RemoteIP: 104.47.74.40
X-IronPort-MID: 75175607
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YC04BKv1aiBun0gnuP59Cy+JUOfnVBFeMUV32f8akzHdYApBsoF/q
 tZmKTuFPK6JYDDwfoh2PIrk8klSvcDcydRrGlds/y8xEi1G+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzh8B56r8ks15qyt4W5A5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FYom1/pyL3NFz
 95CeWEiQArToOeLyZvuH4GAhux7RCXqFKU2nyk8iBv/XbMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9w7T+fJfD2v7lWSd1JDENtbPd8PMbsJShkuC/
 UrN/njjAwFcP9uaodaA2i3x37CSw3ukMG4UPJji7NpJgVe8/Dc0IRZRCQefutyisUHrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAgUzVILvIvssQ7QTg3/
 laTmpXiAjkHmLicVXKc+6rSsTqoIyERBXcYYjMDSw4M4t2lq4Y25jrNRNt+FK++jvXuBCr9h
 TuNqUAWhagXjMMN/7W2+xbAmT3EjoPSUgc/6wHTX2SkxgB0foioY8qv81ezxelEBJaUSB+Gp
 ndss+KT9vwUBJeB0gmEWvwQHaqB7uyAdjbbhDZHP5Qn7SXrxHelcqhZ+jQ4L0BsWu4BcCXiJ
 lLVtg5K759SP2exRbF+f4+qTcowpZUMDvzgX/HQK9BIMp54cVfb+Dk0PRLImWfwjEIrjKczf
 4+BdtqhBmobDqIhyyeqQ+Aa0vkgwSVWKX7veK0XBi+PidK2DEN5g59cWLdSRojVNJ+5nTg=
IronPort-HdrOrdr: A9a23:ohmb/6zFyeqtpzOlcYwDKrPxj+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESttu/oXvUjZ1SxhkFxnAid0idvrD
 AKmWZmAy1H0QKSQohym2qq5+Cv6kd215ao8y7kvZKqm72EeNt9MbsOuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGLf2RYUh2rD3xnklZqsoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blmAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjiaWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjbT4A21reh2Gzz2MRWAtG7Wu7BjDrBCy87BbauuNzGfQ1YzlMblq+kDA6TgKo
 SOBK4=
X-IronPort-AV: E=Sophos;i="5.92,273,1650945600"; 
   d="scan'208";a="75175607"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEq4sLN5Oy0rZYKrZwtISzVCf9/+9zmCpepabEWYueEGUjDG4C46UUSpG6lYnbvZtQSUa/6uQ6mTlr1+lN8wlQYS4/zQG0MLRXZ3SjF8rqSw403O1rFlv7RixSohOA8EnQh0DBmMOYTPd/q5OG4MH+/F0MxR/1sP0yEx+s+pTL7Qgvb71hBX9xsZ1iyQOvJcBvuvGgDaUK3Ruc2UHU9vZCjsP1oEsCzEtU5z74DM1/r1mSd0rt/OxvXlxmnANzAaxq9AT2VgzURH4DBpQCqKqLv8nyhGPrYbFx7QKiLQ9iAbkMyoc51MYQmXxy7ZqR+QG3fUuDRrEyxpEviV9Xouog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9r1jD/6gnkECBcJIOg/D08LS7wQzsFoNBipF+j4veM=;
 b=LUopwFPv40QGYVdeNvBTxkWQv7MynpMVv6+mh9BbUjC80ESGQaTEM6eR8UQajN/+uVuPzUTQLn0jSxYY5Z78re+tiErgr3kf84AsfQmTHVvQTbrq9RrYkiz5cH1Q4rfwVR2CiX3TY4/EUesaDo7yobOop3iFoEaVpo5uOEJwAj+9dOt9vRaHf20ntLUwhYAzRComoHoJmqx8O+L0w+MdpVlgrW2A1BkhQxXKD2UH5vL9kafq/HCSdTK7+w0e0ypdopKsslCXBKeHHoG4gIuQzBRb6lb4hOw/X2kDOBjbqLAVbhHz5uJEokXHm/nivLBvbBNgdRa0uLdZKjAvMPkgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9r1jD/6gnkECBcJIOg/D08LS7wQzsFoNBipF+j4veM=;
 b=qWs/urt/Nz918t9e00Sw+duOnxIOMgHQpe78TmI0Tep/qcMvZ+aituhfPeDbXrEqRjDbzGiGdl2Ou0F5l7Gsctr/w2ypd07MWOAAnhg62GvgkkrthoF9RWIO/zide2p3cAFf3G0/K/WNBRde1qcEGP+KbosZ8pJhySf8npenzMc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Mathieu Tarral
	<mathieu.tarral@protonmail.com>, George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	"marc.ungeschikts@vates.fr" <marc.ungeschikts@vates.fr>
Subject: Re: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Topic: [XEN PATCH 1/2] xen: Fix check-endbr with mawk
Thread-Index: AQHYl4+Dg7FHxwiGFEGkNOu8rM/Cw619+TQAgAA/dYCAAQWFAA==
Date: Fri, 15 Jul 2022 10:35:50 +0000
Message-ID: <220999bc-8467-d057-9dad-9a98bb00c73b@citrix.com>
References: <20220714143907.25938-1-anthony.perard@citrix.com>
 <20220714143907.25938-2-anthony.perard@citrix.com>
 <c62efff7-7817-9d17-ac30-04957f14d4a2@citrix.com>
 <57df4df1-2145-72c6-7268-eba6de7c6a55@citrix.com>
In-Reply-To: <57df4df1-2145-72c6-7268-eba6de7c6a55@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 909bba41-40c0-4588-1d96-08da664dc98d
x-ms-traffictypediagnostic: SJ0PR03MB6239:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fzn1lLr+673lIuxYuycnpWI4Iq3hdA8XOl+Fo0Gx41uz0YcpiEmVr9YNttSBlwIVBI1xTF1f6eC59BkBAS5Y52G2xZjasqtsSvOmA3EdKpdCCOQzrLE1pxavNahJNZdkDwR60o4ZlR0jHNqnp5sgCsd/1p4nm1MXwr8hq6ChvKBJwNMoESNtcpL/A1cegi8xe60i2XwXiVimOnCi5X6xNQzf6ZLKINgenYiaKWQKpdbtApo02m9Iua6Vky9b9r9S+yCvTL1Wbz2tShBu/ZFEhwCE0CchIpMoUDSWSTj7LpyhIOKleUCbLLYBd2VM/h8fF/nyVrojwTtO5X8eCo6we89+lo2HcAr9A3AG5F5kp5fQ4pg9w2sTomsEFxCg8ZEfP5t1xzqhZRAJ1aVESaZYc9tLFFld1x8F6pxwAxtXlIiNM4iOvaSUHJUwfDkzqZN59VYtJGw107rK5xj6ZZyrCDSxDVN7C3SLN2WydkWxZdWWbEFWL1hGnKe+Z5gN9uEpjez/H/9oX+D306F2piOBpqkn5M+2UY7DsUqd83hjDequX9tM18maokwvYr1Y7nTqzRIdhDd+xtTeg4DB+9r+AH7agSBKYd2Js7byIXFroMWyutLhKCeufDkJwID8tgvBIhlhj3UHu/AV3F2TmBex0bjIeKlD0T2V03tY9BmFk04YTlY+RIduN7qqicyGDELNLgMcrDs4oi+RmRx32cXeWKhxy7GnP9poY4uCjdgtm5+0ZwFI2xwnf6h07U1LkhZ2UdSye8VDakCCRywdANPh1uJzqcJyoTy9z+q3SdHxwd8pXzJXJv/kA72KzpZku4NRkWwJBe5TxNt37NcQJLafhjCQL1aopnOTUVzM7POq8ue17eshWNfzMWXALP/lWyNmhS30iXNFAFMw3z9EfPk0z0TQto+veEfRBIAM9Iz3m+g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(41300700001)(6486002)(71200400001)(53546011)(6506007)(966005)(186003)(478600001)(2616005)(7416002)(5660300002)(2906002)(6512007)(26005)(38100700002)(76116006)(54906003)(110136005)(316002)(91956017)(8936002)(4326008)(64756008)(66446008)(66476007)(66946007)(8676002)(66556008)(38070700005)(31696002)(31686004)(86362001)(122000001)(82960400001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Lytaemx5SUVnTk5lYWlrbFBJdWRUS1VRWEVHWnJ1OW9LSDgzaVhPS0NRbDBG?=
 =?utf-8?B?QVU2QWRNVlFVdW9rUkw3eE1TSnZyY3BoM1kra2EyOGdIalZGTnRqc09pQzdj?=
 =?utf-8?B?bDdXY2kwb2hnLzc2QTNlTTZJeW9yNFRKZEtGQW1uVjQ3a2pTODZjK3FOZHdq?=
 =?utf-8?B?bnpLZWV1UFBvdmM5SVIrWHIwOStpckZJdlJ0TGkraVUzRnp6VXZSZjUrcUNy?=
 =?utf-8?B?WUsrUWpOWVBYZXhFZXY3L1FMcG1NYzdlNUtUQnRyMHB6YWtJVUtMRzFsZVBy?=
 =?utf-8?B?SU1DWHNCWUFDZHZ1cS9TS01GWTIwbkhjb3hrWHBXQ1lQMzRYeklmSkc1VzBL?=
 =?utf-8?B?UldUU0VCdFdWVVNCdXlydmlBOTd1dnpJQnNoSkhURmVkbUVsSndVS1hGOFFV?=
 =?utf-8?B?NkJ2TTAyZFVzMTluYzNFaHlDaTN3VnFQTTNleXo0SmRNZGZtVGxKb2Y3UVpU?=
 =?utf-8?B?Z2V1d0tDSnMvZG5yaTZ5OUxpeXI1YXBjRko1WFVkWFZUSGdQcE9MdVNCWjRj?=
 =?utf-8?B?UllIYmc1SXJsNURRMENqV3ZJanE4eUhuY3hFZk1POVoxWGFmL0t5WnlhTXZm?=
 =?utf-8?B?QnR0cmxBYkpEOG0vdGJPZWFlc1g2bWhMNG9WdHhkc1UzbEYwRWwyNVVRMm5D?=
 =?utf-8?B?a1V2dzI0N0RpMmlZT1Jpci8rVElReWlQc3NjTi84SVlpcW1oQmVYTnRMbk5X?=
 =?utf-8?B?RnFDZUNGZUZ4bTdsQ2R3c0t0aitLZzJOeHJIN2ZzSGRzVHF0VmFiUVUyb1Ex?=
 =?utf-8?B?RjJ4by9hRXArNWJxMnA0dkIzVnp4aUNzV2ROSHIvUjE4Vk9Iazk1TzJvaFJk?=
 =?utf-8?B?NmtlWkpsWkpsY1dmMllPQWJIdEwyd1VxbWp6VUdVMTlOZlgwUURiQUhKc3A1?=
 =?utf-8?B?YWQrUWlSbE5zUHdzOXRKRWVnd0tGT2VSeXYyR1FhaEd5K0hydzdiQ1BGdk9r?=
 =?utf-8?B?dUtVbSt0eVBzMmRnOGZmYXlkMWpseUZPNTBlZU1qYWJqNmJYdWllRWpvNHhU?=
 =?utf-8?B?NFdER1Z5THVhYng2THFJejQ2ZFFGNHJjUk1ueElTekNCMTJCb3NIYStLNmRM?=
 =?utf-8?B?MytWYnBiYlVRZ0o2Wm5YTVY0KzBFcHR5cGZYZGNyV25jS3p3LzQ1aFJ3bjM0?=
 =?utf-8?B?NHdndVRYQk9GeVZjalQzNkEyQmxRd052RTdZRjBrY01JVWhDK3NlMndWWGxv?=
 =?utf-8?B?VG5iZDJBdm1sR0ZsRzVrVGlrQkxlL003Rzc5UUVnZHJwUWthaGFWTU5oZDJv?=
 =?utf-8?B?a0luOEVNQjJIU0lyMldyK2J3bGtoRXBod1ZKS3hJUjd2bW8weno0a3lVMEM1?=
 =?utf-8?B?QmhtbStycW5NaG13WnloMWN1My9TZlFEaWpFQlpsTE1PWlpPa3JyOXdadVZI?=
 =?utf-8?B?aENSWS9hbjEyQlhyc3NpaFVQVU5XMGkwTloxbjRYd1VlcG1keCtSajc1ZzdK?=
 =?utf-8?B?RDFsNE9zTGZKWXF2TmhIWlVIK0pZT0pKSHR2L3FTS1JtUkNNY29WV2hyeEdB?=
 =?utf-8?B?c0dvK29ZUHVsZU5kaFM5SGFFOGNqbFppaFNZRTNsSjBjaEpOeVVRaStuR3Jr?=
 =?utf-8?B?R3JiYXI2clBBYWk0c21TUEFLOFBjVll1dk9Nd0dXcTExSHBrZWNwczJrSVVH?=
 =?utf-8?B?OUQ4RFArc0RIeEtlaC9PQmhTOUUybkEyR0NxelRpZlpjRVo4Y3g2YzNuLytX?=
 =?utf-8?B?SElhOWJHR3dmb1RaYTRLQmJJU0xtU2tBa1BYZ3dwc01sT0dtNUN2Uy94YTRC?=
 =?utf-8?B?blJrY1dwR3JTYlRSaUhiNy9Mck5QQXBjNG5lOTJvZUtWdWJ3MEY1VHhlTmp6?=
 =?utf-8?B?VDV4VDBYMzNVOUcrdE41TzBTSEFIeHRiU1h2VXJKdUcyVUQzOU56R25oZlZa?=
 =?utf-8?B?cHIxTFAzMDJNS2l6c0ZFRWRod1ZXRDdJeTg3d3pUcjRCQllsOW96c09KQ1k2?=
 =?utf-8?B?REJ2VndjTS8zVXlkM3JHZmdjVFhxaDl0eUpuSDZUMW1lRU4vYXRVa2xGVW1P?=
 =?utf-8?B?MWNlWkhnSTdOMk1PZ1JHWUpzNnlUc0t4RXhTK3hOdWRIQ0pwcFZ4eDBBNnhR?=
 =?utf-8?B?REozRGJpWDEySUdRd0xPTjAwSDFSQlVYN3UvTUxaSkxxRVFCOHRLQUtrS2pm?=
 =?utf-8?Q?vDY+VEj6iDSFxC2cU/n1Mm4nz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C879F78B751814DAAF7D0308F734233@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 909bba41-40c0-4588-1d96-08da664dc98d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 10:35:50.6173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G69pb/AcI1lqfpc5tQcBRo6GKUTSN8NZLFodrrOcrvDJ5R+BtAww41LxHqLg5A7nfe4j9PJD8u76B4JTtWlhLGSLm1WlmL0jU4GgEw1DTKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6239

T24gMTQvMDcvMjAyMiAxOTo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTQvMDcvMjAy
MiAxNjoxMiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDE0LzA3LzIwMjIgMTU6MzksIEFu
dGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4+IGNoZWNrLWVuZGJyLnNoIHdvcmtzIHdlbGwgd2l0aCBn
YXdrLCBidXQgZmFpbHMgd2l0aCBtYXdrLiBUaGUgcHJvZHVjZWQNCj4+PiAkQUxMIGZpbGUgaXMg
c21hbGxlciwgaXQgaXMgbWlzc2luZyAweCR2bWFfbG8gb24gZXZlcnkgbGluZS4gT24gbWF3aywN
Cj4+PiBpbnQoMHgyQSkganVzdCBwcm9kdWNlIDAsIGluc3RlYWQgb2YgdGhlIGV4cGVjdGVkIHZh
bHVlLg0KPj4+DQo+Pj4gVGhlIHVzZSBvZiBoZXhhZGVjaW1hbC1jb25zdGFudCBpbiBhd2sgaXMg
YW4gb3B0aW9uYWwgcGFydCBvZiB0aGUNCj4+PiBwb3NpeCBzcGVjLCBhbmQgbWF3ayBkb2Vzbid0
IHNlZW1zIHRvIGltcGxlbWVudGVkLg0KPj4+DQo+Pj4gVGhlcmUgaXMgYSB3YXkgdG8gY29udmVy
dCBhbiBoZXhhZGVjaW1hbCB0byBhIG51bWJlciBiZSBwdXR0aW5nIGl0IGluDQo+Pj4gYSBzdHJp
bmcsIGFuZCBhd2sgYXMgSSB1bmRlcnN0YW5kIGlzIHN1cHBvc2VkIHRvIHVzZSBzdHJ0b2QoKSB0
bw0KPj4+IGNvbnZlcnQgdGhlIHN0cmluZyB0byBhIG51bWJlciB3aGVuIG5lZWRlZC4gVGhlIGV4
cHJlc3Npb24NCj4+PiAnaW50KCIweDE1IikgKyAyMScgd291bGQgcHJvZHVjZSB0aGUgZXhwZWN0
ZWQgdmFsdWUgaW4gYG1hd2tgIGJ1dCBub3cNCj4+PiBgZ2F3a2Agd29uJ3QgY29udmVydCB0aGUg
c3RyaW5nIHRvIGEgbnVtYmVyIHVubGVzcyB3ZSB1c2UgdGhlIG9wdGlvbg0KPj4+ICItLW5vbi1k
ZWNpbWFsLWRhdGEiLg0KPj4+DQo+Pj4gU28gbGV0J3MgY29udmVydCB0aGUgaGV4YWRlY2ltYWwg
bnVtYmVyIGJlZm9yZSB1c2luZyBpdCBpbiB0aGUgYXdrDQo+Pj4gc2NyaXB0LiBUaGUgc2hlbGwg
YXMgbm8gaXNzdWUgd2l0aCBkZWFsaW5nIHdpdGggaGV4YWRlY2ltYWwtY29uc3RhbnQNCj4+PiBz
byB3ZSdsbCBzaW1wbHkgdXNlIHRoZSBleHByZXNzaW9uICIkKCggMHgxNSApKSIgdG8gY29udmVy
dCB0aGUgdmFsdWUNCj4+PiBiZWZvcmUgdXNpbmcgaXQgaW4gYXdrLg0KPj4+DQo+Pj4gRml4ZXM6
IDRkMDM3NDI1ZGMgKCJ4ODY6IEJ1aWxkIGNoZWNrIGZvciBlbWJlZGRlZCBlbmRicjY0IGluc3Ry
dWN0aW9ucyIpDQo+Pj4gUmVwb3J0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPEx1Y2EuRmFuY2VsbHVA
YXJtLmNvbT4NCj4+PiBSZXBvcnRlZC1ieTogTWF0aGlldSBUYXJyYWwgPG1hdGhpZXUudGFycmFs
QHByb3Rvbm1haWwuY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPg0KPj4gVGhhbmtzIGZvciBkb2luZyB0aGlzLsKgIFlvdSBi
ZWF0IG1lIHRvIGl0Lg0KPj4NCj4+IE9uIHBvbGljeSBmaXJzdCwgd2UgaGF2ZSBodHRwczovL2dp
dGxhYi5jb20veGVuLXByb2plY3QveGVuLy0vaXNzdWVzLzI2DQo+PiBvcGVuIGZvciB0cmFja2lu
ZyB0aGlzIGJ1Zy4NCj4+DQo+PiBXZSBzaG91bGQgY29uc2lkZXIgaGF2aW5nDQo+Pg0KPj4gUmVz
b2x2ZXMgeGVuLXByb2plY3QveGVuIzI2DQo+Pg0KPj4gaW4gb3VyIGxpc3Qgb2YgdGFncywgc28g
R2l0bGFiIGNhbiBwcm9wZXJseSBjcm9zcy1yZWZlcmVuY2UgdGhpcyBmaXguwqANCj4+IChJIHdv
bmRlciBpZiBSZXNvbHZlczogd29ya3MuLi4pDQo+IFllcyBpdCBkb2VzLsKgIEdpdGxhYiBzdWNj
ZXNzZnVsbHkgY3Jvc3MtcmVmZXJlbmNlZCBteSBkZXYgYnJhbmNoIC4uLg0KPg0KPj4gaHR0cHM6
Ly9kb2NzLmdpdGxhYi5jb20vZWUvdXNlci9wcm9qZWN0L2lzc3Vlcy9tYW5hZ2luZ19pc3N1ZXMu
aHRtbCNjbG9zaW5nLWlzc3Vlcy1hdXRvbWF0aWNhbGx5DQo+PiBpcyB0aGUgZnVsbCBsaXN0IG9m
IHBhdHRlcm5zIGF2YWlsYWJsZSwgYnV0IEkgdGhpbmsgd2Ugd2FudCB0byBrZWVwDQo+PiBGaXhl
czogZm9yIGl0J3MgY3VycmVudCBtZWFuaW5nLg0KPj4NCj4+DQo+PiBJIGFsc28gd2FudCB0byB3
YWl0IGZvciB0aGUgcGF0Y2hldyBDSSBydW4gdG8gY29tcGxldGUNCj4gLi4uIHB1c2hlZCBiZWNh
dXNlIHBhdGNoZXcgZmFpbGVkIHRvIHBpY2sgdGhlIHNlcmllcyB1cCBmb3Igc29tZSByZWFzb24u
DQoNClRoaXMgc2VyaWVzIGlzIG5vdyBmdWxseSBhY2tlZC9yZXZpZXdlZCBhbmQgcmVhZHksIGFu
ZCBwYXNzZWQgQ0kgKHdlbGwgLQ0KdGhlIGJpdHMgb2YgQ0kgd2hpY2ggYXJlbid0IGJyb2tlbiBm
b3Igb3RoZXIgcmVhc29ucykuDQoNCkdpdmVuIHRoZSBsYWNrIG9mIG9iamVjdGlvbnMsIEknbSBn
b2luZyB0byB1c2UgdGhpcyBwYXRjaCBhbG9uZSBhcyBhbg0KZXhwZXJpbWVudCB0byBzZWUgaG93
IFJlc29sdmVzOiB3b3JrcyB0aHJvdWdoIG90aGVyIGJpdHMgb2Ygb3VyIHdvcmtmbG93DQp0b28u
wqAgVW5sZXNzIHNvbWVvbmUgb2JqZWN0cyB2ZXJ5IHByb21wdGx5Lg0KDQp+QW5kcmV3DQo=

