Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E19C512F64
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 11:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316328.535222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0JW-0008C2-Q7; Thu, 28 Apr 2022 09:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316328.535222; Thu, 28 Apr 2022 09:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nk0JW-000899-Lz; Thu, 28 Apr 2022 09:19:54 +0000
Received: by outflank-mailman (input) for mailman id 316328;
 Thu, 28 Apr 2022 09:19:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/gZ=VG=citrix.com=prvs=110729f0c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nk0JV-000893-2C
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 09:19:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aaad1cf-c6d4-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 11:19:51 +0200 (CEST)
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 05:19:49 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO1PR03MB5810.namprd03.prod.outlook.com (2603:10b6:303:6c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Thu, 28 Apr
 2022 09:19:43 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.023; Thu, 28 Apr 2022
 09:19:43 +0000
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
X-Inumbo-ID: 5aaad1cf-c6d4-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651137591;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=on4u9PRmHuS6Cy2xkS3WAd4APyM/vnkSOu4pUPJoIDU=;
  b=bfZd83b8hSmejvDeo7VmkOnN6xt+zM9ldwvQamMILCqedvhzcJWp8J76
   Mq+WgMo8a5RucOjgFdnqlQmK1X4zdcrANbPqC98PAgobAeRODNpQ+WsuR
   OoFT5SvCGdUMRLA3PEOTFnWaAU5RiSIYnxuDQC7ZyHvFYa5x21zp5gOYg
   0=;
X-IronPort-RemoteIP: 104.47.70.106
X-IronPort-MID: 70002187
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BHJ2Baq3ke7rcN+yQu/VXa6cNdBeBmJsZBIvgKrLsJaIsI4StFCzt
 garIBmDMq3eZ2ryfdB2PIm3pkhU7ZOAxoNgTwJv+ChhEiMSp5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 4Oq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBB4nOvc8PayVjLThXMpdBv6Hlf1XmmJnGp6HGWyOEL/RGKmgTZNVd0MAoRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkHhHFp3p4m8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK/fJvuTGDk2Sd1pDUK8iSVYWgTv55xB3I+
 knernXEGSoFYYn3JT2ttyjEavX0tTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3C
 WYZ5y4vpqga71GwQ5/2WBjQiGGAlg4RXZxXCeJS1e2W4q/d4gLcDG5bSDdEMYQirJVvHWJs0
 UKVldT0AzApqKeSVX+W6raTq3W1JDQRKmgBIyQDSGPp/uXenW36tTqXJv4LLUJ/poed9e3Yq
 9xSkBUDug==
IronPort-HdrOrdr: A9a23:niXbvqP8KKUcWsBcT1P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 Dsr/Zvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolSs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4RE4GqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUITwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJunfwivZv20voz6hNOqWs19
 60TJiAq4s+PvP+TZgNc9vpEvHHfFAkf3r3QRGvCGWiMp07EFTwjLOyyIkJxYiRCe41Jd0J6d
 78bG8=
X-IronPort-AV: E=Sophos;i="5.90,295,1643691600"; 
   d="scan'208";a="70002187"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g52pR5Nhw6mlLJ4VIEVIBbeUsdKX3waWsLBTbgy+wd7TKHX8RpSkP+r7gsF5kUzgnNSXyFO3R6IGDPTWbc6aL70nKiudfn/JonjHGEf7Xb3CetRwUD1UPz8MttfAgaTDF0x7yyn+JmHxZMBmGqWzmxa71vK1zP5YtFQaOJKFtfxpQrKPOhzVc4BO1Z5SNybbIYdwV5tTs9QgX+RGK5O4DGI0uq++qUqu8SMtw79BWaA+ITel07L8s7LlwwmceE3nNTRcDChUBWgiDOLHBz+EacO4OCGP7F05Sl56o8cCoiBK10d6YF3LWS0X2YAgOz3PzSUBR5/FCwCLSbxciSuNKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiubOYqk7kvuPVAlc3nTOPMPjLmvCQko52ntTUwl2Gw=;
 b=Fg1HFHh4w0dvdy5a5rwlQ1vwAG63wk8C9+gKhI2/l/TvtxIPxy6gT7jCrZ10iiPp8zaQId+Gb5kH4Q3ByGtBDTnMMC7Essd89J6nAejbnC52xDJVSrlWTz1L5pU3/NLDt+zpFCMCjfuFBU68lSvPhEkt7DQydN6eFaYPo+iQtF1L7/0MQXVnE1YnFaOu2ZMZys9Quir02xTggrwYKqujl8hYoRV2KFgkah0HAYYdSi6XVmQhOWtTthtXg6h4qtiuZVH/302CbUL+FQN7FVLS4eoXAU4kfiKzZjo6JpeCTknIQYafdATJoX2MlEpgWqDEyXTD7FQRF0xJrRfcOE/oeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiubOYqk7kvuPVAlc3nTOPMPjLmvCQko52ntTUwl2Gw=;
 b=lZ01VX7+an4j7AGmH2dEzhY9wlC10iaZ2gojvf+eXRKHdKMUdF2XAwWB901HIkPIpdcmhMHfN5DAqQiBb3APNPdwj9/9I0uVzmyM2FlaQqY1pi6clFuoOsK1dcpAeFPR9GimmWGv71HWc2Jx7qz5TOnC57oucMW3f4s8XSTWBOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Apr 2022 11:19:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cet: Support cet=<bool> on the command line
Message-ID: <YmpcKmecShU2Mokz@Air-de-Roger>
References: <20220428085209.15327-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220428085209.15327-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR1P264CA0123.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77a8c88d-a405-4bf6-d95f-08da28f83ae8
X-MS-TrafficTypeDiagnostic: CO1PR03MB5810:EE_
X-Microsoft-Antispam-PRVS:
	<CO1PR03MB58101EF4311CC23A9F6AA1408FFD9@CO1PR03MB5810.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F3ejNIThrnJn6RB815EPN1PFarDbFXDf5IAz/nC3WEOFv+9bvLnrCe3IO3hi0AKPQycqGGlgXBXNRx+i+pzs3pHaDnkew+D5sBIwUF8TjnEzFnz9uLb43iDnMIfB8VzGQQQ/pnnvjNWkLeHLuHUlJfDB1C1PyHMdQFVk8ICTtwy7ZH2Xn8aLxYBpCz2hI1fhFLS8ghzctQHFnGy7gKlZTS9ROtlOkYXQDc1zviK8Rn3iYnfEJaBmlF04r9RhoqSn7a4xbKhcbwCV040X0zBuytpRyD+oS6PBFx3rmreshDdyKD4oqG3EA9CTe6c8vtuEGOAQKxTr2CdLJMr/+/bNvhdUfYS6iWK0mmZLJKMAT1lg0tf9zHzeZ5azm07W+SSuKfC6yJEYdRJQVAerA/1RqKBiyoCOnR5ZADSGSF9y77DYd8vAXTRIe3UyJJP5bnSGzVz84Zvy7E+XmV7cPYmA4XVEipXlO99j3KCvCA39XO61e0zgJ/l6h5bZ/ySdJGKwbq9sn1NZA06VFSMLJ6OHtv6TKdwZ40j+rkJdDjfLEZomsdyEtMxSVxizZ5krikbB/5uylmYDgDxCQ6Qrh+u8zWKiDRBcYzrd3OjbE7Ldbar1R4AJLybC3eWny+PrD3YFn+vzEAXU68QrLq3RKUC/HQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6486002)(5660300002)(66476007)(508600001)(66556008)(66946007)(8936002)(4326008)(8676002)(86362001)(9686003)(6512007)(54906003)(26005)(186003)(6862004)(82960400001)(2906002)(38100700002)(4744005)(6666004)(33716001)(6506007)(316002)(6636002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3lFL29xUlJHWk5aK2Z6UWpzNGFOeGpMd0NlRXZQVUxBSFM2WEtMUURzUjNk?=
 =?utf-8?B?cDh0QWJpWndCZUJOZ1lkU3d2OEowTmxHc2RYOUtseWtLNjYvd3BxSUlUVHFp?=
 =?utf-8?B?blNJVndYdWViMkZXMnJrZ0VOeTNlb3J0Qnp3U3ZHa3JqNUJhNmlnMk1kM0RZ?=
 =?utf-8?B?RGtFS0QrMVlhUURxUmEvV21yeTBkNFV0eEUwajdXelpuckF3TFpvYno1ZThx?=
 =?utf-8?B?RVRYVmluZ0pIZ21qaExsNFU2OXNTRkJmYmxaaE42Skkwb3EzVlI2dFYxbldt?=
 =?utf-8?B?dEN5bkNqN3M4RHJCWjNReWNNcDJPMzd2WVJLanFaY0pOS2ZrK2xaUmdmeVRu?=
 =?utf-8?B?dVBtc013NGhjZVFoZVpEQ0txODRncUFvTWVjbG1SZVl6eUk1aHVaUlM5Qkxa?=
 =?utf-8?B?S1FoVzZrTXViZFh5QnQ5UEVIN0ljUmFrVm9ncy80WldKT294Zk5BSGZESzla?=
 =?utf-8?B?RHgzUmJzRlB6QlJONkZZSTZFRFc3WHkrTUpEYTJaV3NRSERXOWMyNHlHRWVJ?=
 =?utf-8?B?bFRVVGxLV0I4a0pGaWNScXBnZjg1RWUxaXYrMjNvSGtvelI4NEZlQVNKSUNt?=
 =?utf-8?B?NUt5MTlZZWwwdXQvOW4vWVZ6OCtVQlptTmtETDJxZVhEWWVMYktxeHF3VDB0?=
 =?utf-8?B?cUxib29zd2IvdGJkSFg2OWpwZDRjRXFNdVBJZksyWWlRd0M2aVdkeCtOOWU2?=
 =?utf-8?B?NjcrOUxpVm0zcTIxUDNlZS9uR2JYeTZLd0YrcXE4dG82cEQxNTNJNUlBQ0tl?=
 =?utf-8?B?eGJ4VFpUSE9USEZ4cS9sZGNoMyt4M2lXblh6WE5Qd1QvajJLbzVlTGMwL1Nj?=
 =?utf-8?B?QnkyN0RUTGhvRzVvMlArazFpck1xOThXZit6TFBlR2NRZkF6UUJ6VXlac3oz?=
 =?utf-8?B?bHkxQlZmeHVDZy9sRHp3WmJ5ckF6U3FWUllFM3ZmcjhmQVd4YS9sbFNwOHRQ?=
 =?utf-8?B?by8zUTFqdFlWbVg2R1IydGRyY0k2UmxldTFtSlN6N21QMGI3c2x5cUI5dkd4?=
 =?utf-8?B?UGhJZmVsZTJ5djBuWUFESW1qR0Q1M1NkWVhHRHZZQ2EwVjYrWmcxOS9kYTNS?=
 =?utf-8?B?QVIrWjNTWTZXamhUdERSOElWaU9jTEZZdFQ4SkpDeEMyWGJRakltYSs4QVBC?=
 =?utf-8?B?NU1DY2FjRitBL05zaWpBNnFwR0ZUUUNJTFg2Qkh3SXU4NFRBVjFBQU5pZ2x3?=
 =?utf-8?B?ZnpRbmJMTVRzTG00Qzljd3YrY2lKMFpYOTBtV0NHc0ZwMDdwOHBRSFVNcGRK?=
 =?utf-8?B?MjhTR0VDZ0orZCtZNktjRW84RHR3aUwvNmZDWGgzcjViU1ZSd2laLzhFSTJj?=
 =?utf-8?B?Wm5LcEI2R0YwSlFESml0MEF3bGJhRDJIMzA3OEVBdGJrRUtweDBwU0Nhb1Bh?=
 =?utf-8?B?QVVTVWIzd3YvZlRJVkxLeWFpNDV3RVdtcjZXQXgzaWtOZGQvN1ZjM3RmQ1Ay?=
 =?utf-8?B?MmtUamk5UjFNQzBwMG5hZi9vaGtKNWNJVE9rckN6V2J3aC85ZmFrSGxuZllS?=
 =?utf-8?B?d2F4SkVGc2NFbTJZbTNoVElUeStIMlZaREFkT0FMNFhLR0RML05Eb1NMQVZy?=
 =?utf-8?B?TFhXci81NmlqVjQxNzFwT2ZteHgyZCtJS2hmY3lUN2pjOHVla3NwbnRaNUho?=
 =?utf-8?B?SkU2VFZiY24yVzdXSTNKU3p2bDFST2swZmw5WHExMU1pMDNLeSt1VDVXUUtW?=
 =?utf-8?B?bzV5Y1dPSEw5RlZScDZ0QmFCb3BjL1VsbmxpbjlsRHJGR1hvaGg1eWNEd1I1?=
 =?utf-8?B?M1lGeE50K3dOMXFNQnB0Zk5jTHRraHZRWUFVQzYvSWx5cXdpbXlGY3RaZUl0?=
 =?utf-8?B?bm03UVQrUUVUNEdXb085ZVZISmswOFdFTVFqVjJ5VjFxcWovNDlSSXZzSyt6?=
 =?utf-8?B?QzM3bmsvRWhTdXFMQXBYQ3FGdUEzcHNkZ1NqQ0h6ajNkUFZvL01GSWhTSW9M?=
 =?utf-8?B?ZFVLZVlFaW9xbUdVQWUwcjdpMlNjZjlMTW11K1hOdk9EYnYveGVEL0VHaVRK?=
 =?utf-8?B?ZTJyZHV4cVFZYVpFRk9KTDhzbmlISzRISzFNcUFoTkhRSDErVlhGYzdDZDkv?=
 =?utf-8?B?YmU5R29HV09LOFM4b1FqOWYvMFFadzkyeHlNQWF2ZmhFeGYrOXJMdUJQZmdo?=
 =?utf-8?B?U2t2WkYyOEMvdTdPV3lSeW5JOG5WUXNOaVZOVjR1aUplZ2RobllmYTh6MVVD?=
 =?utf-8?B?OHV3Tlp4dkdBeGZlSUVyRTRDOWdOcXhuWmhFblhzSk8yVWZSWGFiRDlLMTBI?=
 =?utf-8?B?cTl3TXNQNUdwdm1kZjNGUjdZZ0RTTHFERVVaTlQ5VzdaSmVKanpnYnFKNFBv?=
 =?utf-8?B?RXhrcFRuYnVRL3hBWWVhUWY3Z1JzOUt1QXk0cUF5a3V2dHJJN2tRZkxMMFh3?=
 =?utf-8?Q?IS2/kBySmUIW892I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a8c88d-a405-4bf6-d95f-08da28f83ae8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 09:19:43.2779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /M3Y1xV3og7XYvKB+ES3vjkqCRUNl4hQEwato7Lmfx95t8dK5632Evrd82CiaQ0C2fEbJjrk3sUG7yPHWO2wTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5810

On Thu, Apr 28, 2022 at 09:52:09AM +0100, Andrew Cooper wrote:
> ... as a shorthand for setting both suboptions at once.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

From the implementation below we would support settings like:

cet=true,shstk=false

Which I think it's indented?  Have a global default for all options,
set some to a different value.

Thanks, Roger.

