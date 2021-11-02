Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035DB442C1A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 12:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220050.381141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrZZ-00034z-8I; Tue, 02 Nov 2021 11:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220050.381141; Tue, 02 Nov 2021 11:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrZZ-00032S-53; Tue, 02 Nov 2021 11:03:21 +0000
Received: by outflank-mailman (input) for mailman id 220050;
 Tue, 02 Nov 2021 11:03:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XxgO=PV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mhrZX-00032M-HT
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 11:03:19 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45efc50d-2d50-4fc6-a553-5ab406fe1401;
 Tue, 02 Nov 2021 11:03:18 +0000 (UTC)
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
X-Inumbo-ID: 45efc50d-2d50-4fc6-a553-5ab406fe1401
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635850997;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=n0v4QEQNKdYIyHdcZW1RsLNpuK7tRYtglqXe1lx19/0=;
  b=Ymdv9LanuQBp/DUNe/D6TrhowK9gbCjQbl5AjGNEqyvTmXYtHnU5OzaE
   uY5+Hu6V8LElba8HKsWYfR/hM7kdMV8ranZgVmLNQpE+oXzqrtXaRu3vP
   /KynNIrguCueQul10MK2/mC28ScmR5jX/Xx1jKUYaNzC0bH5/UvIyX84S
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Hv/L4ZfG7Yv+m34r6NrKRvQUrkg/QS5Lj0cSIsk6Vqe/qHkcFKDHTjVkLA+L6tVrKj2fMNlB+Y
 S1cvtQ54HankoLbFguZi808BKM7GYi2r0rCEShqZNkGW3kkC3PoKm9J2iR68XKGAddhbGj30Uk
 7rYl0pKwsEEiEzgZShlKpAFJVSBkMe4gF4/dnZ4FtCx4ur75mzDRYWm1KQzjuz4gQi7fF8MIoc
 w0R0OeZOAuLoVPmj5i1uYW/2P+Fpe4agYauNHxzAABLuy+jHNtz1/j/irtp8YDELigyH8ADTUR
 1W4XT5jQ03KyGzmhaNz93SnK
X-SBRS: 5.1
X-MesageID: 57256312
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6Jx6qq8HwERRnWkF5TKfDrUDbXmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 GEZUW2FbvjbYWTxetB3Pt+08UgCusSEnIIyTlBvqiA8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdh2NYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh8+
 fwUjZPhZT5yEfTIgNs+UkFeDSxhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFg21t2JsXR54yY
 eI2RWU3MT/dbCdzMwYHVowEpqC1piPwJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tl6Ru
 2bu72n/RBYAO7S3yzCI73atje/nhj7gVcQZE7jQ3u5nhhify3IeDDUSVECnur+ph0imQdVdJ
 kcIvC00osAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+lx5v9uj6WV0Q9FREYbMQZl85uQyIny
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 2nS9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocNbxorqp5
 iFsdy2iAAYmV8jleMulG71lIV1Rz6zZWAAweHY2d3Xbyxyj+mS4Yadb6yxkKUFiP64sIGGyP
 RCC41sOvsUKYBNGiJObharrUqzGKoC7TbzYug38NIISMvCdiifepEmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNEiU5GHeegvp6pdynnpW7TqKHfjTlk37uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 r6zwePRkE4BOAA/CwGKmbMuwacidCNmWMup95QPHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu0NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:W4OWx6B3NdS6Ew/lHegwsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHPlOkPUs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QDJSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IWuvEuFDzsaEJ2Ihz0JezpzeXcGPTWua6BJc6
 Z1saF81kSdkDksH4mGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 f4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRoXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqqneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpj1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfYDhDc5tABGnhk3izyxSKITGZAV2Iv7GeDlNhiWt6UkUoJgjpHFog/D2nR87hdsAotd/lq
 L5259T5cRzp/ktHNRA7dc6MLmK41P2MGbx2UKpUB/a/fI8SjjwQ6Ce2sRD2AjtQu1Q8KcP
X-IronPort-AV: E=Sophos;i="5.87,202,1631592000"; 
   d="scan'208";a="57256312"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDUqKlvWUMDO98TooSlsoLNYhoTMQiWfYh/i+rT1+RE0ky4nt9KmuueiKejUYwD3BnC1aqBS/G9jHf6kkNGrlFWm7JUgjlAA9vaBN9pbHY0q2W8+wlsg00tHBMS3nusQxGSuEOqZxxcQG+bMRnt6mlLSSfxw1JvHKW++St/EOQreSDcuvsThLJuzDKIo/nTIiYWmps1O//8PQgi1aH2azsTQ/EEnMLwMyICUU5X/Gu+qwFu/AikpBY3NOI29xixPR/A4usaQzHPbh2nP5kjJLilDVov+8lZc1y60S4Nwn/IlqDAfIayuy2wlfoJ7l9/KoTHhmcd60ET2ut6VPx0KDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wB2TYvJTVIrRzT9/IGWTICwyTVqjUW4WAYZ9tFQpO7c=;
 b=nSQpWhHj0phxR4ax6iwmvFFZNUgQZOMJ6BOv/NAu7425GT25/CILxb/c5Lp+/TrHC44NIDlu5LypYS+XXmDPSSjmnh6UoCDHxKaeOkFScnNafN82OV6pGi872nKJ0kNMmYG++WWk/XWlcv/K/bBQjiKC/nuFZ0B+z9YZ+E8vI8XGVORXL57ZoRl2UqeMZa1cmRG05QPLYf5kCzUOeSfNzrYnkZJEMBfd4a34AnqJkVgsP1KtOs8eR2O1nV4bKsOHomQ+M2/+NRrBDiNArhmshctWIulE+SP58Ec6vPdrCS87LDnALuaIDPjZ8LK0dI5Gs5m2CEu+78UtdUT+wAzqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wB2TYvJTVIrRzT9/IGWTICwyTVqjUW4WAYZ9tFQpO7c=;
 b=QmG5n9zT6RcSZUjWZ1DV166lQw53hprjbJyD1VqQ9I8TbF73iiWF9BmZb7EJD++9dU80W81r7vpZUkBznA63sXaDG3ruz/ujmV9pScCycSEL0GUy8PgxrDf/i8o4CTofgRrJGCuJWp0dBbrzLW8J0ESTVONEcwvQZBOcXiA9D6Q=
Date: Tue, 2 Nov 2021 12:03:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: Re: [PATCH v2 3/3] AMD/IOMMU: iommu_enable vs iommu_intremap
Message-ID: <YYEa6HQGR1cHJBw/@Air-de-Roger>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <ff7b68b2-5bba-2927-e3f0-f3062862c466@suse.com>
 <YXaGxX3J1aB39mSG@MacBook-Air-de-Roger.local>
 <dd2929fc-dc1a-1c16-5954-6894766d9dda@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd2929fc-dc1a-1c16-5954-6894766d9dda@suse.com>
X-ClientProxiedBy: MR2P264CA0165.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2beba23-d351-40c2-c039-08d99df05bd8
X-MS-TrafficTypeDiagnostic: DM5PR03MB3065:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3065604FA41DDF18847F57F58F8B9@DM5PR03MB3065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LfVSX9iOmvmVthWhSOxK/hkI7UeqPpUgdbVfnnaTQNFfPc05XiWEkNmg2evNANpZIqWSfgS8MhmovVj5dYzaq+Bri/Ym7jEDcBbQBrwbVavDAjBvPsjvN0wdpeFvXtCvqu2Sc3wkJC/k2RDp16h3Ue47FHLRBa3xFG8HKevNv93m7E0RX+TwXmYitPzMw9G4L9o/y92Jck5UeAkMzFHBG4H0PhsBvvw8BdIPoIKA2r9XFSAkuhZrdpZWaNNSmZZ6duboJW7jYnKkczaLIeySZSii9F9v+gGBlH70wvUyn0aZxZRQp4JD0fuUNYSK20WDRyiZYIsvWoPwLXSvpqEpx4oOzRq/go4RmAACcSN7twpfchkPrN8E7w5Hh/Uz/PyOPjzBa4dZeXBe9LRZs0ahb11C3HLXl3IbDUWb0YGXviSpj3LBwa9aW2UXzCWkvcIU6coPqghFrn083VRSj1vdm72jJma1n5bPnaAVti/o7smWkMInGx3wxSBXja7ThRhb8qOkfJT0SvEKBQRW69HjAiEQPC89mWwpFlQGGjbHHvP1dWXcUHT/80TSxfjjHJ/JjSL9bTViixah42dp4yCLK7tBDnCVlCC96s75Qm6C2sWdQQi8CnH2ayljgthwjLrSJoBfJc52WBemZNpDGHr4og==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66946007)(38100700002)(956004)(83380400001)(85182001)(2906002)(8936002)(6486002)(26005)(8676002)(9686003)(186003)(508600001)(4326008)(66556008)(66476007)(82960400001)(53546011)(6666004)(6496006)(54906003)(86362001)(6916009)(5660300002)(33716001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXBCYUE1Wnc4T1dMK0ttRDVVUnZyT3RNcVNsdFVCS2hxVnB4Nk1IeERDMGgr?=
 =?utf-8?B?OGFObzhqbVk1Ukk0ZlJrUnM5U01lNmNLaWZ6dWx1bjIrUmk5emt2aXBHcFVt?=
 =?utf-8?B?YU11R3FwbEVKK2pRWTJUZURoQXJOcSs5dlIvckZIaW84SGVGdWRkSVhPOEdO?=
 =?utf-8?B?cnE5Y3IvNFVIY2FpbkVJMTFONFFhd2NaQUlQYTlvK1IxSTd3U0JlMUlZTnY3?=
 =?utf-8?B?RitwWWlsdVRoc3grR0hBemtBSStwNkRmMzcvVGpCZHR2N0dYWldFa2pBblNV?=
 =?utf-8?B?S0dRYTRIaUJWczVJaDQ2dWYrUjM2THMxbXJKZm9YOHQrbGxwUENOd1dIamc1?=
 =?utf-8?B?dm13cFFrcUNZZkdjRVowalY1L203ZDBPTnBVT3hnVmszY0R6UWJuL1V0SEFW?=
 =?utf-8?B?RWhNaklJbDhwL0lJMWZyNVNSdzRlLytJMHlrdkNWMWRnREtsZUR5OTJTbTFz?=
 =?utf-8?B?bGUwWk5Zd1VwRXZpc05iNmdHNktOSzNDcTZUOE5DcmloVDdtZ3hqN1R1SDhP?=
 =?utf-8?B?dWQ4Mnl4c002UVdTa0JSdGdRTEtKZCtLMk95N05nSmJyVHl0RjFlY0VrYldk?=
 =?utf-8?B?TmoxbHB0dWozVG9TcmVJd2JXS3pUSXdiTEVja3ZLYW04V1N6MWQvRlpLVitW?=
 =?utf-8?B?VjNtN0RPOWp5aHkzRjJBREdZNU9MMlhPK2lCUzZFWS9nUS9VcjJySVJUZlhQ?=
 =?utf-8?B?Wk9PT3lJbko4a1hvNGREN0k4UmdwNHQ0NEkyZkMzNFR4b2g0dGpQdlg2Q0JZ?=
 =?utf-8?B?SHphUnFTcG50T2VoZjExNHBXWlQwYnNyYTc0bk0raDE3NStQYXVYQkRibUlW?=
 =?utf-8?B?eW10cENPSEY0aXFVNXpCNjVXMlpKZnpFQjlCc3VITXBqdEtlbWxiaEIyWEgx?=
 =?utf-8?B?QVUwS1lqcG9vL2NMdllYTHhZT20rT01xTXpLQm5RL2dZNDgvakQ5YjdJa2cz?=
 =?utf-8?B?WXY0bkNwU1llbXQ1S1NFZUxCSU9iaUZaWi9PNFhTTCtUMnNLK09QRVdZL3hB?=
 =?utf-8?B?U3orQmlzemc4c1BkT2lEL2ZaNENvYnVkbTN4VngvSmREZDJNbGQxVkRudjVr?=
 =?utf-8?B?N0lYbC9lZ0Q2bVM1c1BpdS9MOFgrRWgzT0ovbFdLc2FjSFk3ZzdZM1VFYzQ1?=
 =?utf-8?B?bGpUQmVWUWpFa2dGVHFZOE16SnhTcmcrbnJCeWJobE9jYlpNV0Z5USs0Zzhu?=
 =?utf-8?B?dlNCOHpRN1ZGWjZ6a0NZSDYrZnBmK3d2bTNlMy9YWDlXNWJVUk96RDJwZTg0?=
 =?utf-8?B?RE1yd2VxTU5VMm53T3pXd0JzT0VKblE0eVR5ZHVWQnkyNCt3UmlySWNjRi90?=
 =?utf-8?B?VHVqZ0I0WjR5N0ovdExvaGJoZ3Yxbzc4UkNQSG5EeU1GY3c1a1QzTlpJQmhG?=
 =?utf-8?B?b09hL1Rib1VISndvM09NVUpJMjQ4TklXYk16Nk01YmdnUk5kU1hQM1ZRM3JO?=
 =?utf-8?B?VCtra2RQSU91MEJEalZsa1M2cEc5a0RIaVhtd080OU5QSVd5TlNOVEMyQnds?=
 =?utf-8?B?dkVibm54aVkvdzdZL2NqOE5zSjRMZFFxK3VxNHpubm5Ic2lGMHVHbmtYVDE1?=
 =?utf-8?B?Y1R0R2N5RVROY1ZuQmVmSW4xQjgvRlNlS0ZkTVMrckd4bEx5TDU1N01ucVZ3?=
 =?utf-8?B?NDlsM2VTTlJXQXFxSklWNVhUTHZiY1pnM2djRjl4SXdITjB3aHpNOXpNdWM0?=
 =?utf-8?B?SVhITU5rM29CcEZNY0lla1E5WGlEcVBYekcvVy9tUnJmN1l2aWZlRmd0N2F4?=
 =?utf-8?B?YmxPQit0aGp6UnM2TEc3RjJUNDZINUJzRGJ4ckdqbXVsY0JsUnhua25WdGhr?=
 =?utf-8?B?N2hDZkJOL3dIQ1o4SFZCc1lGMWt4UE0rT3hDR3l4ekZpTFNjV1o4SGUwT1JM?=
 =?utf-8?B?SU5YMTVNL2NSb2Z4eTVhTlJ3MlpOR0xkcmZsem0wdnlDYUtTcnJjeTBXWHNz?=
 =?utf-8?B?V3NLck1peVZDdjZDY1ROb01Oam1BdVQ3OWhON0hadEVEZXRuZ1NvQmdVeTlU?=
 =?utf-8?B?bXQyR3BZV3oyU3F4QTBGWkVJaVlyYU1KNzJMTXpVUHViellOeEJkZnMzcVhU?=
 =?utf-8?B?aUdmbEIzaUFaa3JIM1FUQ08rdWE0NjNTanB6T3RqcXVXS2xrZjN3OXRYelIz?=
 =?utf-8?B?SzY2ZVhqdmxRSDNmZ2ZjclVTUTJjK3kyeUZJNjRMc3l4d3NlREo3L1F0R0pU?=
 =?utf-8?Q?35eehFFf+hmW1vNt8bDXaWY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2beba23-d351-40c2-c039-08d99df05bd8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 11:03:10.9344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mYaajKKUNSarMkVycFVx36GFXLFq/cZOWz+iZgfz13hJGru/DJcAt9q4JHaf37wcVSi5HzSqzdxNfcDeY1M8RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3065
X-OriginatorOrg: citrix.com

On Tue, Nov 02, 2021 at 11:13:08AM +0100, Jan Beulich wrote:
> On 25.10.2021 12:28, Roger Pau Monné wrote:
> > On Thu, Oct 21, 2021 at 11:59:02AM +0200, Jan Beulich wrote:
> >> The two are really meant to be independent settings; iov_supports_xt()
> >> using || instead of && was simply wrong. The corrected check is,
> >> however, redundant, just like the (correct) one in iov_detect(): These
> >> hook functions are unreachable without acpi_ivrs_init() installing the
> >> iommu_init_ops pointer, which it does only upon success. (Unlike for
> >> VT-d there is no late clearing of iommu_enable due to quirks, and any
> >> possible clearing of iommu_intremap happens only after iov_supports_xt()
> >> has run.)
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> In fact in iov_detect() it could be iommu_enable alone which gets
> >> checked, but this felt overly aggressive to me. Instead I'm getting the
> >> impression that the function may wrongly not get called when "iommu=off"
> >> but interrupt remapping is in use: We'd not get the interrupt handler
> >> installed, and hence interrupt remapping related events would never get
> >> reported. (Same on VT-d, FTAOD.)
> > 
> > I've spend a non-trivial amount of time looking into this before
> > reading this note. AFAICT you could set iommu=off and still get x2APIC
> > enabled and relying on interrupt remapping.
> 
> Right, contrary to ...
> 
> >> For iov_supports_xt() the question is whether, like VT-d's
> >> intel_iommu_supports_eim(), it shouldn't rather check iommu_intremap
> >> alone (in which case it would need to remain a check rather than getting
> >> converted to ASSERT()).
> > 
> > Hm, no, I don't think so. I think iommu_enable should take precedence
> > over iommu_intremap, and having iommu_enable == false should force
> > interrupt remapping to be reported as disabled. Note that disabling it
> > in iommu_setup is too late, as the APIC initialization will have
> > already taken place.
> > 
> > It's my reading of the command line parameter documentation that
> > setting iommu=off should disable all usage of the IOMMU, and that
> > includes the interrupt remapping support (ie: a user should not need
> > to set iommu=off,no-intremap)
> 
> ... that documentation. But I think it's the documentation that
> wants fixing, such that iommu=off really only control DMA remap.

IMO I think it's confusing to have sub-options that could be enabled
when you set the global one to off. I would expect `iommu=off` to
disable all the iommu related options, and I think it's fair for
people to expect that behavior.

I'm unsure whether it's fair to change the documentation now, we
should instead fix the code, so that people using `iommu=off` get the
expected behavior. Then we would likely need to introduce a way to
disable just dma remapping (dmaremap, similar to intremap). That
would make a much better and saner interface IMO.

Thanks, Roger.

