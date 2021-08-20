Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE64E3F24B4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 04:19:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169176.309042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGu7N-0005KL-Vm; Fri, 20 Aug 2021 02:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169176.309042; Fri, 20 Aug 2021 02:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGu7N-0005I8-SB; Fri, 20 Aug 2021 02:18:49 +0000
Received: by outflank-mailman (input) for mailman id 169176;
 Fri, 20 Aug 2021 02:18:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mGu7L-0005I2-MB
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 02:18:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1e7eb1d-015c-11ec-a67a-12813bfff9fa;
 Fri, 20 Aug 2021 02:18:45 +0000 (UTC)
Received: from AM6PR02CA0033.eurprd02.prod.outlook.com (2603:10a6:20b:6e::46)
 by DB7PR08MB3436.eurprd08.prod.outlook.com (2603:10a6:10:44::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 20 Aug
 2021 02:18:42 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::17) by AM6PR02CA0033.outlook.office365.com
 (2603:10a6:20b:6e::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 02:18:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 02:18:42 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Fri, 20 Aug 2021 02:18:42 +0000
Received: from f880f814f4a5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E8A5CC14-8E54-4789-ADE6-AE35933147D3.1; 
 Fri, 20 Aug 2021 02:18:31 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f880f814f4a5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 02:18:31 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0801MB1623.eurprd08.prod.outlook.com (2603:10a6:4:3b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.21; Fri, 20 Aug
 2021 02:18:19 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 02:18:19 +0000
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
X-Inumbo-ID: f1e7eb1d-015c-11ec-a67a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7ow2CG31+YTKKpEYNAbnCqZcngS2cScXnjBUlDZiQo=;
 b=mo7r+9ucohESRfBhGg6xCsBvyx3DWwkRoIH3z3ixUh2EOviGYFLeXeLhlL9LpiRGCgze+K7+cl7Pc1KCKgLcraVHfSH6JP0eP+Cw4lmSZ9Mkj7hIJeIDMmHIjrkd1PZ5GDfKNdrmpi/jHuy/01UCsPPosdxo3rkDA5BcTWw+B7o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDPmmo8A0Zk27Q8IlC7JS4PQKU1teJeW9rbQz0cquBKmHy7lqJ7s5IR7MJtlW/FdckumODCAQesSP1iXXYjTfc1ElZS0zrTGUcLV3gbl7v/y+2xy/ydsD7lo6ot5cL3y3HSRVjRBiIFtVhRPXAWzum3U6PI1eEic//or94ZXG4rbjNGDF4znTy7Xe/Mmp4hNJf1WXIk+ABkxsGfs4BXkiwwYNTYzx/dqB99S2pjvn20Izc6hmYfshf+JCPcMAs7mFLfQOI5XeA60praeJPXeOSi6bTFaqfaUhaiaqoNPvE8hRc+XTGCR9tgscqN8hRVaBTuhz1BcKeGlV5eClfsx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7ow2CG31+YTKKpEYNAbnCqZcngS2cScXnjBUlDZiQo=;
 b=mA+xqeWR0fN5hNMBvQnKpLPxHroKcFCuXqAVNdNv9or7t7p559hWg3lTY7diJA9BBt0953l2B6/QyotyNvYoiy913be4eHdsYu1r1p80jDMiwwFbU5QGx7gr/2aixoTWLKg98Aeh0dgwQUtP9zKcBVj67SI0cWJ6pxwUVXCCWqdfOOSQBnE52xqZ3LiIPa+B245xK/4kuF8igIRrWEiDBee5kUc5/i5X5gnc6JJFgk5kIZsN9HeLSoZvjuhruZK03ZCNvLt/Fp5bVMMwS4pkK4lVDRHscRZd4XOrISUg8POvWsxZl/ikIwDLtt5/fmDd734FF1Ej5jTBUUDycVjScw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7ow2CG31+YTKKpEYNAbnCqZcngS2cScXnjBUlDZiQo=;
 b=mo7r+9ucohESRfBhGg6xCsBvyx3DWwkRoIH3z3ixUh2EOviGYFLeXeLhlL9LpiRGCgze+K7+cl7Pc1KCKgLcraVHfSH6JP0eP+Cw4lmSZ9Mkj7hIJeIDMmHIjrkd1PZ5GDfKNdrmpi/jHuy/01UCsPPosdxo3rkDA5BcTWw+B7o=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 18/40] xen/arm: Keep memory nodes in dtb for NUMA
 when boot from EFI
Thread-Topic: [XEN RFC PATCH 18/40] xen/arm: Keep memory nodes in dtb for NUMA
 when boot from EFI
Thread-Index: AQHXjptJE815hXcKO0qqVfBN7cbO2at7I+qAgACRNuA=
Date: Fri, 20 Aug 2021 02:18:18 +0000
Message-ID:
 <DB9PR08MB6857F9C9DAE5314C1F99E0159EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-19-wei.chen@arm.com>
 <bfcfa593-60ac-43a7-4f1f-a7a3ab04a1ff@xen.org>
In-Reply-To: <bfcfa593-60ac-43a7-4f1f-a7a3ab04a1ff@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 647A6D030E08D6448204841F10D7C244.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1c03726a-4e5b-4d1c-120d-08d96380d4ba
x-ms-traffictypediagnostic: DB6PR0801MB1623:|DB7PR08MB3436:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB343697C2AE185BD4E2E64D899EC19@DB7PR08MB3436.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WLKZDH/7s5/rkN7y2T8BqBXyE6e1uq/COBqeNLcIyE1wMjQeecYFw8XyPSt2rvesTdIjUv7IF1KE4fRlqjrKPK7tt7eUfXsjecKuTujLsnTVX3kdB9eO9ZppG/ZCMzYAZSEdVwL3WTFYAMoA/c3IeMTeQDhbjPJkr2JR1rwJ3THCa6l3ufTPQQ3irOXRINjPU5fUj8O8RpqxGLZ7VvkmVsEU2P4U50ODtP5QokCTmhoYEaBlfH06SKIzJodccw11WyVmcG1tV0Mxu4+Vsuikae1ySivm92RbFYOfvAbhPFyNytFCzoKasC2z4uxaMYlhUygIuYV3jRWUMDdWZJO2UGwwkaQBdFFPBOmvihWjKEPO8EKj58IAsURRec3VvhbiLGMH7J14QNW55DN0NAjt8wuPxrJJdYwSTWbJpxXhLf4nGJeiWk6cWj3bw021KH7sZ3IJ8zSECoyjc+6Hr/qA/BV7XcZ6W7EBHBCdTEehM1HafPuypXp/asagthv926S+jhB1L3rCioK6L1gb1c9qOEJ3cgVFO1rN86BxX3QrA1n6cqCcyBSSPJviw9wKjXO+JDMnoOpWMbpzquzxKPutjNbU+Ahmifib6MlmY8//g9jgg0tb1qArs4t12bMKOvXEM4wGkPM/onHvnFC71uxcLOElSLEsoigjTtXYpbze58G5XGfMQm/2fae9Wl/dkBd4Wyb7srazgG1AaToY4dXAZw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(186003)(5660300002)(66476007)(2906002)(9686003)(26005)(6506007)(7696005)(53546011)(86362001)(8676002)(83380400001)(52536014)(38100700002)(76116006)(4326008)(33656002)(66946007)(122000001)(316002)(71200400001)(508600001)(38070700005)(110136005)(66556008)(64756008)(8936002)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGMrTXZBQUNxUlZmN05hTWF3UHpmT25IQVVVUWs0Q3JJOTc1cjRmRE9NamZs?=
 =?utf-8?B?S1lKYlhQVTd3a0tXOEdoMEozRlQ5VnRFQUsvZTZQVWpxYkw2VGhwVDdiN2lH?=
 =?utf-8?B?RFNNcWhVc3FGbWZNK053RzlEUGxybjRLREp3WHhURHdJZmloOFJMQlRiTkVr?=
 =?utf-8?B?L0UvZm1XQjNBZUc5YVhyME4rT1NjQmxUMlk5Tk03MW9kZ2M4azROc3dmNE1L?=
 =?utf-8?B?dkl6WVUyd3hrWG0wV3pLT1hITGg2R2NjSC9ZM0xjQWxlVFBkNE13SmF0c3Jo?=
 =?utf-8?B?VDFiZDFNaHJ3a2xTdU01SkZCMmNkRnk5cGpHSzNyQ2pIY3k1WlVJdll0aXdF?=
 =?utf-8?B?WnZqSytWTGNEMmZ5ZENkdk5WRUdKOGYzbyttZ3dmKzlTT2xWdWs1ZTduRFAz?=
 =?utf-8?B?OFdvKzY1ckdJZ29UNnZmM29rR2F2d0xqNVdycjFUcm4zY3JkeDVUenBOdHhi?=
 =?utf-8?B?MkNISmpwVm5uTE95aElueTBCcis2R1VYV0tna2hEZDl1V2ZiQ1prL0VYeUU5?=
 =?utf-8?B?Mld3OUtoek5wNENITzRkZlNmS3ZjVzgvODZvVWdBV05ZaTdTeVF2Z2FFT3BN?=
 =?utf-8?B?T0ovRlJjUEdlNC95d1crREVMTUI3MkZxTHBFRkNmRVRNdnlXSjE4bzkxSm04?=
 =?utf-8?B?S3F5QUVpM2lPemQ3TTlZRzJEMkZKWTNEQmZvdXhIWTJRdUxQRGJ2R0Z1bmw4?=
 =?utf-8?B?bHlZTE9OUzQvS0VVZGlIbEpzZ1F1ckN1U2thK3dsNUJ0MmlEU3B2cy80SHZM?=
 =?utf-8?B?OVBOKzBjSjljSDFVVWtzWGtrMmF0SFlHaG15QkYydi8rS2phVkR3TFFhTHdt?=
 =?utf-8?B?czZkc0FsQ1hCRnFMUGNuUjMramRPalkxRkJZZDRSRytTb3hFUy9WSWowYm5z?=
 =?utf-8?B?NmhqbzZRN3Noc0RNUnJWcGxncXpmRmRjTUFRbEJQVi9IOFV6aVdYWFBZMVVZ?=
 =?utf-8?B?cHRlYUZ2Rng5aUY5MEh6MnNRM3NhRUVvZWt0bVNYK2lKdFNNcjFJV210Zyt5?=
 =?utf-8?B?c3orNkIrSXZ0SDlkemthSjhvbWpIQUVXbkgxcUE4eFcvS0h0eDJ0YURnZDI2?=
 =?utf-8?B?MXRwUHN3WUlWUWJOdnZMWTY3QXYzcUM0RXZKWjdmVjlZTmpFdFV3V1ZyWEtK?=
 =?utf-8?B?NFpEKzVtck1XbGpYcHJKZ2F4ZGo0RWQwckNkNE1NOG5iaW80SE9rbTFLTE9F?=
 =?utf-8?B?WTd4SWJ5Y3pXYW5YWGwzVkxuNU1JWmZ4NWxTZ3Avdi9NWlRXdjlNMkdtdDNO?=
 =?utf-8?B?N1Y1Y2E0S0NxL1AvTGlUMkg3eXRJdWljZ2JzQVdYb0hDaTRMVHd3YW1Qa0V3?=
 =?utf-8?B?a29mWVB5U3doSC9lRTl4ODk3YTVLQWZmZ2NjS2JkamNUQTM5ejFiT0UvVEdm?=
 =?utf-8?B?bHRmTTIzcmNyMW5EV09NR0VKbU9VN21EZWl3TVNSaTRtZnUzWUc3YXpMaTNM?=
 =?utf-8?B?YXV1RytFam5scnlTVVFYb1JNMExiQUVWKzV3YmRrMlRrZ1Fidll6czRBblZ5?=
 =?utf-8?B?NTN6VTYxbDQ0WXh3VmRUT0l1VkwrMFp1Q3c0RGRtVkNYakFUUE5uNEpDVEJr?=
 =?utf-8?B?MHF1dGYyUWRyZmxNL0U0V2cvWWhOTmh5MzgrQlNVZUY0Mkd5OGNTM2NXUVI3?=
 =?utf-8?B?UzdOU1piTFlEWmhPRURDTUQzUFlpSVhOT3haemFRL1ZGbUt6eFA5TnhRU1I4?=
 =?utf-8?B?MmFXVHdLSW8rczJPbmRhUmdoRDk3NmNKK2dVamZPVFA4dUdoRHZjK1JCcDds?=
 =?utf-8?Q?l35auPHBQZpgwsDUWlNEVK7HpBK4/+Ai1fpnNhi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1623
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44e77990-06e8-4dd6-52a5-08d96380c6dc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bRHYkLdhmKW/LGzw9s6f5KQl1o/zF7PLs5xSPGp5vFjXDoEE/AIIhsZlkdbfqLSlYT1fZo1upERh+dJNXONCePa6XcoY1zjLqCwB1WNoER10Hk0ixkxVVuEkn2T5z1H4VIL+JH8+GiyycxdKROrM7pCPPvnO8VD7iiks3JB2z8bqHtJm0qNsZ+Lo0vKnbro+EqTRJJcpCEZR+NSIYKQXIdjjaCvEklrE/NpeVwTo+/buw2PNjyEHOYEI6R+P/OcNffQUZrGKxdfZXjpZNsqfcDoiqIGChiZDjbbOcnkMGkZsUzietw4GhGEFXNtaDNOjVKNaNzNzRwMHoZcJGbPwduip9ilYJ7TBMB0xPGgsbaiiAe0/eG55KglinRz62lUZwsTzwhTgf2277FLJCW2rGh+YNXctucIQQM53jQGjDOgGgBS/vhot+LAZATT+pA4xob7v4ZGXFrM1eRUoorWwNzKsC/ps1jSSem//0/UJzh3sHYZOka3fe51AoQOSq38hoTj0iA80Oft74P5kzNi4nhAvmf9CjUBC0gzO+TiOZFfr3g+KxJUHoV0QGy/FZ7kDi4axMEVQkFr/ja4NISiyXMBIvHzqxYCyD81O/KnAQ5/1jb4vpmWIu1tgWTdQyCHesyOb2AX3wYrArJRuBnObDjCWGrHhel7pz5eGdYIsvHRmgOej6xr/8rbw9Tm+ql1WxcrH5zWfceHIDK8ZOaZICA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(376002)(346002)(36840700001)(46966006)(2906002)(82740400003)(478600001)(7696005)(5660300002)(82310400003)(83380400001)(26005)(8676002)(33656002)(86362001)(4326008)(336012)(55016002)(186003)(70206006)(70586007)(356005)(36860700001)(9686003)(8936002)(53546011)(110136005)(6506007)(316002)(47076005)(81166007)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 02:18:42.4484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c03726a-4e5b-4d1c-120d-08d96380d4ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3436

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMTozNQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGpiZXVsaWNoQHN1c2UuY29tDQo+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAxOC80MF0geGVuL2FybTogS2VlcCBtZW1vcnkgbm9kZXMg
aW4gZHRiIGZvcg0KPiBOVU1BIHdoZW4gYm9vdCBmcm9tIEVGSQ0KPiANCj4gSGkgV2VpLA0KPiAN
Cj4gT24gMTEvMDgvMjAyMSAxMToyNCwgV2VpIENoZW4gd3JvdGU6DQo+ID4gRUZJIGNhbiBnZXQg
bWVtb3J5IG1hcCBmcm9tIEVGSSBzeXN0ZW0gdGFibGUuIEJ1dCBFRkkgc3lzdGVtDQo+ID4gdGFi
bGUgZG9lc24ndCBjb250YWluIG1lbW9yeSBOVU1BIGluZm9ybWF0aW9uLCBFRkkgZGVwZW5kcyBv
bg0KPiA+IEFDUEkgU1JBVCBvciBkZXZpY2UgdHJlZSBtZW1vcnkgbm9kZSB0byBwYXJzZSBtZW1v
cnkgYmxvY2tzJw0KPiA+IE5VTUEgbWFwcGluZy4NCj4gPg0KPiA+IEJ1dCBpbiBjdXJyZW50IGNv
ZGUsIHdoZW4gWGVuIGlzIGJvb3RpbmcgZnJvbSBFRkksIGl0IHdpbGwNCj4gPiBkZWxldGUgYWxs
IG1lbW9yeSBub2RlcyBpbiBkZXZpY2UgdHJlZS4gU28gaW4gVUVGSSArIERUQg0KPiA+IGJvb3Qs
IHdlIGRvbid0IGhhdmUgbnVtYS1ub2RlLWlkIGZvciBtZW1vcnkgYmxvY2tzIGFueSBtb3JlLg0K
PiA+DQo+ID4gU28gaW4gdGhpcyBwYXRjaCwgd2Ugd2lsbCBrZWVwIG1lbW9yeSBub2RlcyBpbiBk
ZXZpY2UgdHJlZSBmb3INCj4gPiBOVU1BIGNvZGUgdG8gcGFyc2UgbWVtb3J5IG51bWEtbm9kZS1p
ZCBsYXRlci4NCj4gPg0KPiA+IEFzIGEgc2lkZSBlZmZlY3QsIGlmIHdlIHN0aWxsIHBhcnNlIGJv
b3QgbWVtb3J5IGluZm9ybWF0aW9uIGluDQo+ID4gZWFybHlfc2Nhbl9ub2RlLCBib290bWVtLmlu
Zm8gd2lsbCBjYWxjdWxhdGUgbWVtb3J5IHJhbmdlcyBpbg0KPiA+IG1lbW9yeSBub2RlcyB0d2lj
ZS4gU28gd2UgaGF2ZSB0byBwcnZlbnQgZWFybHlfc2Nhbl9ub2RlIHRvDQo+IA0KPiBzL3BydmVu
dC9wcmV2ZW50Lw0KPiANCg0KT2sNCg0KPiA+IHBhcnNlIG1lbW9yeSBub2RlcyBpbiBFRkkgYm9v
dC4NCj4gPg0KPiA+IEFzIEVGSSBBUElzIG9ubHkgY2FuIGJlIHVzZWQgaW4gQXJtNjQsIHNvIHdl
IGludHJvZHVjZWQgYSB3cmFwcGVyDQo+ID4gaW4gaGVhZGVyIGZpbGUgdG8gcHJldmVudCAjaWZk
ZWYgQ09ORklHX0FSTV82NC8zMiBpbiBjb2RlIGJsb2NrLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gICB4ZW4vYXJjaC9h
cm0vYm9vdGZkdC5jICAgICAgfCAgOCArKysrKysrLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL2VmaS9l
ZmktYm9vdC5oIHwgMjUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAgeGVuL2luY2x1
ZGUvYXNtLWFybS9zZXR1cC5oIHwgIDYgKysrKysrDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jDQo+ID4gaW5kZXgg
NDc2ZTMyZTBmNS4uN2RmMTQ5ZGJjYSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vYm9v
dGZkdC5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYw0KPiA+IEBAIC0xMSw2ICsx
MSw3IEBADQo+ID4gICAjaW5jbHVkZSA8eGVuL2xpYi5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9r
ZXJuZWwuaD4NCj4gPiAgICNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KPiA+ICsjaW5jbHVkZSA8eGVu
L2VmaS5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPg0KPiA+ICAgI2luY2x1
ZGUgPHhlbi9saWJmZHQvbGliZmR0Lmg+DQo+ID4gICAjaW5jbHVkZSA8eGVuL3NvcnQuaD4NCj4g
PiBAQCAtMzM1LDcgKzMzNiwxMiBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9zY2FuX25vZGUo
Y29uc3Qgdm9pZCAqZmR0LA0KPiA+ICAgew0KPiA+ICAgICAgIGludCByYyA9IDA7DQo+ID4NCj4g
PiAtICAgIGlmICggZGV2aWNlX3RyZWVfbm9kZV9tYXRjaGVzKGZkdCwgbm9kZSwgIm1lbW9yeSIp
ICkNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBJZiBzeXN0ZW0gYm9vdCBmcm9tIEVGSSwgYm9v
dGluZm8ubWVtIGhhcyBiZWVuIHNldCBieSBFRkksDQo+IA0KPiAiSWYgdGhlIHN5c3RlbSBib290
Ii4gQWx0aG91Z2gsIEkgd291bGQgc3VnZ2VzdCB0byB3cml0ZToNCj4gDQo+ICJJZiBYZW4gaGFz
IGJlZW4gYm9vdGVkIHZpYSBVRUZJLCB0aGUgbWVtb3J5IGJhbmtzIHdpbGwgYWxyZWFkeSBiZQ0K
PiBwb3B1bGF0ZWQuIFNvIHdlIHNob3VsZCBza2lwIHRoZSBwYXJzaW5nLiINCj4gDQoNClllcywg
dGhhdCB3b3VsZCBiZSBiZXR0ZXIuIEkgd2lsbCBjaGFuZ2UgaXQgaW4gbmV4dCB2ZXJzaW9uLg0K
DQo+ID4gKyAgICAgKiBzbyB3ZSBkb24ndCBuZWVkIHRvIHBhcnNlIG1lbW9yeSBub2RlIGZyb20g
RFRCLg0KPiA+ICsgICAgICovDQo+ID4gKyAgICBpZiAoIGRldmljZV90cmVlX25vZGVfbWF0Y2hl
cyhmZHQsIG5vZGUsICJtZW1vcnkiKSAmJg0KPiA+ICsgICAgICAgICAhYXJjaF9lZmlfZW5hYmxl
ZChFRklfQk9PVCkgKQ0KPiANCj4gYXJjaF9lZmlfZW5hYmxlZCgpIGlzIGdvaW5nIHRvIGJlIGxl
c3MgZXhwZW5zaXZlIHRoYW4NCj4gZGV2aWNlX3RyZWVfbm9kZV9tYXRjaGVzKCkuIFNvIEkgd291
bGQgc3VnZ2VzdCB0byByZS1vcmRlciB0aGUgb3BlcmFuZHMuDQo+IA0KDQp5ZXMuDQoNCj4gPiAg
ICAgICAgICAgcmMgPSBwcm9jZXNzX21lbW9yeV9ub2RlKGZkdCwgbm9kZSwgbmFtZSwgZGVwdGgs
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGRyZXNzX2NlbGxzLCBz
aXplX2NlbGxzLA0KPiAmYm9vdGluZm8ubWVtKTsNCj4gPiAgICAgICBlbHNlIGlmICggZGVwdGgg
PT0gMSAmJiAhZHRfbm9kZV9jbXAobmFtZSwgInJlc2VydmVkLW1lbW9yeSIpICkNCj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oIGIveGVuL2FyY2gvYXJtL2VmaS9l
ZmktYm9vdC5oDQo+ID4gaW5kZXggY2Y5YzM3MTUzZi4uZDBhOTk4N2ZhNCAxMDA2NDQNCj4gPiAt
LS0gYS94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0v
ZWZpL2VmaS1ib290LmgNCj4gPiBAQCAtMTk3LDMzICsxOTcsOCBAQCBFRklfU1RBVFVTIF9faW5p
dA0KPiBmZHRfYWRkX3VlZmlfbm9kZXMoRUZJX1NZU1RFTV9UQUJMRSAqc3lzX3RhYmxlLA0KPiA+
ICAgICAgIGludCBzdGF0dXM7DQo+ID4gICAgICAgdTMyIGZkdF92YWwzMjsNCj4gPiAgICAgICB1
NjQgZmR0X3ZhbDY0Ow0KPiA+IC0gICAgaW50IHByZXY7DQo+ID4gICAgICAgaW50IG51bV9yc3Y7
DQo+ID4NCj4gPiAtICAgIC8qDQo+ID4gLSAgICAgKiBEZWxldGUgYW55IG1lbW9yeSBub2RlcyBw
cmVzZW50LiAgVGhlIEVGSSBtZW1vcnkgbWFwIGlzIHRoZSBvbmx5DQo+ID4gLSAgICAgKiBtZW1v
cnkgZGVzY3JpcHRpb24gcHJvdmlkZWQgdG8gWGVuLg0KPiA+IC0gICAgICovDQo+ID4gLSAgICBw
cmV2ID0gMDsNCj4gPiAtICAgIGZvciAoOzspDQo+ID4gLSAgICB7DQo+ID4gLSAgICAgICAgY29u
c3QgY2hhciAqdHlwZTsNCj4gPiAtICAgICAgICBpbnQgbGVuOw0KPiA+IC0NCj4gPiAtICAgICAg
ICBub2RlID0gZmR0X25leHRfbm9kZShmZHQsIHByZXYsIE5VTEwpOw0KPiA+IC0gICAgICAgIGlm
ICggbm9kZSA8IDAgKQ0KPiA+IC0gICAgICAgICAgICBicmVhazsNCj4gPiAtDQo+ID4gLSAgICAg
ICAgdHlwZSA9IGZkdF9nZXRwcm9wKGZkdCwgbm9kZSwgImRldmljZV90eXBlIiwgJmxlbik7DQo+
ID4gLSAgICAgICAgaWYgKCB0eXBlICYmIHN0cm5jbXAodHlwZSwgIm1lbW9yeSIsIGxlbikgPT0g
MCApDQo+ID4gLSAgICAgICAgew0KPiA+IC0gICAgICAgICAgICBmZHRfZGVsX25vZGUoZmR0LCBu
b2RlKTsNCj4gPiAtICAgICAgICAgICAgY29udGludWU7DQo+ID4gLSAgICAgICAgfQ0KPiA+IC0N
Cj4gPiAtICAgICAgICBwcmV2ID0gbm9kZTsNCj4gPiAtICAgIH0NCj4gPiAtDQo+ID4gICAgICAv
Kg0KPiA+ICAgICAgICogRGVsZXRlIGFsbCBtZW1vcnkgcmVzZXJ2ZSBtYXAgZW50cmllcy4gV2hl
biBib290aW5nIHZpYSBVRUZJLA0KPiA+ICAgICAgICoga2VybmVsIHdpbGwgdXNlIHRoZSBVRUZJ
IG1lbW9yeSBtYXAgdG8gZmluZCByZXNlcnZlZCByZWdpb25zLg0KPiA+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3NldHVwLmgN
Cj4gPiBpbmRleCBjNGI2YWY2MDI5Li5lNGZiNWYwZDQ5IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9p
bmNsdWRlL2FzbS1hcm0vc2V0dXAuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vc2V0
dXAuaA0KPiA+IEBAIC0xMjMsNiArMTIzLDEyIEBAIHZvaWQgZGV2aWNlX3RyZWVfZ2V0X3JlZyhj
b25zdCBfX2JlMzIgKipjZWxsLCB1MzINCj4gYWRkcmVzc19jZWxscywNCj4gPiAgIHUzMiBkZXZp
Y2VfdHJlZV9nZXRfdTMyKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwcm9wX25hbWUsIHUzMiBkZmx0KTsNCj4gPg0K
PiA+ICsjaWYgZGVmaW5lZChDT05GSUdfQVJNXzY0KQ0KPiA+ICsjZGVmaW5lIGFyY2hfZWZpX2Vu
YWJsZWQoeCkgZWZpX2VuYWJsZWQoeCkNCj4gPiArI2Vsc2UNCj4gPiArI2RlZmluZSBhcmNoX2Vm
aV9lbmFibGVkKHgpICgwKQ0KPiA+ICsjZW5kaWYNCj4gDQo+IEkgd291bGQgcHJlZmVyIGlmIHdl
IGludHJvZHVjZSBDT05GSUdfRUZJIHRoYXQgd291bGQgc3R1YiBlZmlfZW5hYmxlZA0KPiBmb3Ig
YXJjaGl0ZWN0dXJlIG5vdCBzdXBwb3J0aW5nIEVGSS4NCj4gDQoNClllcywgdGhhdCdzIGEgZ29v
ZCBpZGVhLg0KSSBhbHNvIGZlZWwgYSBsaXR0bGUgYXdrd2FyZCB3aXRoIHRoZSBjdXJyZW50IGFy
Y2ggaGVscGVycy4NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

