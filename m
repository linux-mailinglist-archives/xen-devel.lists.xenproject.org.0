Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B52414A08
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 15:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192728.343321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1sq-0005mK-7l; Wed, 22 Sep 2021 13:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192728.343321; Wed, 22 Sep 2021 13:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT1sq-0005kX-4i; Wed, 22 Sep 2021 13:01:56 +0000
Received: by outflank-mailman (input) for mailman id 192728;
 Wed, 22 Sep 2021 13:01:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mT1so-0005kR-Mk
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 13:01:54 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17850593-07be-400a-b6c8-bf6b295a3416;
 Wed, 22 Sep 2021 13:01:53 +0000 (UTC)
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
X-Inumbo-ID: 17850593-07be-400a-b6c8-bf6b295a3416
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632315713;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wbr1yFmtnXrXEa+6CzVRRRNX4v99308qxAdwiIpTihA=;
  b=WMMogbv/qhHLJ/UYmnCZ1HFBzUMiXlpzPIUwTeT52oL2B2HUuy0EITn/
   UiCiYRweU1ZG8X2qXXgKSW6LfH+tOpUn3zuHaLXG46v/4TnuKeWnQw77Q
   e0gW321/codSOHI+3lgQnXaA4ujG4K3MI7Iy35/WAykGf/+ixxufuWX6v
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: CibKTBJh2q92zDOWJ0QCV1QRrDNrz+EichNnrRxIYJyMsFVJd4fSEwXo3zIUR4vQprMgjX6xvG
 IjmO3tSq50Gc+k+ua8k0g6VBOrI33i7Qm2NWDu4kP4bz6eNmrUEgqoNW4+4Rq8MLv+UG9sa5Ri
 TovKT7wSnXbeNxo1SsqPmsJrMbSV2wfYkH4HnrFxVzpUeJhvHJxH2f2Rdz1eBN+ArGDMaE5g8a
 aLiMRhfwCwPdTTxfO8CSIHht1DFvUyj0ZWFwSK40xeH433XtSntDBP/EhBfEiuBauaAEqt85vS
 wDIfZrd8DYirEYIMMStAeBDa
X-SBRS: 5.1
X-MesageID: 55120723
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4s1196A4C6K0NBVW/xHkw5YqxClBgxIJ4kV8jS/XYbTApD5x0zQGy
 2IdUGmFOa2NZDakKNx/btu1/E0E75eGy99gQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX9w00g7wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/yBakustx6
 ct3mb+7ESgEZ4LGhPtMakwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHviTv4cHhmxYasZmJvDCN
 8giWwdTMBXYUyURI1QqDYIOg7L97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSWRMB9jkue4
 GXc8AzRABsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4UM4XzRqN67TuzyWSXkcpFxFLdMN3jZpjLdA17
 WNlj+8FFBQ27ubPECLDqu/Nxd+hEXNKdj5ZPEfoWSNAuoO68d9p1nojW/4+SPbdszHjJd3nL
 9lmRgAFjrMPhIYg06yh9DgraBr9+8CUEmbZCujRN19JDz+Vhqb+PORECnCBtJ6sybp1qXHb5
 xA5dzC2trxmMH10vHXlrB8x8FSVCxGta2e0vLKSN8N5q2TFF4CLJNgNiN2BGKuZGpldImK4C
 KMikShQ+IVSLBOXgVxfOtnqY/nGOZPITIy/PtiNN4ImSsEoKGevoXE/DWbNjjuFuBV9zskC1
 WKzLJ/E4YAyUv88klJbho41jNcW+8zJ7TmCHcykl0v3j+X2ibz8Ye5tDWZip9sRtcusiA7U7
 8xeJ42NzRBeW/f5eS7Z7cgYKlViEJTxLcmmwyCOXuLccAdgBk87DPrdneEod4B/xvwHnebU5
 HCtHERfzQOn13HALAyLbFFlaa/uAskj/S5qY3R0MAb6wWUnbKau8LwbK8k9c444+bEx1vVzV
 fQEJZmNW6wdVjTd9j0BRpDht4g+Jg+zjAeDMnP9MjgydpJtXSLT/drgcle9/SUCFHPv58A/v
 6ehxkXQRp9aH1ZuC8PfafSOyVKtvCdCxLIuDhWQetQKIRfi6olnLSD1n8QbGcBUJEWR3Cae2
 iaXHQwc+bvHrbgq/YSbnquDtYqoTbdzRxIIA2nB4L+qHiDG5W7/k5RYWeOFcD2BBmP5/KKuO
 bdcw/3maaBVmV9Lt8x3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAlu1DpA+7e
 kOT4d0La7yGNfTsHEMVOAd4PP+I0usZm2WK4Pk4SKkgCPSbIFZTvZ1uAiSx
IronPort-HdrOrdr: A9a23:TKD966ADP/6OXXblHegksceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHK9JfjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVaUiz9bUN1K9TrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqJmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87CsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXkHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1XackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMW9yV0qp+1WH/ebcGkjaRny9Mw8/U42uonlrdUlCvgklLJd1pAZHyHo/I6M0r9
 gsfJ4YzY2n46ctHNVA7dw6MLmK41r2MFvx2VKpUCfa/Z48SgfwQr7Mkf8IDbKRCdE1JKVbou
 W2bLofjx9rR37T
X-IronPort-AV: E=Sophos;i="5.85,314,1624334400"; 
   d="scan'208";a="55120723"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZeGp0waY3+BqmNYxH0x5E/zPSvThchI/tRoY/+13ktsXAdvIu5e3lLCcae95Jh9mebliiODl5wqe+KopocMaao+PQZYB+k9Go2y33pN6r3cBkXFPgG3xyi8kIkpD6WdklzwYqcOCyQ0p+Jz6eciF1Gf+euQGoGfG+TL/sOngxgyQThQThU81QkJ97yOVJoYj4MfR82nypQ400eTHkDv69Ccegd0hYkAH2KNA33MnGZA+T29gsau30rglbeBCLQ1KYo6RfOm1mVCJW9dxVe9egY+JDSSjbcTYJ3nY0J9cV1k2KTFgjTbgLUQbK4stzixqLHtQwpSPp5dofRu8wPT/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OeEHWCyC0ZQ9x95QU/30S1iVlU/yt5tvPhmewScaa8Q=;
 b=geuYUNpbjPMTxocXKlzBNSuhJkT14RIqaQaOW5Br6lREg/RFGO4cJ1CpaZUF9HnBDu7ZIpDuhwJL+Fbqqibx0HuNT5xwsl003uawLPA2pPPAoW9WvEt3SOqaUH7BwuMFZwmeCNk9Ym4pxXwyEZluOfgSB/2RmD0/vS6nItn4lpKAAp9+zbc0+1XGEIau/gSw/89lndDH4llOwlywHA4sagVBYvZ+Jk+wOHYGuLj0TMm2IUoBKh00k2pv3/Qx7dZ+kAMeUtZ/7/m7WnBS6CuXhoQAc743Y9TNjU6+ZSIH+3zE21pj9RHGzrfVXGhfAdPeCStrC9YGxfpTl/TTdr3WFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OeEHWCyC0ZQ9x95QU/30S1iVlU/yt5tvPhmewScaa8Q=;
 b=f9Y9gmknAHm+fWiMoB12h3vVnA0d/Fm+XKJWsGxdvhAC509usFRNGfejHwuENPWMl2w+8QNbhS2vHyZDMyi/qKCYWOZBmM7TPzwFuTxTL2mGWYqF2xsM1dROXuoVhHPy3H6D3fv+t6uW1x/kHzCd+dFktBCpiDoB4oLANLRnHlk=
Date: Wed, 22 Sep 2021 15:01:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Tim Deegan
	<tim@xen.org>
Subject: Re: [PATCH v3 2/9] x86/PV: properly set shadow allocation for Dom0
Message-ID: <YUspNEFBnihzVaWg@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <25958e72-40b9-30ef-a348-6ac9ef02b261@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25958e72-40b9-30ef-a348-6ac9ef02b261@suse.com>
X-ClientProxiedBy: LO4P123CA0454.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e50d0d3-7154-4c81-5945-08d97dc921b6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4970:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4970900081879B295DE5D0468FA29@DM6PR03MB4970.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1aYEuFdPvbjTSON+MDTsOEX3L/wfM6O7/8gv9WRFQOAptU3kxNV/JZVJn4ZwIQOuUgzQRBPjJztWwAeCcQNSRbSo6epMIV3dCubm/mxB+xgbhwgMlvZTYTkMTbRyl1H/69/E9A2iMSdyT199N43bcphZAVWD7iz2gKTNS3iFFZtUY2DoFJ+7tnj69RqXv1/pQ7WeNpuw5YuJtyOQcQ2YMRM2YJA3HXOaKOnpipIn7RGMEfQAnDaQfvXUeQzsC8WtYCQRlFeS1yJc5Oh7qn0beFFIimWxQZos3Bj+W1IgN013/eegwNIXEYa4C3G7qjwhKC6rcFH7QggvCxLk2ugs5kV55luLrHUuvE78ip5vIfB3v6ATVk4Tqyj1miotNdfpux0TNaleBYJaET/04qy7vaCANSwut2O+18yEcCT8Z1E1vaS2S2kGZ7prM/eg3CT6gbMM3qpa8XfD771r5hAMIvqxiXyFOBuKMlc3xaEekLxSv9QwqG2NtBk5g2KE0zmNw9556/xQdiMYXAY+vykxWEOW3ZBghq7u2DqSQWS3JqtOYn3/ve3guMKBGQ15kf1lE6uUpKGIX9kthrCQZ5raIKzE9fUsBskm16QTNVLe05flm3y4eHwLphRBGVW12k2O+LKe/e94lm3skRerHh7voQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(54906003)(66946007)(66476007)(66556008)(6666004)(6486002)(38100700002)(316002)(508600001)(4744005)(26005)(9686003)(85182001)(8676002)(5660300002)(86362001)(186003)(8936002)(4326008)(956004)(6496006)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enJMQlJ0Mm0xSm9HdW9aNnRwd1dWblNuV01iSWhUMktxM1lZU0xPV3JYV1pj?=
 =?utf-8?B?YU1jdWFrUjNZdDcveXdrU0N6bkJ3NjlEOXY4L3d3cjV3R0tNTWRoRisycFZ1?=
 =?utf-8?B?Y3JXL0p3dGR1bFBzblQvY1M5LzNMRVJCY1RCR2ptdW5Lc3dXMVgzb0RsOHdm?=
 =?utf-8?B?TUViVkM2MCtnRkI1Y3RpcFQ2U1Y3d1FYWmVKc0tGRDZZUEw1cHYvSkI4S1lu?=
 =?utf-8?B?bCtFQmhsNW40TWc5L0p3WU9haVNhSkp3NkI5dDI2dlczaUMxMnB6YlF0OUFQ?=
 =?utf-8?B?TkJzWTVGcHI5Y0dDNVdZcGtjNEFidUJlb0xxNmU3eFkyUHkvTkpjM2ttVTBl?=
 =?utf-8?B?RUZZSHJtUGRJRHdLd2lpTGRtREFINm5VSVVseHVkUFdOTU51MDEvK0FYYWJU?=
 =?utf-8?B?TUVSTGNrb1RSZ1ZUdUZlZUNKQ0pYWjBXVTNnVmJDREd4clNBTTZQOGIyZjVX?=
 =?utf-8?B?K0JJTzdFdDJVUzlpeTFtSFhYQTRORnREWkEzM24yRExOKzFqRUw0VjNGL1A3?=
 =?utf-8?B?VmZMU28xc0tDWjFvYitCSU1Cdm9ja1MrbDJBdDBvYmxrbmJiNXpMeXM4WEFn?=
 =?utf-8?B?VGF2Si8vRkpuc2lFeXNzcGwyRFhNd0FXc0FKaHc5c3ZoaERwTUJEWGl4VFBW?=
 =?utf-8?B?WVJTYXdMc2pYemp5ZHJtbE94bERvditvSlU4dm0vOE95TFlNWFNhdmdoN1pX?=
 =?utf-8?B?NHJ6WUVsUWtWNXoyOGVweGRkNHBUYms1R0JVTDdzQmVHNm5SV1IyTDBvRzBJ?=
 =?utf-8?B?VkJlMmJoMVUvS29KWlJtMmV1aHlWa2FnalA3aVV4N054WGkrL3cwaytEYXgr?=
 =?utf-8?B?NW9wcmYyR2xtOG52dDMyR0s5UXkxdG9VRDJpdTZ4bmMzeFBTUXJZS2N4STc1?=
 =?utf-8?B?T2tvZjQxZERMZ3lxQ21tc2lpWnVRR0xhUllPQXN5WjE1cUV3RUpjdnNCb1VD?=
 =?utf-8?B?am9zWG1ZQm5TbEFZREJMa054dFZ5RnNqM2wzSTNVSTNjZHpzWElHS3JRVjh3?=
 =?utf-8?B?MGF6VWFIeXZLNFFkQ21DdXJYK1JPU2pqTDEzZ2FBV09sWFlaRWIrQm1Zdmph?=
 =?utf-8?B?c25CWEV5R05HZTFLcTh5M2E0bzNXeTVnRFloMHlMdjhFTUdSSnl5SDZ0dXdS?=
 =?utf-8?B?SzFzZlMyWEI0d3MvSkFwYW5JNW9uVzE1OHhtdVhtT0lGenRQUnZ2UVhDTDBB?=
 =?utf-8?B?YVhqWHArK1c2bUhTUUZ6QTlVNFBKNmZsMFQ1ZmlzeTB3bGxnbU5YaXZCRjEz?=
 =?utf-8?B?dE5aNG5xZG1OYTRDQmxCU1lpRnBwak50SDdMSVRNK0hwUkYyWFJqb3kydXZn?=
 =?utf-8?B?WUFPRml6bHltTFkwQmZRK3UzdjB2YjYxTDc1VUlLRm9sQzBHbU1wdmVVUy9O?=
 =?utf-8?B?c0dkR2lsVWxQTnRBQkJsQjA4a0xDL3JobkxnK0dmSFRmZlNKS0lqWUZuOHpM?=
 =?utf-8?B?cUR5amRFbWxId0dKcytmVGpYVG01alRTbHpZbEZ4TUFkLy90TDlnTHhRQmM3?=
 =?utf-8?B?VkxuaVhqLzhDeWdqZE9jYXI4aW9LZmFTd2E5Q3U5dnJNYloybFdxUmV0RXh1?=
 =?utf-8?B?SW4yclI4WS9JaksvRFczQTBzSkZsSGJaNkk1dy9xeHhlRU5VWVV3dEtVcHg2?=
 =?utf-8?B?Z0FLNVh3dk9XNUpVZlY4SEo5VHY2VDFJMFBwU1Zrak9kblBNU09ObWxHYVJW?=
 =?utf-8?B?N0Y3ZHk4L2R1SkhESWxnR1JyRHAzaTljMTl0MjVuUFBLZWxlTHFDczBmVU1a?=
 =?utf-8?Q?HwnpTgl2XPrZzSRwHTcyZqMgewobTligZxIJsOa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e50d0d3-7154-4c81-5945-08d97dc921b6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 13:01:45.8705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ws0djurD9ZukrIJ8N1d9XY1b8J+xQLZ2Du0bHFhK16oWnGggqmGKql6vdi56w77JBXMYI/yKCZYG0hR+CZpm0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4970
X-OriginatorOrg: citrix.com

On Tue, Sep 21, 2021 at 09:17:15AM +0200, Jan Beulich wrote:
> Leaving shadow setup just to the L1TF tasklet means running Dom0 on a
> minimally acceptable shadow memory pool, rather than what normally
> would be used (also, for example, for PVH). Populate the pool before
> triggering the tasklet, on a best effort basis (again like done for
> PVH).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Tim Deegan <tim@xen.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

