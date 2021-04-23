Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2133693D8
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 15:40:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116373.222128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZw2t-0007Wm-Sq; Fri, 23 Apr 2021 13:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116373.222128; Fri, 23 Apr 2021 13:40:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZw2t-0007WS-PU; Fri, 23 Apr 2021 13:40:35 +0000
Received: by outflank-mailman (input) for mailman id 116373;
 Fri, 23 Apr 2021 13:40:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/M9=JU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lZw2r-0007WC-QR
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 13:40:34 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0b97940-5df1-404d-b9b8-d786862e045c;
 Fri, 23 Apr 2021 13:40:32 +0000 (UTC)
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
X-Inumbo-ID: d0b97940-5df1-404d-b9b8-d786862e045c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619185232;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=c/EMLnTQmz9tZVZTkv8+gBCTup5d/0HUqAY+kzVEDek=;
  b=Pv2GvSP/yMP+Ba0f+M0IO3wV722Lm29LpfaOj5bPu06ZUlF4CkbhYlTu
   +1XwoI9YOyscVaE2wC6gCeAfVZV8KRgmG4q/hyBQNzWvHfwDVx364cDw2
   3nASPV9Nyubq5NhrhzUNUZ9WnsA6pxI+0+AAQZ+ZLLBU+R/fAKfZPTkiw
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3VEhdjWMKy2BGor2x5M3+d2rNgPPsuHHq5j0nXIPg5bHIAN4HZq4Cz/Y8xLEQkxiI1x8bnTVb1
 cOIHrRTePaVIuNdjZMMxejI3EGo9PwSoo7wcVxYBeuiFPxJ35oe2jPGaMNbWUwC8DaPx/mFIjw
 utA+M/rwZaYuJ0ObvxGttF8dcjigb4ZuooMs89OkJoV1cpHB/f7vQsBZ/Id0BKCeImiBHA4y3+
 4yWA9a9nybZFBkQR3S6bcvX3F7CkGllG3YHwJ1HEUROZYdyAKiG0sWQDTHoai2Is1N3ftDDGLb
 H1o=
X-SBRS: 5.2
X-MesageID: 42658315
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:udVpEKmptTkuIgBvBFxOVCCKyivpDfOBj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0ZNi+wOCRNNWx7LLA+E4
 eR4dcCgjKmd2geYMjTPAh7Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uLw9n67Ek7G
 TDjkjF9ryu2svLtyP0+k3yy9BtmNXnwsZeH8DksKYoAxjllwrAXvUYZ5SspzYwydvfj2oCsN
 6JmBs4OtQ21nW5RBDOnTLI+y3NlAkj8GXjz1jwuwqRneXcSCghA8RMwaJ1GyGpknYIh9133K
 JV02/xjfM+Znmh7UeNkuTgbB1kmlG5pnAvi4co/hhieLATdaNLqsgn9F5Vea1wbB7S0pwtE+
 VlEajnlZBrWG6dBkqp3FVH/MahRTAaEBuAXyE5y7eo+gkTtnV4w0wE/dcYj3cN+bksIqM0lt
 jsA+BGkqpDQdQRar84LOAdQdGvAmiIeh7UNnmOSG6XW50vCjbokdra8b817OaldNghy4Yzoo
 3IVBd9uXQpc0zjJMWS1PRwg17waVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA+XAMs
 zDe65+MrvGFy/DCIxJ1wrxV915Mn8FSvAYvd49Rhanvt/LEIv3rebWGcyjZIbFIHIBYCfSE3
 EDVD/8KIFr9UawQEL1hxDXRjfDYUr60ZVsELXL3uQaxYQXX7c89zQ9uBCc3IWmODdCuqs5cA
 9VO7X8iJ62omGw4CLp4gxSS15gJ3cQxI+lf2JBpAcMPU+xW60Eoc+jdWdb22bCAhd+SsjRAT
 NOvlgfw9PxE7WggQQZT/63OGOTiHUe4FiQSY0Hp6GF7cD5PrQ1E4ghQ640MQnQDRR6lUJLpQ
 54GU45b36aMgmrpbSujZQSCu2aXcJ7mh2XLcldrm+ak16dq8EpTn4yRCWvTsaTvAYrS1Nv9x
 9M2p5apIDFtSekKGM5juh9GkZLcn6rDLVPCxnAWJ9ZgYnxeAZ7TX6DgBuTjx1bQButy2wiwk
 jaaQGEc/DCBVRQ/lRVyLzj/l9PemKBRE5ocXxhvYphFWPJh2Zr3YawF9iO+lrUTmFH7vAWMT
 nDbzdXGA9oytyt/DO+mTqJFxwdt98TF92YKI5mX6DY23urJoHNqLoPGOVM+o15cPr0tPUQbO
 6ZcwiJDT/xBu8zwTaJrnI9NCQckgh8rdrYnDneqESo1n82BvTfZGl8T7YAOteG8izKQe2L3J
 gRt6N9gcKAdkHKLviIxqHcY2Qddlf9oWuqQ/oprp4Rl6Qor7d3F4TaVzyN9Hwv5mRIEO7E0G
 clBIJ86/T9H6UqWeo4USdQ5EAom9SCN1FDiH28PsYOOXUWy0bGNNaI6YfSobUhAke9tBL9UG
 PvhxF1zrPgZW+/zrYUBKI7HHROZGU94Hpk+vmed4e4MnTdS8hzuH67OGS6arlTVeysHqgRtA
 9z57iz7qKqXhu9/ADbpj1gJK1St06hXMOpGQqJXcpF6cazN1jJoqyk5qeI/XvKYAr+T0QTno
 tec0MMKuxFlzk5lYUylhGIdZafmDNsr3JupRd9llDs3YC64GDUWWF+WDep/Kl+bH10KXiHjc
 PM7O6C8m/yiQI1gaX+KA==
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42658315"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQOJJ3qJlflyySO1t4/A+RVpWknxfUijVUK2pSPxp8aa8vDjcUBve6h+AxATyhxxVbE411bijifo6Hz21bA7Wy9HaMHwck7SH7UK5+BwlLWm049j4WsBzgq9W7YAiFFaW35XFXOXUU+2InB4lP0cK33IS0LYtSyazqCDuoXTERCc79n9lx5LcBRtL8EAzbKdy2X45TcN+KpjsWVnEWh1YZY/v+BaWGasaV/K5RI4HDL4jVDoD98lsn7S2QDfyrt1x++5VfG8VS1Ln/DcS/Zh9hiU8rVcU6m8x1itwwpXoKVbenKES/B2b+XroJ1N+FcTW1Mj+PdWsU2UNSaeeJ+5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMAidUQ0DrttpQtCJRf4LM3szzqXRUunIkHby37Sh9g=;
 b=D9czFeRnVHbNiKZDWSC5XGbNOGpPQeVfGlrgVQQSYqG4kAZvUbqW8QiPhp0kqXnZctw12EVlZNdCXqAfzyzP4RP/ndRzWEeft3Lj+qFbOL8FJDy1OBGePFRQRTj7KKh96Ghw/IpLNRU2Y/CuDeDOj6vBzDwrzFgSXSUVRkXRTO46FBodTnIP0u9W208eoVgfdwLICvu/tF7V4ifxPJORpss90cjOJGQlyfsSHbnJ6jbL2oKLNa8Fe1kCV5yLxvpMpCB+enSzMs7qTfia38QWj/Q3A44BTaOSUUcIm9FUTYJNaxg7FJU/q542RSezJ6q3S6TMXDa1fP5Egd0hHrFLGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMAidUQ0DrttpQtCJRf4LM3szzqXRUunIkHby37Sh9g=;
 b=Vyn25IOpJ6cDVBDyz2PL6HxupklbUHPmy7Hayory2S9JTTGwHo+guSTsmpwuzw60ypQ8WpxD6owD8tGxJ9lJ9iTWXptqscVZMqtyOi+pty4Q/40nD0SikNppfob8wlJApjGzH1ZoShJrFS2BRG66lC4c342ni8Hh04r3qUus6T4=
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20210423123509.9354-1-roger.pau@citrix.com>
 <7d77cd67-5866-9d58-b2d0-b8d28b827084@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/oprofile: remove compat accessors usage from
 backtrace
Message-ID: <92cc118b-3780-5d0e-d529-88f7b025b516@citrix.com>
Date: Fri, 23 Apr 2021 14:40:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <7d77cd67-5866-9d58-b2d0-b8d28b827084@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0446.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd2c8a3c-0ce5-45b8-1817-08d9065d50df
X-MS-TrafficTypeDiagnostic: BY5PR03MB5284:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB52848A941A9C4D0CF60E31BDBA459@BY5PR03MB5284.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nomo8EINOShKQN0R3lHGqBmOF4sFq0/ptUSV7/jKC8KgMh6pFBvSQtd2Mg9IKKH83pzOCzLn5SsL5s9oiQZW3j5viw6FL7JXBbz4RQq2lxsk9DSSbUIu0wzRJHosDsFswFELjjlL6kBTqXFDhDCYcjAyzkzSUi5A3DPt0kAlpoMb7GOP1k3ABNOoZvEjBiHp66LrHlJ3Wdjp7en5M0JmCNlRDLCE2r3W7BUioUrc7a76R9N3R3g0SHGdESfLMMcIEDGOJJYrwINANPuOzBBxxDlOw5CdTH8tvqm/tV3RbFOVcQX0XGq3JtvIDHkENhgFpv9KwMM8+ntSse1ZlqGVUTBrLvrMOSCGi/Ou7xGAyXG8obELxEf1+EitVVWKGkV3jdfara71onoiL8UsEFM525NCfLc6qGlvSg05/OIdJIB1ZMX6Vt+JG9nL1TvXdDqyGLfUWWqjNIJys/bDJed4RsZQ7E8M0lIp/tRlLoXUhD5ogDem/tCayp7FFREGrVm2K5xC56Fu+CS5G96mXW8CH7M43xW7AsCYTUlW0CL6QpvvdPzs2hgPA+O8s1m/T6DmsIMevhrUSG6RHXqlMf2VD/f96nWFVVuk/iLTWVjcm0ZVydMoEYJFQzQOSyGXub4zreO01tHQTz0pkLHAeDxehRuy/+ZjB4ufzY+ZRX0g5fWarW9co6t1ez+vnDarATuQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(66946007)(66476007)(36756003)(53546011)(110136005)(5660300002)(66556008)(38100700002)(4326008)(83380400001)(478600001)(8936002)(86362001)(31696002)(6486002)(31686004)(26005)(186003)(16526019)(8676002)(6666004)(2906002)(6636002)(316002)(16576012)(956004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bCtzajBOdlhKTk5pcDQ0L0d3bzFqOVd2UitMYjE5c0Rra1NDSnJmcTRPUUFT?=
 =?utf-8?B?T0l0MnVYVE9aUHdPMDJGRVNFL0t3SkV3OXdvQzVXdjQ2OUsybWxqeUtoS0Y3?=
 =?utf-8?B?SWZZRC82Q0h1dUhKc29ZNlovSjRwczQvVmdlclFBTG05dWR4c3E4eGxuM2tz?=
 =?utf-8?B?dlJiOVBmNVgzVnE3Q04wQ2E3MkYrQ3RnbGFUc2xMdUVWK3p1OE1oczkvS0FV?=
 =?utf-8?B?TkVwblpuUzk1RldVZmJDUlpQb1dPRytHTFhVUi83azZ6S3ROVzRRSjV5VHJL?=
 =?utf-8?B?ZExYbzk0TGI1U0FzR2JpMUhOMVBCQ2lvbDdaYmI3c2lXb1NlL21wOUNxT1E3?=
 =?utf-8?B?MEtCQ0NYbnV6S1dBQkpPUm5qRkhSOW1PQTFCWlkwNXkxaUVCNXNFM1pwckNx?=
 =?utf-8?B?UWo0TGFvbXVPanFjNTdkQXF2bGxTWHc0VjZHVEppNlNpSklGblFPdlR4SVkr?=
 =?utf-8?B?VzR6Sm1OcUNhcVFZakNUOTBnVi92T3h0T3h0cTNKWWZJMkNjWUJ1Y3RSdlpw?=
 =?utf-8?B?WkRLV05FemlCby9sMEpZNmtHcjVFMGJSS3BINGtsa25TeU9rejBjN3Vuemta?=
 =?utf-8?B?b1V5QzNPL3RoS3AxS1pJNlhSbFptNDNHR0N6ZkhBajhqbWh0UWltdFVPYTFP?=
 =?utf-8?B?UkJldjB2blVGMXF0bWo0MVY2T01pMWh2bEJYbnZMd0RCSUJvSjQ1QVRUMks3?=
 =?utf-8?B?WFNMbW16VnhPdFhQNEQ2U2dFMEZGenV1NHN4dFhESVpucjFoSlp1RVBKNGNK?=
 =?utf-8?B?M1lEL1htOXFpbFlaWVVWZVFLN1YyNEdFTlBDTE5jYWJORkVkdUZTQjVEUVVt?=
 =?utf-8?B?VnZsWHd1WGwzc1lPdldSc3ByOGxSdUZKMXdDTzhsSVNMWGI0dVlib2dERXg5?=
 =?utf-8?B?M1krM080TWxWOXl2RitYSktiSkFza1ZnUDM0MVdqc1BWbDZtbjBGSE41a2Ja?=
 =?utf-8?B?NVRCbVYzMWJJZmlranFyUkMxeFBYODdZanZrL1M1VmMyTkJtWTZjUUl4d3Zh?=
 =?utf-8?B?cnJSTVNwcCs5b3VZS2t2S1lZZGZVcWJDL3lReGtJM0F5M0pjT2lpMHJMdG1N?=
 =?utf-8?B?QUJmR1lRTXo0VERNVkNlNVE2RXU2MVQwWmVWZTQrR21ZWkxUamIzcVV5S2ZK?=
 =?utf-8?B?V3BXSXJjY3lZNEwxYXZTLy9aeUxNQnJISThBUGxPWnBnRkozSEJnWWNhdm01?=
 =?utf-8?B?ZENuQk1Yd0xnTTZDUjVpeW02KzdBRmFhbVhzOVZBM21pVHdkMFI3S210VTJX?=
 =?utf-8?B?bVBVNi92WWJuSjU4RVBUbWQyZkRobjJtSktQbGhQYWZsbXJIVW8yOGtxMTgy?=
 =?utf-8?B?enpHRDNtemdGbFFEcTh0cnF3Z1lTOTRiV3poZEpWQUN4YWZJcEM0OGpHYTU0?=
 =?utf-8?B?UGNHRmpUaVVwSHo2WlJhekJmRkFpR0lxZ0xDNmtqZ1p1dWVwT2F1TjdGMVZH?=
 =?utf-8?B?Z21RMW5QSHg1aTYrK1MwbGlES0JVYTRVclJVc1FFS2xJVTRPWE11SzFPYTZU?=
 =?utf-8?B?WG1hY2FPQlJJdnMydVlsN1c0RmtDNkQwdWkrdkFKV3g4UUR0Nno4dGNOYnZC?=
 =?utf-8?B?eTRBemRZYjk2S2pFSnpoNytWeVZLWjRzcWNtVjMvc1dHRGFvRExPUXBKOGdP?=
 =?utf-8?B?T3BTT3hqQ2tMR2xDQ1BtcnE0cnA5RjlOdmVsekllZnJUQ2U3VkM4OXZmai8v?=
 =?utf-8?B?ZE44TDVqVm9HYUFybXAyNmJPWExGNTdjRUFRWk9GME9zaFdSUWYvWVNMbUlw?=
 =?utf-8?Q?+RhZG25ftaPh9h8M9bbEvI5OlSGSbpQKJyV5jCV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd2c8a3c-0ce5-45b8-1817-08d9065d50df
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 13:40:11.1646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1W2CSvPIlo1cZdHhbx0W5PPyi2bkbO1+HHO7OL60zZpjHGWeZaBg/anCvuI8YAIb/C0q7a3vv5Jzxc8hFOZ9dwSslAZeLuYlK1wj9zbzBt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5284
X-OriginatorOrg: citrix.com

On 23/04/2021 13:53, Jan Beulich wrote:
> On 23.04.2021 14:35, Roger Pau Monne wrote:
>> Remove the unneeded usage of the compat layer to copy frame pointers
>> from guest address space. Instead just use raw_copy_from_guest.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> ---
>> Just build tested. Note sure I'm missing something, since using the
>> compat layer here was IMO much more complicated than just using the
>> raw accessors.
> The main reason, I suppose, was that raw_copy_*() aren't supposed to
> be used directly.
>
>> @@ -59,34 +56,17 @@ dump_guest_backtrace(struct vcpu *vcpu, const struct=
 frame_head *head,
>>  {
>>      frame_head_t bufhead;
>> =20
>> -#ifdef CONFIG_COMPAT
>>      if ( is_32bit_vcpu(vcpu) )
>>      {
>> -        DEFINE_COMPAT_HANDLE(frame_head32_t);
>> -        __compat_handle_const_frame_head32_t guest_head =3D
>> -            { .c =3D (unsigned long)head };
> You're losing the truncation to 32 bits here.
>
>>          frame_head32_t bufhead32;
>> =20
>> -        /* Also check accessibility of one struct frame_head beyond */
>> -        if (!compat_handle_okay(guest_head, 2))
>> -            return 0;
> If you intentionally remove this and ...
>
>> -        if (__copy_from_compat(&bufhead32, guest_head, 1))
>> +        if (raw_copy_from_guest(&bufhead32, head, sizeof(bufhead32)))
>>              return 0;
>>          bufhead.ebp =3D (struct frame_head *)(unsigned long)bufhead32.e=
bp;
>>          bufhead.ret =3D bufhead32.ret;
>>      }
>> -    else
>> -#endif
>> -    {
>> -        XEN_GUEST_HANDLE_PARAM(const_frame_head_t) guest_head =3D
>> -            const_guest_handle_from_ptr(head, frame_head_t);
>> -
>> -        /* Also check accessibility of one struct frame_head beyond */
>> -        if (!guest_handle_okay(guest_head, 2))
>> -            return 0;
> ... this, then you should justify why these aren't needed anymore
> (or maybe were never really needed). They've been put there for a
> purpose, I'm sure, even if I'm unclear about what one it was/is.

I don't see what purpose they serve at all.=C2=A0 The OK checks only look f=
or
encroachment into the Xen virtual range.

The two cases where this does anything, is userspace with a stack
immediately adjacent to the lower canonical boundary (which doesn't
happen in practice because of the astounding number of errata there), or
for PV32 kernels with a stack at the legacy Xen boundary.

~Andrew


