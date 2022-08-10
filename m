Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 596CE58F2AD
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:01:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383833.619035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLqx4-0000kx-Ao; Wed, 10 Aug 2022 19:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383833.619035; Wed, 10 Aug 2022 19:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLqx4-0000iK-7M; Wed, 10 Aug 2022 19:01:10 +0000
Received: by outflank-mailman (input) for mailman id 383833;
 Wed, 10 Aug 2022 19:01:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLqx2-0000i8-Rx
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:01:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9225864-18de-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 21:01:07 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 15:01:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5788.namprd03.prod.outlook.com (2603:10b6:806:11b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 10 Aug
 2022 19:01:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 19:01:01 +0000
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
X-Inumbo-ID: c9225864-18de-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660158067;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=7LlE2loe1zcPlhFkGFnv0Mlun/s0NVNhsNqI7pz4euM=;
  b=eImOGeC7xXBCuHvqoFA3KdlYR/RN6IWnqQHnZ0GCIbJkdCr5/HxpnuD9
   zAO+ONxCX6nKht4lnR/1t91hOoFxXRbUl4tU0ruBpVXoyfC4YBTwNV8as
   RJdIo0LCR44oxMtq+3bp7b8Nni15cjC4pRZ57T4mW6dnzKs5NuOGQGdxF
   A=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 77817658
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3As3v/VKJdgclqs5GEFE//H55ytH0wRxNe6xNQV?=
 =?us-ascii?q?3GjJ87Jw2KOdwAVq3hD0jjPsaMbZjM4BA2eBl9Di6jKiWRCgflUwKyy6aPWL?=
 =?us-ascii?q?XPlX7uSnoASyqqPA27twqEHTTLAC2HtWHovxL+lnc0/ST9t53wSFDnk7kav5?=
 =?us-ascii?q?ypJHUYzFRrwnPYzWaimX0mV+xEdrSQRBiH2zDUPqzqwkjiHIWO44iNVl1PiV?=
 =?us-ascii?q?yDJ1QpBx+Nm8AYCowW6kYB6A1uZUB/TV+dkklzHTv9ONb11LW/oBuveU45/u?=
 =?us-ascii?q?VYOYDVOs0YqxK+Pk/eutPP9DLVMKg08AdpwqRcwVhJtcAwBrItxZHq3dWooz?=
 =?us-ascii?q?ItT115lC5gYROKpDJEtPNXfniH0ueedZ+5EPDr6Z/9eGGuLTTRRpbjddrlMv?=
 =?us-ascii?q?FsCgnxwG6mWet0Drp2/ZGdN3qY+wQGEnTD795VUMkcRmXcmsGZy5RTiA7mod?=
 =?us-ascii?q?7TQ/TQ/cSzKyvmzsucqlSQ15dc2/bEsFdWxSGbNb6QR2MfJHkEHPb2hRonfY?=
 =?us-ascii?q?0u7t3Le38Ndv4PUIRCuXWasuIZQn5+yT1SMUBKDE9DM/OGUfSy4LQtLzmZn6?=
 =?us-ascii?q?4caFijVKzkLckKNksOTMKeXVN4bc2hvtpViCErLkJjOjO1xeY+F1H2B4feP7?=
 =?us-ascii?q?wnAh3AkKFIjzVLD0c+gRZbgZdrzKfyCAvwkBY0jkT2P1DOok9TWsJq23fXAS?=
 =?us-ascii?q?Y7tQGY+1X1Mpfk1nfsd0t2/aHLuK3PiRNMS6rQT+jSjBwyRfSt1GAIEDbU45?=
 =?us-ascii?q?wVbWpfkybmZNT9VkXj8wdmCKhV0sxV0/csgQFz/TyjMNyID66NNE7Tjebqm0?=
 =?us-ascii?q?IswPl51MkTLNlmLn5HVjX7NahBcfoMXkw9U5cJBiuwZASRzI91dCPXLU48CU?=
 =?us-ascii?q?wL5TPgx4OZRuoi9rzcoEpc6GhWr83hCVTmhOk6cv/jE7uRhzUDiC8KdogiAF?=
 =?us-ascii?q?Gh7uQ+xcWAfyxDoFRL9ICvmdyBZqnwT0FYJOxnmsNlDSj8AHyAXLjGMy3NiL?=
 =?us-ascii?q?qWriCnobCsnVecqBxm1RaDz90zU1TVlGGoEmudMqs2fnqmZLt6q7MB+J/+zW?=
 =?us-ascii?q?drBbn+6Cde5TKrRkclVI1DgEhuwIE4YqPZqGL25oTW0InxLs6SrHu858IIQr?=
 =?us-ascii?q?qD4MtDRgxiw8K2c/aONCJctsZ0jtVEpxz5lIC5+N2sQ0zOc/3DhezH3V0bKp?=
 =?us-ascii?q?Y7aJoS9+xxvhbRxmDjWGx+X341fekvfIxZgUleelXYfRZ1bvPqpAjPCW+x8j?=
 =?us-ascii?q?lsW05FPJXLQkiF07x6hLCFKPaFadAKCrqWO2lsd1bPNZbovrEwY4tMwwKXOi?=
 =?us-ascii?q?eJMmLbu76WAahjaiMDBLmm5SlF0P2a7V7zSlvSsGmL1p6OtVgXvMj+B0a6oG?=
 =?us-ascii?q?rVTAvwh4w/9vxgx25OlVns6DqzBFItOTWui+Z+uZxY+BK/CftRkK7S9intdR?=
 =?us-ascii?q?cw0lwjuhGkK3NTTVaTMjZ8peStzbu3uLxL3NauJAZf1Yfd2ey2aXKno+WuHI?=
 =?us-ascii?q?44oHpd89Xdvxzgj1Ox5VcsPWD8oVRU4cLM34Y8g5pN+kRcI6GZKCuLeN90X8?=
 =?us-ascii?q?Hzv+SefGvmNZU27BiiEgIpEWxXHnRGTqgqgpLo0OTLt4xNp5rf99Y4eLcwv8?=
 =?us-ascii?q?PoQhvfV3liL5VzyOSIwPpPelepgSPbZC0E5gpddmxjCIh3eUzv3WKFHTB4K1?=
 =?us-ascii?q?idrcvxSDi0p1YKXHMYzPo8od18yfgvv69Mf2qLS86ejSaXRXcyb3RLyZ+LHd?=
 =?us-ascii?q?DVq5vjiIYmeynEpFJlegZqFpaOnuMfO3NlXFJUEw0TaI0LunpkxZqvrOQHMU?=
 =?us-ascii?q?29pqk/Vq3tzVia4r6an2n6aKruVcmNK4/OPMdclrwT7CQgCENLSZtFzdPHqU?=
 =?us-ascii?q?ZyaMGT8ckSFFAgGGnY9bJrc91YjoF7m5AUEuBqWRsWBcNcioXqw8mGscSBWG?=
 =?us-ascii?q?e23Lw4B2/weIUE29WLPLm3kpoR3zzoXNGLBz4MTw3GYuIJvEjpO+IPR639P+?=
 =?us-ascii?q?XbB8CJotPH1UpvtLF33tYSpJdVoglGEX4asZrHCYfE2BarldMvLFU/4EaIwp?=
 =?us-ascii?q?XVeydUwh46WSwss9hYiT3p+0PTuhkdwBNKKgiFCaPzBOIRlocNTqVR32fnoF?=
 =?us-ascii?q?LNdQhejsNTYGbEI2E+gM1NNjVMrdfPgNkxZ9gk6xPORH5+yLvFrm6KlVNVKb?=
 =?us-ascii?q?fUqTK/FtHzr//F5ISutWN5Rwa43HWC+zlLyKmUoBszj+MfXIjZbNy6dAZrVC?=
 =?us-ascii?q?P3kdCe3liB2lJ66QPSLfFssPPQAf4Db2rPicymOiXNbIT+8WFpwzdwnFmOk0?=
 =?us-ascii?q?xOcvnGAtZXqfveikKRlIrziVGd65fCPT/v4nkoYMfuJhtFyrV/elzfAVFXDU?=
 =?us-ascii?q?KfR66I1hPKP5cjcqRHDSRmtAPJUJaCHBZf8JRSKKgXG2qqhPTqzcoNbnqnj5?=
 =?us-ascii?q?VXel+ybLonTpfZa7by0ixsvDMsNyWqLsJUQRm5mCGKimmNaH7LGTqgDQh2zV?=
 =?us-ascii?q?geADaOiEn2U?=
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="77817658"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnzEWnhOk1YcRU/T1hRnWhSGfNA/opgyG3qcG4Vy4tq0cLh77vF7SJDFv7qSktaCgitF+f3Da1tMZiLL2Uj+RTi0BXcTdoGMBODoZwrY3/TLEo8IzjG0sAHOUSLwOd1+clHNEsdEZTQWV63H6kZ7qbAxHl2dK3f1qIfuausaqTav5XpBeghWeMKCBOUd3hzThPMTLsNFxcK2KrNwhtK7t9AncYIgvtxl3AEDbD42NLHQ9VNzqOcRtfhvdOKm04Ywnp7Ph5rDcMDy8OTD/VMr0zjBPIXhw7AuRZal29YzPP/+ilxMXsJ2k04OIjq2WPdcyykTQEUlcrS+flnL4rR2Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LlE2loe1zcPlhFkGFnv0Mlun/s0NVNhsNqI7pz4euM=;
 b=jmzDiCog7q+A4tmRkSBDSHS8mrxwWY3dhC76LSX0uzsosoE3/Nq+pkwliB4E0TJGie9uEKDtWCQrnjgQEzrGmR6wLuxa6W8H+iza1v48SogCbrfzis+W8ISRYsFBYJskoD1B1nR7cvCfnzLpDwWzomsnBX7n5TQpF1ZVhHzER7FoBI7vaiiCXJSZn+dhUEQNLaZ9gc9UZt5mKif5nywllJWCxzYV7nVyVUrbe5+LkV2T0GTKxHpNdAGuaaB1FGstHqY6xLkr4eCeZULhsLDzTUIOreG0rCLFLIAZbBPkDZWa7/fKhF83FXpYFuVd0t2NI99IxZMV/B/OtLVAq1fVVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LlE2loe1zcPlhFkGFnv0Mlun/s0NVNhsNqI7pz4euM=;
 b=JKYlmh3LnZSGZPr0bLB6VEd3BB+p5N/v8b5L65/8eDb13xJpV425dXGd12ZYQFL4U/qdbbkA1e0C9B9bA/Hf4eXcRyjvgCjKCG85n2AWA5yG4DxiMfM1BrlWHKUXX3QcVYkQcF20q3VYHKryxdyKZHpMClzlgGJbXJrXXz243Zk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 08/11] x86emul: handle AVX512-FP16 conversion to/from
 (packed) int16 insns
Thread-Topic: [PATCH 08/11] x86emul: handle AVX512-FP16 conversion to/from
 (packed) int16 insns
Thread-Index: AQHYgKL05Pj98cEMCkW8t6XeRhrzv62o1ckA
Date: Wed, 10 Aug 2022 19:01:01 +0000
Message-ID: <b2c51a01-6c25-7893-f822-854f378755bc@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <5c77cdba-fac9-d82b-9d68-40f8b4f82d66@suse.com>
In-Reply-To: <5c77cdba-fac9-d82b-9d68-40f8b4f82d66@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acb2e3da-9153-440a-4490-08da7b02aabf
x-ms-traffictypediagnostic: SA2PR03MB5788:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 N0/tC2NQUktUzs5h1tUEx4NGsP2C+tm1w2ucoxp4P14sFUa8CvxT1/s4rtX6RV/fM01Q9oT1ZW2lc35j8B5vqpw85QpuG+vFuoZmE+0Jm5O0EmvZNbRVIRYC95bkTCmW+oo+7sBtycs7Iuc1oYRFOIz48D1CvA9n6y0RdMH1Xgn/SmKR3nDDde9zhVF3C+Ux6+eIW0TMyXRsfmXQDPZrzJTVqc+cN/NRjPs/xw5EkuIhE9VxJ0C4NbaSJGgF/js66D0AqaTFtVBd699mXpcc8IfWBqwBOJuHgDeg3/gIdSuM4jTJKs4X8CFDvZZrgTIBEE40pJjD5DpvrUn+8EjqXDwAaRrfbVT0+HS+m3ZA8Cj3KtNt0kRN2yzHUCD7tDhqMwP0b6IaE5+NRmUg0lna/kt6JXnnvvGaXEIoNf/Ps8s3tDjsa/YottoTpYHQG4hr+uD9oxGQDS6pm8AuK1gcUcBbS91CJmlwgSySso42hVtycwepuEX17SccZ9svebxq3cQlYzUqFAGHyvJk/D1cWK8zJAe9c9kLqD9VdEtwQMXP6thstkO+3f/zHTD/uPLfEtWdK9IzT/MhdFzUMCW7xb49F878CiY5OAXKoeV/mmgGUHPjnE3Kw4xHATEvZKj6btTVhmaEJ4kXMF2BYeA1VwYfH9WwJl591yFKJZmLABW9N4nic53m1KvaJUDlfhuT6tMaj0e4c2DsZtu3HQjwvyvM/oD9U1ZrH+sMoJR5dMdgdKYnrNg0JrS5eH6laooYsoj9P94xiLd5R3AglW5pUFgDJFV22THusxAvgmJCQf1/G5yod7bdh/2ZyRqdzqXIj6OYWj4Tpa+ve3TroEwEAljmiqo2mPvwFfYRAfQayHl2G8OJHFSYg1gOsUHZplND
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(41300700001)(6506007)(38100700002)(53546011)(31696002)(82960400001)(6512007)(26005)(86362001)(107886003)(122000001)(38070700005)(186003)(2616005)(31686004)(8936002)(4744005)(5660300002)(8676002)(4326008)(64756008)(66446008)(66556008)(66476007)(91956017)(76116006)(66946007)(36756003)(2906002)(110136005)(54906003)(316002)(478600001)(71200400001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R3g3ZjMwcVI4d3JZYzhGRDNMb1RtVHlaTHV1NlNneXlPenY5dlRmRS9GMVo4?=
 =?utf-8?B?WE56U3BCdW1aZTh2NnIrazl6SjlZTU5UUE5xOHdwMVN0MmxOeWRkT1FhWmJ0?=
 =?utf-8?B?MU9tL3VBWmZ1blZGd3ZWdUk4L3NsRlBpamdZcEh1QTdNb1A3NWJyZ3o3RGlM?=
 =?utf-8?B?a0w4ZjdZRkl2MVdleU4wVmRnS0ZiNmMvU3A3YnNVRWsrUjJDUXF4cEJQcGxh?=
 =?utf-8?B?MjVTUXdoVUN4bDNkTW9Pa3NoTFMyYy9vbGtNQzFVSnlIRU9NcFVWRmpacVBy?=
 =?utf-8?B?QzRsM1hVamxzbGJZUXltWmg1RnBYczExa2kyOWFUQTRiaHIzWGJsaW10eFpx?=
 =?utf-8?B?VGNPSEE1b1BNUlQ1SWhVeXlmL2VsWHl4MUZkNGZ2NURFaHNTeWZ1aTE2UjJ6?=
 =?utf-8?B?b3FMY24rM0JDL2xvQkMzQzhoQ2wrNmNmazQ2Q0JjK2I2azBpaHB3UjE2SEhR?=
 =?utf-8?B?WlB5L3hOTUtlZTFMVytUa1ExUURGYmtoTlo1Mzg4bG5pT2E0L3FISWZSbFdM?=
 =?utf-8?B?Myt4dVNtZ043cmdxMk9mR2xTM2tRUnVmRXFPTDJuLzhGQWNtbHlSTlo5YU1Z?=
 =?utf-8?B?MFQybWtwSktUZW8rdTE0VkJnMHJsU0JnbVA1U0t1M25FR1dlODN3MWdhRXdm?=
 =?utf-8?B?aExMNGRjUW4wdUxHOWJQU3dYVmV5cUp2VFVjR0E2ZVlvSlBhWWpLaXZxc3Nm?=
 =?utf-8?B?aHJmeUNTNDdvejBPUnQyTTVrLy9mbG5MeTZSME5LdHVWRU1FWjZkbHcwdkhi?=
 =?utf-8?B?TnR3YXZMNnczYWN4Wis4MU1CS2p2NURhNCtxdmEvb3BqeUF4TWpsVlNlTXhC?=
 =?utf-8?B?a1U0OVRtM0JRaTl3c1VmUWk4cnpuVXFiOTZFeVh3NmlCdFR5Q0psQ3lvQmxt?=
 =?utf-8?B?RWM3YmlFUStHZ1N5bUdQY2tvMzE3THRvdUFFdUlVcitoSlAvRVlwMGl1d3pC?=
 =?utf-8?B?V0JzZWdLWTdjWHVaY1lFTE84dWJiSElwQytsMExWZE9rblhOTDdXRXRxM2xF?=
 =?utf-8?B?aEZOUk40dkovM1NRaGp4cTZHWU9qWDJMUG43dk5CZ1hjQnExc1BrNUo4OEF3?=
 =?utf-8?B?UHcwaHpIdEVDOXBxK0NRQmk2R3oxOHZzNGhjc0pKdUE3RVFtVUFkaXdYWExi?=
 =?utf-8?B?SHh1dUFxWnROZWw0YXR3dVJ5SjQvR3dGYUhBZGk3M01pMGpZcElPSWpIbzAw?=
 =?utf-8?B?NTBKVG5YM3NMU29pK0lxYk9CTGFMbHhUekdiV1NtZm1mQ01COXNXVnlESjBa?=
 =?utf-8?B?MDVrWlowSjZ1WFNMUGF2VGxVVmE1SzU2R3pFL2lpa2F5Qjc1ZW5pTmpWbGFv?=
 =?utf-8?B?QWJpY3dEQStsaTZjbm1ISFRzRG85Um8wT0RRZVVCMElJY2VPcUZ2aEkyanFs?=
 =?utf-8?B?NlRRaXV6MTFtZ0Y2cUdBOTcrUC9NV095SHFrU09TT0VzZ20rQXFkaGZGaVNq?=
 =?utf-8?B?NTBYS3FuQVI1K2dIRTNpWHBzemxtWEN3d0ZIUkkxUDdHbGlXcjRicUlneFVB?=
 =?utf-8?B?UHdlOGdRbllMclRZM1dHSERTOEpZYzh4VTNOeGt2T2lZSk8vN01JbnBBL2Ry?=
 =?utf-8?B?V1U4V2xFT2x3WXg1TldybHp0Yis4R2c1NkZQV01JZjFYNlhZVDcvVTV0T1o2?=
 =?utf-8?B?RVJyUXY2QnFsemk4cmN6RTk3VXRESXdaZFUrQXY4OWgrMVhVOXhhbW5aUm45?=
 =?utf-8?B?bm1vM3dZLzIyNjM2V3BYcytWK0Y4YVhyZEFIK09nbHdlZDVBOXJNSG9GUnJE?=
 =?utf-8?B?Y2ZiSnJkVU1EQUtlU3cyUlZiRW9zRlFIbTBuN0ZEaEExbEM2S0Z0Y1JCMk96?=
 =?utf-8?B?OGhSR3A5ZDVMZDc0M3pyWUdLWU1uUThHZkpaWEpvbFE2VllsR0pBSTlMaWg5?=
 =?utf-8?B?S2M0L0JuOHVoMXRVM0tGR0RyYjVaVXVITnZXbGFwVEtVUE1oRi96cXF3M1hn?=
 =?utf-8?B?QWhsSXBNZXFCWnNxcmM3bWtUSGsyRjRhYmxWNGQ3Y0orMVRqQjEyZ2pEdUYw?=
 =?utf-8?B?bzZjOU5kYWphOGMvVXJEbmdCNXkraHJjdW5IeS9yUVVaT20yN2FHN0ZPUWlK?=
 =?utf-8?B?N3Y2RVN3eUJzRndtdnBLaWViSklpZ3lvQXlIbGl0NGpQemdoQy81bi83NWFP?=
 =?utf-8?B?OTJTUUowV0tOOFlTYitSejljQXdDSGQxRGVSL2g1cWtnLzRaWDRhWTNhaDE3?=
 =?utf-8?B?RVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3FA0D2EC877EE4E9F170375DEBEDF3F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5UowIeKwzKr1gj1R/8o0sEK7OZRDv46dB9f6mngq/uWUuzZ7AuEKph0Ki4Wole3kfeb8JgBbgr5oSXLhfzF46BtvlxPBPlZ23/TSPLf5FEGH3et2Nek6bK4/zqVIwkbpC9/FZ10SBi7EwkvIMJi6yfv+FGg1cgAZAuwOS+a71YW4NJNuMtaa0btpllx4i2GpVtw+WyGrh2EpztGu/zI9zPizCGRwRVpDQuTpM55WpCyUFjyzPqflV4SLEM362jijrqRS+fYVyh7o5H/Q+ity7pMn3xaAUKaUrEHYvxlaDjv9ICKJR5Ot/2YerUJ6Xs3FxmnpGf3HpgNa7FELL1FsVfvXJgblux9Gn3E0cuxAHSNdS/mtVNqq2FUHo/62fGtf3F8bzKQb09wHhT8v6AwEnBLLQovbnFz1lCu9N+UpKgbEQf/kunEVKbzzGcp/zR2tcVc3GSoIfgw+m4JKgwgldsrW1wwHTQNJn8ZgHbFb2+Up+N2H/xKS3sIb1jw9C5tRvYZX39tOhmEnV7YqUrNpmsEkBKUzimlwpVGzzd6tFs14YuPnV1Xx4x8Q3m5jlOlX4Nc095fcapQ/9zY6psPLvSUfhiEHcVDyau3AyUg5ezbA0aC33kk+2yNIQ46bOiqg7D9Q/XBX1Q/2IvrFtwOsQEuV85OV/et+T+4guQ7rk4HiN2SAFvM4wvZEx/Br0MFgAILxzkA3YI4/7DTaOLJK5cDghNDMC2a8WKZw+8FtX4A15bAJIK4lWyErWsQkRF58Z8DMoeo6hVrKF8sILaF3+HCoY3JAodQr4WvFEXRQ9JyzpsME6dTH24pp7eRLgbbA
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb2e3da-9153-440a-4490-08da7b02aabf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 19:01:01.0846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2+scd1OlJ2d3vSWsT6myaNPGUQ/Qy+UdKu4UMR6nMugiDZ2VAz8t4QfF5eMKKL3g5E0msTj+TO/IGUiZQ79+qe5oBUA5uOMmrNWTCM94UCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5788

T24gMTUvMDYvMjAyMiAxMTozMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZXNlIGFyZSBlYXNp
ZXN0IGluIHRoYXQgdGhleSBoYXZlIHNhbWUtc2l6ZSBzb3VyY2UgYW5kIGRlc3RpbmF0aW9uDQo+
IHZlY3RvcnMsIHlldCB0aGV5J3JlIGRpZmZlcmVudCBmcm9tIG90aGVyIGNvbnZlcnNpb24gaW5z
bnMgaW4gdGhhdCB0aGV5DQo+IHVzZSBvcGNvZGVzIHdoaWNoIGhhdmUgZGlmZmVyZW50IG1lYW5p
bmcgaW4gdGhlIDBGIGVuY29kaW5nIHNwYWNlDQo+ICh7LFZ9SHtBREQsU1VCfVB7UyxEfSksIGhl
bmNlIHJlcXVpcmluZyBhIGxpdHRsZSBiaXQgb2Ygb3ZlcnJpZGluZy4NCg0KQXQgd2hhdCBwb2lu
dCBpcyBzaGFyaW5nIHRoZSBvcGNvZGUgdGFibGVzIGdvaW5nIHRvIGJlIG5vdCB3b3J0aCBkb2lu
Zz8NCg0KfkFuZHJldw0K

