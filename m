Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C39E43A7ED
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 00:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216095.375563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf8qE-00056x-Ix; Mon, 25 Oct 2021 22:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216095.375563; Mon, 25 Oct 2021 22:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf8qE-00053m-Ek; Mon, 25 Oct 2021 22:53:18 +0000
Received: by outflank-mailman (input) for mailman id 216095;
 Mon, 25 Oct 2021 22:53:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3pPZ=PN=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mf8qC-00053g-1E
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 22:53:16 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 176f6898-4b08-4e7f-89f6-58f3c52ccdb2;
 Mon, 25 Oct 2021 22:53:14 +0000 (UTC)
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
X-Inumbo-ID: 176f6898-4b08-4e7f-89f6-58f3c52ccdb2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635202393;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V/nM33d6voo4983foIZGmSycJc72zb3kex2wyvJoWMY=;
  b=H13t0W8aGnakkZmOvzCUPhm9u2/4a7QPLktQZPQ/8VgOgkp3UgTpDaql
   nIZVOR+/EFNDyDNxxxNmdrjLxtnXdcqwzf7VFds2JcXSD16uMfznfsFZY
   k91NL2uApLIJidZH0ezqjXXfbkcltBDuswwe8swZn/PE/0VciGpvbnr+4
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8czdV+MxPXHOIBlpiQrHWdAjttpwzfrEX/P8i3lxLh1m9UxAte834VHnLtay7u3/mRYqQgNL+E
 sHOG/fOAqI/5wLAnvorzMywBfDveWhRmcghPmRFzebIrt3hIRtAoqc6BwM5Z5KLzC7Ot2Q24R/
 36y1nF6XWShIOCze6U3Oy2hTrPNJspvaZmcUOnVg7azUIq1E2CLwYDMJd7JqkyAHdxrPLBXZLm
 81M0C7f6AbTEKMa06khPD90cs0TDo18+GTAN31JWWbUUk7RJS95OGkm5uoATp5Oj/IFtYmKPol
 OHMIQy00x7UAWqZkDMgRaf/u
X-SBRS: 5.1
X-MesageID: 56055495
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Va1bhqL7QNNTgIA7FE+ROJIlxSXFcZb7ZxGr2PjKsXjdYENS12FUm
 GoaUWqAaKyKNmH9fNhzYdjip0MA7cTdxtM1GVFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eo5xrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3ZlYF2y
 4pWsqCwVCQGZJb2ouA0Dh1XRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gpu3p0TQaeDD
 yYfQTpJaD/9QTMeAE8aFK5mhNas3zrPVjIN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfNly7mXIMZFJWj6+VnxlaUwwQ7CQIUfUu2p+GjjUyzUM4ZL
 FYbkgIxqYAi+UrtScPyNyBUu1bd4ERaAYAJVbRntkfdkcI4/jp1GEBURG9Ga4M9s/M2WB8Fj
 GSzpdfAWDhg5ej9pW2myp+Yqja7OC4wJGAEZDMZQQZt3+QPsL3fnTqUEY49SP/dYsndXGiqm
 WjT/XdWa6A71JZTj82GEUb7byVAT3QjZjU+4RnLRSqb5wd9aZ/Ni2eAuAWDs6gowGp0SDC8U
 Jk4dyq2sL9m4XKlznXlrAAx8FaBvK7tDdEkqQQzd6TNDhz0k5JZQahe4StlOGBiOdsedDnib
 Sf74F0KucYDbCL7PP8mMupd7vjGKoC7TbzYug38NIISMvCdiifepEmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNEiU5GHeegvp6pdynnpW7TqKHfjTlk37uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 r6zwePRkE4BOAA/CwGKmbMuwacidyhnWcmt8JwJLYZu4GNOQQkcNhMY+pt4E6RNlKVJjObYu
 Ha7X05T0l3kgnPbbw6NbxhehHnHBP6TdFo3Yn4hO0iGwX8mbdr95asTbcJvL7Im6PZi3bh/S
 PxcI5eMBfFGSzLm/TUBbMai8Nw+JUrz3Q/ebTC4ZDUffoJ7Q1Cb8NHTYQaypjIFCTC6tJVir
 uT4hB/bW5cKWy9rEN3SNKC011q0sHVEwLByUkLEL8N9YkLp9IQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXRjCJ46y3OC/W+nuY7bVBCOvYLyrAUG7U+bm5Y
 bkHxf/LL/Bazk1BtJBxEug3wPtmtcfvvbJT0i9tAG7PMwawErplL3SLgZtPu6lKyuMLsAe6Q
 BvSqNxTOLHPM8L5Cl8BYgEia73bh/0TnzDT69UzIVn7u3ArrObWDx0KMknekjFZIZt0LJghk
 LUot8Mh4gCijgYnb4SdhSdO+mXQdnENXs3LbH3B7FMHXubz9mx/XA==
IronPort-HdrOrdr: A9a23:mhjzfqiYhHnWfDiIOB4z7izcEHBQX0p13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskKKdkrNhQotKOzOWxFdATbsSkLcKpgePJ8SQzJ8k6U
 4NSdkYNDS0NykBsS+Y2njJLz9D+qj/zEnAv463pB0MPGIaGJ2IrT0JbjpzencGNTWubqBJcq
 Z0iPA3xQZINU5nFfhSURI+Lpb+TpDw5d/bSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu1Dh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1Imj/sV1DwhSGo9xjr0T4o5XOn4ViEgUH7qci8fz4+A9opv/MQTjLpr24b+P1s2q
 NC2GyU87BNCwnboSj779/UEzl3i0uduxMZ4K4upk0adbFbRK5arIQZ8k8QOowHBjjG5IcuF/
 QrJN3A5cxRbUiRYxnizyhSKeSXLzYO9yq9Mw0/UpT/6UkToJk59TpX+CUnpAZCyHpnIKM0oN
 gtMcxT5fhzp4EtHORA7dw6ML6K41r2MGTx2VKpUCba/Z48SgbwQr7Mkf4IDbKRCdY1JKVbou
 W3bLofjx9qR37T
X-IronPort-AV: E=Sophos;i="5.87,181,1631592000"; 
   d="scan'208";a="56055495"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdsUl+cwR9poEKUfJjIF1P2Rw11wB7i1Tegp+bL61T4GtUPa3ySfWF4I8AmKrXJHZBKPv37rEhgNDmEfvXmhaMfQrL8XWLyTGQ1WKf0zdixXpP9Hfy23FetCzSCFd/jZPkbSQVOtpSpBuPX1PdqTEMPQ7obM/a9Qg+Hwx01JdHUCLQdhORXHkUZvz9rIT1i96ABoCBuNPQU0MWfnJeJUmH7Kwfg/qaCQZphlY/gYQTD7eZn3aEmw6CCScznxr9v/lDHYWgylubsCn8Lj4KdnOi8XX7DLhp9YXoNrfgEoZ3cNGcg5eblPQ+0g9R52kFTT7VG2IWG1fdFYUeiCszqFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/nM33d6voo4983foIZGmSycJc72zb3kex2wyvJoWMY=;
 b=TcweYxmwqp0UD5nKIxg2utsq/jq/6TdPqKCgKhqCe3Z/D3OZKBsaIjIhyZ+oIaL9yaa8wx11H0wxxsGCiyQ7KpUAg8xbagbXUfqcV93siA/evLHRAtnc57YSvFBn1kilf6aohdDdrzj2/zwzuFyj/W9NAjbDp5jeUiWjJkw3fYjqxdkUsMYsdpyLsOSvgSdPIWmAF5iOZjl/KrVTLR+LyQ5rQdXlLJ1gUdjRRfuO/0oMJRvVK8KkfbH+O1f2ceD3Wq/m6HvcVLiJzD72ysQ86Rm/VgMiQSKT6iI51e6tPCqzeIpmHpGf+qzyMbv2uHCGLNL4eSQf8TLg4s1PjjgbWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/nM33d6voo4983foIZGmSycJc72zb3kex2wyvJoWMY=;
 b=Wgf/ub7ba5TJiZ6xmlr+a/PATk+f59mHgvTlF4vLOCeMMJchmP5DTyxCck+APDQuZofw1jRJjN0BeoYXeJe4CWVlMKUcJ/OW2LOVHbQ0NP57ZBrHqi6RSl9LjqqjgX1ZP3MoWzfjrVWlr7BiBTgBs4lu/TOn3wOkSD2ThCkCB94=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <9963c7a2-f880-66fc-8f12-b1ddd0619c91@suse.com>
 <da80b8dd-177c-d27a-9a00-c9538a139d37@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [REGRESSION] [PATCH 1/2] x86/hpet: Use another crystalball to
 evaluate HPET usability
Message-ID: <68352fc1-9ba0-1081-be50-065b212f96a3@citrix.com>
Date: Mon, 25 Oct 2021 23:53:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <da80b8dd-177c-d27a-9a00-c9538a139d37@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0252.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 092f959e-80c8-40d8-4681-08d9980a37ec
X-MS-TrafficTypeDiagnostic: BY5PR03MB5249:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5249D7784BFF5B433D1A373FBA839@BY5PR03MB5249.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JxzOoOexOI11scwwz88CiALa35e8JHCASysdwf+8X7KtZEKdKF0QRPOSvfWnk3//Pxs89nQM+pygOcrhwQhvAgDIK+LzP2RYdAJuFsDs6u33hZgSCRCos73Iw28ifMR97vqCW1EtO/DkfDtGVdP0lie7jhpEqUB68GuEDQ630ghDTR9xVDmjE6cyzR+ZUUPtvzWuOOFSqXZu4eAWqgiC4xpzwelIK4S68+zSVvvnviK2INs6bRmAJQ6g+ulvJn0UrR0s3KyO5xeKn8E264LW2EgUAbdNRIXxfs3gYm8vUz5U6enqSZy0ka6M+qjHizebFhr5AHoTowIJZ9hqutdfYGw9XZKhbV88Vl+Q9VooZk7kexWTuY8/hoqasF0bDIxLVN0EtNG+/R5YNOlWIcrzLnprKMPqmh4hZdgUyD7VStl+OWobVuXWooeL5ipefA2YlHM2uyQiXs7LFp4Fatm0Ni7kLhj5BjF3EqLGXpPDKjdHTfI47+tB4jFqSW70kPc2YUCdZFxoVF1s4qMbLYjBepTacK2Tju7mrLYcE2bfRxq8Mx6chlGfXGvb79owRbibhYbNRsjTTyrPKobYn5wZgP3CDviIEZO+F12rVXZSvy5f5aPaKeO/q0789j213RNHVGmKmxAAYDNkigKJ8O7nUeMYcvNE4fL0/oSzfVZS7QJihgtM+4BN3VAzhVd/Vlq00D5jk/rUp5Ow3zSouLUR9SF9YqZ4JGKN5GMfJoOLe+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(6666004)(54906003)(110136005)(186003)(31686004)(82960400001)(38100700002)(66946007)(83380400001)(86362001)(66556008)(66476007)(5660300002)(8936002)(316002)(2616005)(6486002)(2906002)(8676002)(26005)(36756003)(4326008)(508600001)(956004)(53546011)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFZkclhEMnhJNVpjK1RpQ1hEb1VsYkxBWG5BaEdudExNUjg0RnZ2cFl5a3FZ?=
 =?utf-8?B?RXFiSURMaUJOV05zNkNnczM4T1RMN1UxZTJVNnMwMVl3SmExcWhmRWFMVFli?=
 =?utf-8?B?eG1rbGRGTExjNHVVWVVxZVJ5N3dVWGUrVWM3MnRNY1drcWRCdXVvYUZwR2R2?=
 =?utf-8?B?TGJ3ZC8zZW81anVyalJzdVZGUVVYZ2JlWnNPMC8wWGlBZklpakZSKys2M1kz?=
 =?utf-8?B?MzU4YnFTQ05mTklVSG5nTzc4NU14azlXUzJZbE90SjlONmdtWGJoT1JHVVFh?=
 =?utf-8?B?QUU0NURqNUwyNmJ1b2pZY3VpU3B1WVFUaldFSVVoTllrL2N6WmxNNzFjL2l4?=
 =?utf-8?B?c09WSm9QK1dQVCtsUkloN0phM2FYMXpXTlNmVkZZRFdsbXhkRUNHUHh1ek1l?=
 =?utf-8?B?VUtMN3BKRkVSUEFFMG00VnErWTFQdm1EejFRL013Y3lpbE5FaUZKTm96QklT?=
 =?utf-8?B?aTBNY3pBYmxYckQ4OGJiWWROWmZXQXN6YythQWl4UXpBZmVFWGVVaTJrbEd2?=
 =?utf-8?B?V3FkRDQxTU8xME9SY2JkVEwwUlFRcUx2TElXcEd4NDZLdUUzUG5QUENGWGo4?=
 =?utf-8?B?VHRLOHVsTFFwejJmR3F3MzlNeHlHNUwzZ0FSbk92bWtCK1hObXM0M2ZuZHRu?=
 =?utf-8?B?K1ZqOWpGSHJLODlUb0dpVVRRR3JFaFE4eXdwVlZGaWkydFcwODRUaTB5S1JS?=
 =?utf-8?B?VGJsakRsa2Y5VmJzbEVVM1JEVVpHelAyNGxLQ0ZaZnZvQ01UbGRscHVXMGUw?=
 =?utf-8?B?aE1xQzRPMXo3Y0RmY0pldC83WDlwNEJKaVRxbndZL2t1YVhxK1N4SnZxTnFl?=
 =?utf-8?B?cEpHekJsVzcrbFlCZkdkbk5FbkdLc2lGNmc3NUpjYXlRcjRzRWpKT0VpaEQx?=
 =?utf-8?B?cVIrMjlHRDNSYklQOThqTGJTdTlWbWMzVlVIUFRGU3FGbythNTAzTzR4dWty?=
 =?utf-8?B?UlREald4NTUwdTNEeXZHc0VNRDVLZEh6M29Od29xY0RXMFM1TlMzZUlMYnZZ?=
 =?utf-8?B?ZmlmWjlvZThUVTA1MUVKS2I2enp1bHU5QVJid09Hb2tzSHVaYTNoM1h1U1hZ?=
 =?utf-8?B?VldyUEdiZDBhMGExODR3a3pUSUtUdjJwQlIxQ016Umhaa0ZiNlJSZ1N1ejNu?=
 =?utf-8?B?b2xLcXBrWjloMDNnRU9DdDFEZVdSMFREVTNzNmhBbU9VVDJYT3l1eEhTcXpo?=
 =?utf-8?B?b3ViK3VyOHNGeFhXcFUzZy9aM3MwYUpJS3E5TnFRVE52VFB6SUVPNDI2Z2Rj?=
 =?utf-8?B?aDQ5VXdTbWhzbyttcEgxRmRIR0pUWVhQV0VYbjZ6UTZEWHJFd0lHQkQ0SG1r?=
 =?utf-8?B?dGpGNFBERFBRcDlZb09uMTJJRmY3dStuZjlJWXJlUnVMUEZGZjZkVU5SYVlB?=
 =?utf-8?B?QTkrRjZOMGNyNm9kWGV0dmIxRGZUWEtrVldBaHVudXJFeWcwTE5pdjZpNEdp?=
 =?utf-8?B?aFhIRlpDQ0NmeHRWdUtWRjUzaUdENmE3K0xSYlZTSFZKRU9Td2dZSzdEZSs3?=
 =?utf-8?B?RlVPOExReGx1enFaQmU1aWdPeGNnRUVJVHNzMG1icThXMnRJckpMUnpveUgr?=
 =?utf-8?B?bjlFM0FaNHRJVWRYY1BrY3NyMnBvWmRXdVJiZEpMZEVaK0RFTkc0Nmg1c3RB?=
 =?utf-8?B?NytNNzhQODhFMUp6aHdneUxjY3luMXJKbDZaK0JzSU5udE1mcmhWYlZGSFQ0?=
 =?utf-8?B?UWJhYkloZjFSS1kwWE9lc0xEWXRtSXNoQlNORGlmazArK3A4blJLT0wvT1NE?=
 =?utf-8?B?NkJKTDY0MjRpYU5UMURmUmh2SGFPcm1Ebk5iY2pZNU5rWVVpU1JGZmJCMVQ4?=
 =?utf-8?B?Z21GTFRVQWh3Um51SzNGcWQzdWlqQ0FkQ3BDZ2pSNFQvTXFBTEh1dGhkaVlF?=
 =?utf-8?B?d2lnOXFjbHUrc3B2K2ZFNjFMbXRqd0JjZjhHQ0IyRzkvYm5nZGNDT1FnTXEv?=
 =?utf-8?B?Y3hLd0grSitLZ0RvK2JBMWxaZjRCN1lDWGtpT1RSUGpzSnNMTUVYWFMwR2gw?=
 =?utf-8?B?QlNrSjNIaUpDd3J5eUNwY3d4b0JFQjYwMHhTUGNZWUZ0Q1NZWHFma1lyVGhV?=
 =?utf-8?B?bHV2WEFPdjhhdFhhVFd1ZExGRE9ZNXFlRnl3UCtsNE5JK1d4OHhkUWdCMTNN?=
 =?utf-8?B?M2hWTkdGTU1lWHRzQ0c0bTVlTW1qWVBGZUtQbzRMSWs3N01xUHQ4elRoYmVU?=
 =?utf-8?B?cXdyNjlxWlRCNTQ4c3pBMEdkVGhEWDJYc2Rsb3JLYlhXUjFPQ3V6TGdmbFJr?=
 =?utf-8?B?NnE0dXZiSkV4bWhLV2RISkZJVjdBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 092f959e-80c8-40d8-4681-08d9980a37ec
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 22:53:10.7530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCilYuy7K0pQYTvz1CTg5J+dHSfYQx3cQpCpA7OE4kSQf/cuFQ5quUTjR9eaBRwuI71MkjKVwW3mV4Mo+4Om+D3WnCPpl23Z27j99CIlO8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5249
X-OriginatorOrg: citrix.com

On 19/10/2021 08:07, Jan Beulich wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
>
> On recent Intel systems the HPET stops working when the system reaches PC=
10
> idle state.
>
> The approach of adding PCI ids to the early quirks to disable HPET on
> these systems is a whack a mole game which makes no sense.
>
> Check for PC10 instead and force disable HPET if supported. The check is
> overbroad as it does not take ACPI, mwait-idle enablement and command
> line parameters into account. That's fine as long as there is at least
> PMTIMER available to calibrate the TSC frequency. The decision can be
> overruled by adding "clocksource=3Dhpet" on the Xen command line.
>
> Remove the related PCI quirks for affected Coffee Lake systems as they
> are not longer required. That should also cover all other systems, i.e.
> Ice Lake, Tiger Lake, and newer generations, which are most likely
> affected by this as well.
>
> Fixes: Yet another hardware trainwreck
> Reported-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> [Linux commit: 6e3cd95234dc1eda488f4f487c281bac8fef4d9b]
>
> I have to admit that the purpose of checking CPUID5_ECX_INTERRUPT_BREAK
> is unclear to me, but I didn't want to diverge in technical aspects from
> the Linux commit.
>
> In mwait_pc10_supported(), besides some cosmetic adjustments, avoid UB
> from shifting left a signed 4-bit constant by 28 bits.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This breaks booting on recent Intel platforms.

Ian: Complete blocker for the release.

~Andrew


