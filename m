Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D736220D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 16:21:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111786.213780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXPLa-0006Zc-Qb; Fri, 16 Apr 2021 14:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111786.213780; Fri, 16 Apr 2021 14:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXPLa-0006ZC-NT; Fri, 16 Apr 2021 14:21:26 +0000
Received: by outflank-mailman (input) for mailman id 111786;
 Fri, 16 Apr 2021 14:21:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kml=JN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lXPLZ-0006Yy-B3
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 14:21:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be150543-f36b-4b4d-99ef-480368d2b169;
 Fri, 16 Apr 2021 14:21:24 +0000 (UTC)
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
X-Inumbo-ID: be150543-f36b-4b4d-99ef-480368d2b169
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618582884;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TS4K04nzW27cq6sYeA1GsnoF5qXEBZPiikDGGWvrla0=;
  b=AJckSucdqQsEq6890bC1W3h0rHyfoGc4X5AKR6aCXoW5TntSkpgV6m/C
   vVW0Ez4qSz2LhUMg50CpB1xDf/uH7Fdafu99GNEMDwQVNxKaQJ6ViJVV7
   wi4OfhbzbLgAuAoeHoKZfqfZmt95K/Xtg16vecax2jEi3k6Ad8ttoThn4
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: sUcZt3QaDMLDz6ITqMrCoHBKqNTxAsFuHVP+j6U2Ca6gc+hJmoxVu4tz3E7tCDdt20JZm/aBxY
 EPsMtZR9v4f45QPcgJUc6dDoNTWWopBzvPAyCTdknBSfza8zqQWaPaX7pKaxjchmdFL51tgILW
 lHSwhIsvgCOOoP5v1oGVGhsTvcghstjFRsaeWNOv7HDiMIyVjNq0ps6gCeUAIrJPUX4KVAh/zG
 ep9OL5WyCId6dwCdP7lCS32EyaatIOUUHrd7kXyDN6hlkIiqEJ9hv68IarnQ/Sw4WWdodTsyXR
 +Sg=
X-SBRS: 5.2
X-MesageID: 41766731
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5BytvqEd1nvevSOzpLqFR5TXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7L0/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeOJwTXzcQY76
 tpdsFFZOHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLT1CQYsI1XYcNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQB0g/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcHHOjKf2QoTVC4K/Kc6/Q
 H+4nDEz4iAk9X+8B/T0GfP849b8eGB9vJvDNGB4/JlUQnEpR2vYO1aKtu/lRAz5Nqi8VM71O
 TLyi1QQvhbz1P0UiWLrQD22w/muQxemUPK7VODm3PsrYjYaVsBerJ8rLlUeBfY9EYs1esUuM
 kgshP7xvgneS/opyjz68PFUBtnjCOP0B0fuNUekmBFVs8mYKJRxLZvj399KosKHy7x9ekcYZ
 BTJfzbjcwmFG+yU2rUpS1GztCqQx0Ib227a3lHkMmU3z9KpWt+3ksVyecO901whK4Vet1q4f
 /JPb9vk6wLZsgKbbhlDONEesevDHfRKCi8fl66EBDCLuUqKnjNo5n47PEc4/yrQoUByN8XlI
 7aWF1VmGYucyvVeIyz9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykuO7ys9vQPHzar
 KWAtZ7EvXjJWzhFcJixAvlQaRfLnEYTYk8pss7YVSTucjGQ7ea9dDzQbL2Hv7AADwkUmTwDj
 8oRz7oPvhN6UitRzvWmx7Ud3TxelHu3J55HaTAltJjjLQlB8lpiEw4mF657saEJXlpqaotZn
 ZzJ7vhj+eaqACNjCH1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaXWhT2XCANyJuVs++Kn
 8Ym31HvYaMa7CAzyErDNyqdkiAiWEImX6MR5AA3oqO+NniYZF9Kpo9QqR+GUHqGnVO6EZXgV
 YGTDVBal7UFzvoh6ngpocTHvvje951hxruB9VVp3LZvUC1vtouWXMfYj6rXaes8EMTbgsRom
 c0374UgbKGlzrqA3A4mv4EPFpFb3nSPKhLFz2fZIJfmqnifSZ5SWviv03CtzgDPk7Rs2kCjG
 3oKiOZPdXGGEBUtHxj3qH2y19sbWmGc0Vsand1jJ1lGQ39ywNO+N7OQpD2/3qaa1MEzO1YCj
 3DbDcICi5Fxty81neu6Xu/PERj4q9rEv3WDbwlfb2W52ikL5eQk7oaW9VO+ox+CdzouugXcO
 6WdgOPNgnkA+cx1wH9nAd8BABE7F0f1d/40hzs62a1mEMlCf3JOVJ8WvU1Jcqf42WMfYfB7L
 xJyfYO+c2+PWX6ZoTYleX5bztfJgjSpmDzZecyspxQtb8zsrw2P5Sza0q/6Fh3mDEFaOHznw
 ciZY4+xpbrEIpmZdYTdCJU5UBBrqXEEGIb9ijNRtYjdlQshULBN9yH47D0uaMia3fx0zfYCB
 26yWlh5P/LUCuI6K4CB48xKWpQblIg6H4KxpLKS6TgTCGrffpE5ly0LzuUd6JcUrGMHdwr31
 pHyuDNu++cbCzj3g/M+RN9P6JV6m6iBee/GhiFF+IN09u0Pz238+SXyf/2qDf8Uj2gbUsEwa
 VDaEwLd8xGzgAYs7df6Fn4doXH5mQ/k1Vf5jl7llninqieiV2rbH1uAEn+mZVZXT5aL36Sq9
 /KmNLoj0jA3A==
X-IronPort-AV: E=Sophos;i="5.82,226,1613451600"; 
   d="scan'208";a="41766731"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nr/RPSeBC8DMK2S2TDySqAqp5v35PzTyuULwGm6H/0u8OrPO+jhZ966rB2lga8G2DvkUmRg/1ihvQfcDX8ezTng/PqdlhcULIBXSFeP0b6Rp64pPM4NlJ/zH6iZ/CCZGvIiYvM6J4y88Wu208vx0nWKjM22pM+K2eCpB5K88zNS/pQLQNjIzL27Zq3s4ZliVTE3F/zVn25hwIABjILsTNH2ZOxORDRuJ63calpy57QOJU/zu76nB9bBmwIS4cDE1fxk5SKZk9Z1lIY9Ny2Jf9vOoPYqZ1CVehm2GssGZcSF6tTGILfXxpuzltfsfYCU5sWP5wsrePHiXEwqydFZYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TS4K04nzW27cq6sYeA1GsnoF5qXEBZPiikDGGWvrla0=;
 b=YIvIUNb73jfM2dyiJdtKzS94rbP9OYJyGpAW7849XNdKaIFFnnjUT6FyBppwgDFFWocfHCoMKZm992A10tYRnldomQf9HBsPw72RjaKpGIPp5nuMyskKajry0FHfPgsZzLxmnd5fe6KlgjBwKVpEus5Rz0/vnqZZg/f8zw1YPzzyXsOaCoJxqbPi0LVcAESLwEwInKiGSMX+JgYzhAKYfZ9JuYJuzHJ7Sm0t38Q4orbgdwHFrKNRNJFzlBIfSuTFMMxsHHMdLz28yCl0gtfubt85Gv9T8gjnVSQ3BQ30dj+ikd0M/Be/asP7w5aJ/V5ZsC1S7kAXUeRkhm5LRe3XEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TS4K04nzW27cq6sYeA1GsnoF5qXEBZPiikDGGWvrla0=;
 b=oFSw58DP6SUWxHn/QjGWr4WEsbaNQrq6wMACY+wxaqFAbV7+QV0M+CfeIxRxrrFos6VlYNfSzMThwxRQwBqSuIg9GfR+7MYpyvgxgaXyTpvDCfNX14pN7hLzzo397PeBuwoagm87rblGgnlLyO8pFwHW9DfxCjPf9WlqoW0raSU=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <7ffeec9f-2ce4-9122-4699-32c3ffb06a5d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/AMD: also determine L3 cache size
Message-ID: <3ff79e34-da70-85c3-0324-efa50313d5b4@citrix.com>
Date: Fri, 16 Apr 2021 15:21:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <7ffeec9f-2ce4-9122-4699-32c3ffb06a5d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0294.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38889546-ee66-415b-522e-08d900e2e057
X-MS-TrafficTypeDiagnostic: BYAPR03MB4245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4245F438467485C1830BA031BA4C9@BYAPR03MB4245.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6NJUxWAMVQoYG/oxbMgb6eW2uU2ZZwGfNCzkN/pZl93GL+392WOWiHUZ058pYAkUWbIeMVrs0hRPR3sTLkPVNxUbqdYBqHgoZKJATXYy73Pv9fy39kmE/Wdyii35IwwpOq6iDt+cSkwELRmti/FMD4slwCICBHDZ6cMD/Pnnum2heqUqiamTBv2DcOSMaECY+IB7sXuLjStrrzTtxwCf4y6V594P8hnaB1pSpSDpp/m2s0+DjXc8nl2JHxXDGqa7rsWlQagxwnCrck37puI3E3etT2ECPEdJnJAO3LCDJlaB3OMFcejQqrK3cGkAE3PuG9Q+hPjwK0AKeSBY421BgoyKkcIy4aPYeLh+mCTS2Dyc1m1+fw770xoXpwShbqQQv5HI5kNdCH/kMbwYznTWIsR7GSboLI+nVqeSJDVPrEXZ8PPk7UHdt/iLCl8wCPEsuxVvuFW/hOKZyWMjs3BbUaY/IT/NU4zxQ4Hy7u5wc7jpaIRwhRpd7PeXla9sJD/nBLnv73oehc+/jOA0FsBX0dW7yahbTSKHlNoC4qxDU4C1WT6e4REDBpaFIAb0VpVCnK3TFxaiPpNpYU5CfQB/h1+NogLJDDctQElp4ozoIvo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(31686004)(54906003)(16576012)(316002)(110136005)(6666004)(956004)(2616005)(31696002)(2906002)(478600001)(86362001)(107886003)(4326008)(66476007)(66556008)(66946007)(36756003)(6486002)(53546011)(16526019)(186003)(26005)(8936002)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d2s3NExEbmgrbnpEYjV1OVFiak9ZS091L1hGOU5Nc0dPbzJNeTd3U1ZLdzR5?=
 =?utf-8?B?aFJZZyt3Qk9kd3JLbVJTdU1Wa3ViUzIzUE1aYTJWaXh4b09qSU1QT0IwU0cx?=
 =?utf-8?B?K0VJTmxzSU1IRzdSb1lPR3JoNVFtanFSVlZTZGNXd2NRMWpySzNFMkdxaEJi?=
 =?utf-8?B?ZU8vOWNJZ0RwY3R4S1FudG9GdW1kVW5NVEUzRVpHaFo5NTFLNURWMU01akhQ?=
 =?utf-8?B?Y3YzeUIyUXhTUXFIa1NZSFYrcEY0K1daN2hvMmM4c3lQNzkzTUFUVzZFMWxP?=
 =?utf-8?B?eks0LzIzRlM3SFpOOXBTTEZvVXc2Njc3TGxoVlpsV09LWmZ2KzNkR2xUd0Nr?=
 =?utf-8?B?Y3pUNHJ5dHFFM1Mwc0dLV0FaU292UUU2T2R3bklYMWg3R2dzU0NYTTMxUjRG?=
 =?utf-8?B?dHI0bkFvNVRJYVRPQWJHMS9KanZZcEplemh1NzVoMGd4UngyZTk3c0lPcld5?=
 =?utf-8?B?M1IzMHNiUGlXcFRLbks1eXZpM3IvaHdpbEJ3c0ZhM1BsaTFiWG9xMXpXQjQ0?=
 =?utf-8?B?WFFycjVtYUlWa1liTGRZQjhvRmF3NmhkOXZkdTdJdml3T0hES3RBR1BMay9B?=
 =?utf-8?B?SUpRYXEzelJaL1pLUC82OUU1bVdWTkFnbEIwYUdNV3pMY3NwQ29rMDlnOWN1?=
 =?utf-8?B?aG5zRU5JMXVGYnhsaFp1R0hKYkJlVGtqU2U0RWxod1NXa293NEhUV2RiN2FH?=
 =?utf-8?B?VW1QQUV2Z1kyWXVZSnJmcmR4OFFWeW5xTEtZYmZQM01iVkFKR21naHorMmFZ?=
 =?utf-8?B?aENFTDR0SHRNSSswNEVMd0RCTzJLVTlkRHdNMFBjZzRWTzY4Ny9ENU9SeFZ0?=
 =?utf-8?B?cFUvZUk2cE1ZVlFLbTlCa1QyNjhZSnJ0NkJxU1M3L2JQSTdTaFU4eWRvZnYx?=
 =?utf-8?B?aWxoNVVSMWFMN2RIYUhsbmF5WUZLQ0Ivd3VTcGlOS1lJWk9OY3JKK2lvSElM?=
 =?utf-8?B?WE9VNzEyY3E5aGpSZXpQUGJ5YXFTNnhsMkNiUXNsaC95ZHA4eU1MMHZTVlRD?=
 =?utf-8?B?RHFPbmtZWDZUSnZuczFUZUlUNWE3K2tlYkdpb0ZUbmQ4a3BUVHZGTEN1Z3BX?=
 =?utf-8?B?K2tEU05HL3FESUc1SzdqQkQ4aGFkbElTMkZvdS9xbTByWVQvK3U1NHRjY2JJ?=
 =?utf-8?B?VVNqaEVKV3Ridm1QbGIvSkFKWU5WZG94N3YyZUJvaGVQcmZ0TG9nSVdTZTdT?=
 =?utf-8?B?a25lTkpRMUxtMzBxOS9lVmo3ai9lUnliSnB1c1d1Nk1PQ1ExOHF5akV0UHZS?=
 =?utf-8?B?ekF2cGVCcVFMQm10OVhJekVnOC9QakgvSUNTRndvN05mQ3ROTTVZaXgwanJI?=
 =?utf-8?B?VXdUalB3aWd4dEV4N3Z5UnJwVWZRL2VmTEN3azkvazJjSVkxUkZqTDgyM3N0?=
 =?utf-8?B?d2tSMWdFVnFzY3JKSmVKYTFTa1pIMDRBUkdpakIrc09rYnBrMjNRNXZvcnRp?=
 =?utf-8?B?YUdKQ3NyRnpRemVtYmVadm05VWZHdmJ1YkRxT2xHODk0VVFhZFpXL2dPaTlP?=
 =?utf-8?B?dkZmRHdkVWRQaCt5dXZVdjdmUUk5M29OR25FTzNNQmhvTERmV2RJL0gvOVoy?=
 =?utf-8?B?bkpER3pGaVFKWWtOcjNpZkNORlMwdSsrMzlnYWd0Tm5QVE9Pd3Rjc2puQVhP?=
 =?utf-8?B?aUl3eE1PMm1jL0VqRXlrR3p5UEJPOE9WUzRjWGlPMUFWemhNT0pjQUVsb2Ru?=
 =?utf-8?B?VkpNSzBCMEhqNGVQdjFYMkRJd1pwbjZ4VmJZN3NXMzZZdFBIY1MzS0xKZ0pE?=
 =?utf-8?Q?gijo8N6M/m+/uM5cvXRdx1ux+fMk07G3BgHwRjf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38889546-ee66-415b-522e-08d900e2e057
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 14:21:07.7452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2trk0WAwN04/hJSRrlr16nEQsl9svw9IUdfRFKyzR9NjBldzjjBgtSfanUX++A9DlgrcLuM5ZPuq6kDoNH8zQEKPiTzyeUY651NQa5U5uS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4245
X-OriginatorOrg: citrix.com

On 16/04/2021 14:20, Jan Beulich wrote:
> For Intel CPUs we record L3 cache size, hence we should also do so for
> AMD and alike.
>
> While making these additions, also make sure (throughout the function)
> that we don't needlessly overwrite prior values when the new value to be
> stored is zero.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I have to admit though that I'm not convinced the sole real use of the
> field (in flush_area_local()) is a good one - flushing an entire L3's
> worth of lines via CLFLUSH may not be more efficient than using WBINVD.
> But I didn't measure it (yet).

WBINVD always needs a broadcast IPI to work correctly.

CLFLUSH and friends let you do this from a single CPU, using cache
coherency to DTRT with the line, wherever it is.


Looking at that logic in flush_area_local(), I don't see how it can be
correct.=C2=A0 The WBINVD path is a decomposition inside the IPI, but in th=
e
higher level helpers, I don't see how the "area too big, convert to
WBINVD" can be safe.

All users of FLUSH_CACHE are flush_all(), except two PCI
Passthrough-restricted cases. MMUEXT_FLUSH_CACHE_GLOBAL looks to be
safe, while vmx_do_resume() has very dubious reasoning, and is dead code
I think, because I'm not aware of a VT-x capable CPU without WBINVD-exiting=
.

~Andrew


