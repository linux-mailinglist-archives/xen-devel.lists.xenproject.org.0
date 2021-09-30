Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2475641D7F2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 12:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199763.354014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtUe-0007qa-LC; Thu, 30 Sep 2021 10:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199763.354014; Thu, 30 Sep 2021 10:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtUe-0007nx-Hq; Thu, 30 Sep 2021 10:40:48 +0000
Received: by outflank-mailman (input) for mailman id 199763;
 Thu, 30 Sep 2021 10:40:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Bos=OU=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mVtUd-0007nr-4j
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 10:40:47 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e19d629-6f1a-43e1-bcca-2710543771b6;
 Thu, 30 Sep 2021 10:40:44 +0000 (UTC)
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
X-Inumbo-ID: 9e19d629-6f1a-43e1-bcca-2710543771b6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632998443;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=n5gJgrNXUS23H91tjeK37aLN1I3GAH4JsrvnGmyMhv4=;
  b=TiL7akgfLH+3u9eQsZzDGTfjA+Vz4JyE8AufUrVBykfw3K1oQaZjFPVy
   Zr59nGQzPXHzKVTjWHpEBl3A2WWyf6tkMLxt0UsFSV5IQYeVxhg6LBCDW
   zSOSk0Uog7e4JXNIJ8HUx6gOu+1bFEJUVNoGc8mOU5tGyrB4jRuovIsTh
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fWVKFkz/Yl7WtH62gTl9gDwVRx3WGXntpoVc5ChQL/O+fBeO5powsEqoT3IMG747U0CHRylZlg
 OthQLBZp1n5qam61R6r2dpN9bwAw/S7mF798P2A9DueHnwgIHSx5qaqqnSPbGUmyXpF7NIjFe5
 OkCzchmvq4sa2/zpvJPK198xq05ItNIb1oNUs5Dtx6r4drFSJpJbYKrmZ/dru4jbfKwIkWJz6T
 4u6KX4Pkwia9dr1Ws52lNIa51AgV+vd3JkXQJkFDYNcqmhfNj641tU2+sJOCKnkBVLqLiSQCMR
 M+QUH3upmP4xfD+CgFktX755
X-SBRS: 5.1
X-MesageID: 54418356
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:A658V6MFDLo1TFPvrR2ukcFynXyQoLVcMsEvi/4bfWQNrUom3mAOz
 2ofC22OM/3ZZmenf952OoSz/EwEu8PRy4VmTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En552Ek7w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozDOlot8k
 45oibmxFCQUB+7FgcRGDRYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWts35AVQKi2i
 8wxSQBzfA+eQ0V0K1pKGZIenr+0h3DPbGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6ar
 G/b+2XyAjkBKceSjzGC9xqEh/DNtTP2XpoIE7+1/eIsh0ecrkQWCRYWXF/9puOrh0qWUshab
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6bG2wFQzhpeNEg8sgsSlQC3
 FKTg8ngAzAptbSPUG+c7Z+dtzb0Mi8QRUcAajUNSQ8t6tzqsoY1yBnIS75LLqmxidHkHCDq9
 BqDpiM+mrY7gNYC0uOw+lWvqym3upHDQwox5wPWdmGo9AV0YMiifYPAwVrU9/FbN66CU0KM+
 nMDnqCjAPsmVM/X0nbXGaNUQe/vt63t3CDgbUBHGt4orDn2oFufWIENwwxHZ05wEp1admq8C
 KPMgj956JhWNXqsSKZ4ZYOtFsgnpZTd+cTZuuP8NIQXPckoHOOT1GQ+PRfPgzCFfF0Ey/lXB
 HuNTSq74Z/244xJyyCqD8MUzLMm3Cw3wW67qXvTlE/8iev2iJJ4U9443LqyggIRsP7sTOb9q
 Y832y62J/N3C7aWjs7/q9N7ELzyBSJnba0aUuQOHgJ5HiJoGXs6F9jayq47dopuksx9z7mTp
 CDhAh4IlASu2hUrzDlmjFg4M9sDur4l8BoG0dEEZw70ixDPn671hEvgS3fHVeZ+r7EypRKFZ
 /IEZ9+BEpxypsfvoFwggW3GhNU6LnyD3FvWVwL8OWRXV8MwFmThp46/FiOypXZmM8ZCnZZny
 1FW/liAGsRrqsULJJu+Vc9DOHvr5iVCxLIuARGYSjSREW21mLVXx+XKpqZfC+kHKAnZxyvc0
 ACTABwCovLKrZNz+97M7Z1oZa/1ewenNkYFTWTd85isMizWojiqzYNaCb7adjHBTmLkvq6lY
 LwNnf37NfQGmndMspZ9TOk3nf5vuYO3qu8I1BlgEVXKc0+vVuFqLE6Z0JQdraZK3LJY51e7A
 xrd5tlANLyVE8r5C1pNdhE9Z+GO2KhMyDnf5Pg4Omvg4ypz8ObVWEleJUDU2idcMKF0IMUux
 uJ44Jwa7Am2ixwLNNeaj38LqzTQfyJYC6h+78MUGo7mjAYv22puW52EB3+k+oyLZvVNLlIuf
 m2eip3diukO3UHFaXcySyTAhLIPmZQUtRlW51YePFDVyMHdj/o60RANozQ6SgNZkkdO3+5pY
 zU5MkR0IeOF/ityhdgFVGepQlkTCBqc80336l0IiGyGEBX4Cj2TdDUwabSX4UQU02NAZTwKr
 riXxVHsXSvuYMysjDA5XlRoqqC7QNF8nuEYdBtLwyhR80EGXAfY
IronPort-HdrOrdr: A9a23:LyPz9qN6X5SBOMBcT0j155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/exoS5PwP080kqQFnrX5XI3SIDUO3VHIEGgM1/qY/9SNIVyZygcZ79
 YcT0EcMqyCMbEZt7eD3ODQKb9Jq7PrgcPY55at854ud3AMV0gJ1XYINu/xKDwOeOApP+tdKH
 PR3Ls8m9L2Ek5nH/hTS0N1ENTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJp5mLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87SsIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXgHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa1HackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmMm9yV0qp+lWH/ebcGUjaRny9Mw4/U42uonhrdUlCvg4lLJd1pAZYyHo/I6M0rN
 gsfJ4YzI2n46ctHNRA7dw6ML+K41r2MFrx2VKpUCHa/Z48SgXwQr7MkfgIDbKRCdA1JKVbou
 WJbLofjx9oR37T
X-IronPort-AV: E=Sophos;i="5.85,336,1624334400"; 
   d="scan'208";a="54418356"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRSEeCqQh4GAwjdMCOfGPmvQUWtippdy+SDWecAqRSwtTMjEcEGyUTS1FFj1mQ/7qqlBtaCLy5C9IeDRGwmxTG9K/+JkpyeoGhmjEFWjrHLACiZ9QU4/+JkCehvqhhf72qemik2+h3X/SC+GUcRYxUQ5yCSOUcoHN9yp1ck1t9YMTiViELqstmZlMKh5jNLgfGg4URNLvDcJdtgqxWDFZdjP/SfWkTEL3EOcv7w2rZviOWCTCfOOkyp4M7lqEU0CLk1sCHWYf9XAs66KQUl8Bg6lDaeTRxxtBkZ1C6mVKjUy1XLtGX24k8E90w/O4ApfgmNOPNiBZ6wY1zi847IaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1Xxz7R5B15hALx4NDFcBV82CATwyw1U5VEPiwOZ+KW4=;
 b=hi6oDab/OEjh8iUdtFQLpgozJHDz5oXy1r4bh8N+DqKTlq9uBK21JwuGTKUHnq0j0vJbKwxFgqZ5Tol6zodkUY0FgGfJqNoOeyMDqGFHKFoHTam+9chS7Uu6zlw0lAKjsyqSX9HU+m9FAYnH+QvkOkmHD0ezbtfe4toV2T1eYSuIFhJJVW1YbB/VXbFVufwascYDEbBCjvcHpX5EELjiGePHDYi+WuKLcGZkSs3spePMqOnXifQowD/A8V/uLoZdJZaZWdRb8mxfcwpX2WLO5IhrvyTgmtl3sjti8OviZqDeQOGUJmJGYhDaA3IIpvk8EOzzaLj+GxESH5hSLrJLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Xxz7R5B15hALx4NDFcBV82CATwyw1U5VEPiwOZ+KW4=;
 b=tUeDdb/VO0vBW8VB/1UNiMDg+gE9Tnxl820GbEariesMydwb6PUNb5eTpn7oHWpWA0bOyosy9YqvuEj8aRSAmH/MYBonne3ck1p/HwTwtId2SsdDhiNLQ5+0N/uP/CeOxZtmiJDV+7co8v/vh9zpDxphpW2AbRmrZanicyX4Zh0=
To: Michal Orzel <michal.orzel@arm.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, "Julien
 Grall" <jgrall@amazon.com>
References: <20210930092651.1350-1-michal.orzel@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/arm: Expose the PMU to the guests
Message-ID: <17d393c9-b249-cccf-e360-054b66466143@citrix.com>
Date: Thu, 30 Sep 2021 11:40:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930092651.1350-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0123.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c50fea4-b10a-48a0-7167-08d983feb689
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5648:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5648676AF7859B75C1BA7C3BBAAA9@SJ0PR03MB5648.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTnnNRmclIte1vcTKauVh0Ib8ZsVWZzSRDRI2XXdSGJLKQKCQhjLU6zCA+qX682AegC/zZk+aJFJzL6mEwcR8pFSAF4in4idYQ/YcKueDNwA0WRwW/WM/oCd8b6oV5N73sSF6PlebLNSgPmNVsEpALV8zAb6ZR2yAW20aDtAeeBPodEyzMKqOGqlOpmOZgI+Pd3pmFgHQ/LmXjZFfUg51cF5C7FMwccoWN3sajBJOHEd5tPHjXdr/8WPYLOHXVk2PpbTcUfezFYFUuHNsujwhA1ZkBwXr45f8e7FJJFI20nVfC/x70V0PqLYZo2ynvtTCqlIM7K6B557mxFvexcnOljvQnRcnh+1ujTuFKBMRu4mTfvHZIIz4gzChXBDaizSWWsLK0pKygeSpmQKdDtPZAsbOiFaPAXAR9ywaO74KyI7Rs33qwkcVnYhHhiBITPohno9qyDSV1GJMCbjAetAACivMEowv2TLdMSXbuH9u6SKZw5X9b/qnLluKbMOavtzvNsyUTWiZon+ANFB5WaSnaoS7KNxkXlw+sh+jASmg63Ml6G+m0Yaz4cNRbmKerJfyxdX09q2tL99D4Oa8ChlLx+MKhu3nGeddgj+f7egicD08754DMO7Ycd5hUdc2w3WSoeH2JQWq6imNPm/E86Ffn1h9pbc2PGbsRzOu8RRJOplpNjCQbH292xWbyFBsHW0jz57HAPqs86+kBFShhXN0wIjrspG2LNoAlyrb55e/WM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(6666004)(66946007)(86362001)(38100700002)(4326008)(36756003)(2906002)(31686004)(5660300002)(186003)(54906003)(316002)(6486002)(8676002)(26005)(83380400001)(2616005)(956004)(55236004)(53546011)(508600001)(66476007)(7416002)(16576012)(31696002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXFQa1JCWU1tMzFIajZJRnVzZXdvNlBOY3VZNWEwRnV6VUswSm9LY29Ceko3?=
 =?utf-8?B?WmV1Myt6UG9DaDByMThxT0l0OUwwcC9WMmZOTHhZd1lzd05nLzJxdVc1TXBX?=
 =?utf-8?B?RDlqbXhNakV2YmZ2N0xoN1I2ZHJySFFwdTZFRWJLWlVuVkpmcUdsSW9qMG95?=
 =?utf-8?B?bUdqSnFuR3M1V2dqOVpYdmovZFYzbkFacVczVmc3ajkxY244c2tRNFhQaGxI?=
 =?utf-8?B?Nkcwc2xHVjlhWG9ybTdHWCtPMzVFK3E3YkRmTzNTcmZEUlQ3ajJiNGU3RDcw?=
 =?utf-8?B?NVZmVElxYWsyV2tPaDgwNFkzY3ArMzgyV09kNXJKUGFNQnBHOFNGbFIvSk9I?=
 =?utf-8?B?bFVCdFliUXJNdWZpZSs1TDdoaHFLZndhR2xNbkRIdWF6a1lHRU9YVHMrL2ZI?=
 =?utf-8?B?OFZZSnZGeXI0ZlVpOTBocWIycG1zVFp1Mk5GeVlqTDJHbWgxTFdtQm1renll?=
 =?utf-8?B?NkM2S2ljNDI5TVEyRTU3L0pSTGxhMkZnajF0YWlGMFpXWFVYVVFIbERVdDA0?=
 =?utf-8?B?a0huczM0VjdnT3lKMGhsWWJMRGlJaWZvTUFzKzdtWUhXYVgxNXJBb1dIaGIy?=
 =?utf-8?B?cURDRWI3aVpJUjVSbHpETHc2eHNOMDRuUFlTMndXQVR2T0NhN1laUzR2VVNU?=
 =?utf-8?B?U0lyT3hWT3J1QWVFaTY5YlVUVjBUb0J2cmZQK0JKUHJ4T1o5OWx3Y1RmenJi?=
 =?utf-8?B?YmlWZlI0eld2eG1CUFpLOVY2Z0EyRXEveGtvaGxWQk1TVTg0bDZjVytkMC82?=
 =?utf-8?B?andKeXdqYjhseDAwbkdIM2t0WWpWTVhuSTllOWQrdG8yVENoSlhkT09NL09F?=
 =?utf-8?B?QzE3bXYyOUM2dmN5U2c0cDNnTVlqUXhUeVBSb0lDYnpHL1lXcnNqWGNYeU85?=
 =?utf-8?B?bFkwc0lOamhxVmZxQVdGVFllckwxL0NFeGxPZTUxdEVsUjlCdElpVXdKMzhT?=
 =?utf-8?B?bWFiSlA5SUd0b29OUTlHMXFEcEZ5YzhvRzJoMVVvQXNpRW1UVkFWRS85ZDM5?=
 =?utf-8?B?Rlh2a1J0dDROa2VUZ1FVZklQS3pUQnlXWUREaEU3YmFUNnFnUXRnckxWZ21O?=
 =?utf-8?B?OUlEWHRubUpNWi92SFZieStrZVJSQVhGYVpROFJsWHhPaFJGTVV0S054bnBm?=
 =?utf-8?B?Mml3OXNlMWMxSnFMTG1FbUFEa0loblpVN3gxV3pHZUczTWZGTEFUN3lwK0JJ?=
 =?utf-8?B?VDBuOWkzR09IeFRCTC9QOXB2QkJwTnlTbkN5MVk3VzZ3ZUJhamlReHVQWU5V?=
 =?utf-8?B?R0drRGxyUjVGZkFyRXAvVFdITVhhYStNRlVVQkxXV3FnU1lmV2ZmeWczcVB6?=
 =?utf-8?B?ZHA3Y25JSU9IV3V1dlJySTY2WEQ0QkQ5UXppRGlWNEhlc3NVUTFrTHdzWDZ2?=
 =?utf-8?B?Nzh6ZytZK05ZU0hRSXNCVDFtUjlyaTRQNkV5WjdDSHR2bUd3blViU0dXMDBp?=
 =?utf-8?B?T21hOXMya2Q5L2FNMXlsbU5xV3lOMUpMVUN4a01EOTVsVlE0YXdyemd1TG9O?=
 =?utf-8?B?VGdscjhDZjI5OEk3cTY5Qnh3NEZoQVF2cTFZUXBhUUFqc05wQStIdTE2cVBY?=
 =?utf-8?B?eVVrRmtqVUwyaEYzQXdPb1dFbmpsaUh5ZHkzOCtvbW9UNFZUZmdPai9XVTVJ?=
 =?utf-8?B?aVZLeGhCTVd4cXkzZ3lDV3kvLy9IL2VwZXpMSlNneCtKa2trU2VOdit3RkF0?=
 =?utf-8?B?N0o0WVo2cjNuNm1tenNVTk9NQm5hdTY2MjR6clY5b3ZEZ1VDbTJaczZ4Nk9H?=
 =?utf-8?Q?BhmgV26UoI7H1R+NOKBdezMqS2zpQWqcp1h8KNh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c50fea4-b10a-48a0-7167-08d983feb689
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 10:40:25.8367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jl3LXuQgWFpaG1+4feYzKuFkAUE2QrBr/4uRc4dggwWvNYLzhTb2/cpeH/1C0HPzlMxIMKxCn2D6skp7LK+5Hgf9th4uQThSC/FwtvxqZbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5648
X-OriginatorOrg: citrix.com

On 30/09/2021 10:26, Michal Orzel wrote:
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 4b1e3028d2..4a75203b9f 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2843,6 +2843,18 @@ Currently, only the "sbsa_uart" model is supported=
 for ARM.
> =20
>  =3Dback
> =20
> +=3Ditem B<vpmu=3DBOOLEAN>
> +
> +Specifies whether to enable the access to PMU registers by disabling
> +the PMU traps.
> +
> +This change does not expose the full PMU to the guest.
> +Currently there is no support for virtualization, interrupts, etc.
> +
> +Enabling this option may result in potential security holes.
> +
> +If this option is not specified then it will default to B<false>.

There are rather better ways of phrasing this...

It isn't "maybe security holes".=C2=A0 There are two salient points.

1) vPMU, by design and purpose, exposes system level performance
information to the guest.=C2=A0 Only to be used by sufficiently privileged
domains (however the system admin cares to draw this particular line).

2) Feature is experimental, and thus might explode on you.=C2=A0 Bugfixes
welcome.

> +
>  =3Dhead3 x86
> =20
>  =3Dover 4
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index b9ba16d698..c6694e977d 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -502,6 +502,13 @@
>   */
>  #define LIBXL_HAVE_X86_MSR_RELAXED 1
> =20
> +/*
> + * LIBXL_HAVE_ARM_VPMU indicates the toolstack has support for enabling
> + * the access to PMU registers by disabling the PMU traps. This is done
> + * by setting the libxl_domain_build_info arch_arm.vpmu field.
> + */
> +#define LIBXL_HAVE_ARM_VPMU 1

Please make this generic, not ARM-specific.

The domctl flag is (correctly) common, and x86 could do with this too,
as well as other architectures.

Don't worry about plumbing the x86 side to work - that's a little more
involved, and can be done at a later date.


However, you do need Xen to report the availability of vPMU on the
hardware as a prerequisite.=C2=A0 The toolstack needs to be able to know
whether XEN_DOMCTL_CDF_pmu will be accepted so it can error out in a
useful way on hardware lacking the capabilities.

You probably want to follow the example in
a48066d25c652aeecafba5a3f33e77ad9a9c07f6

> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 96696e3842..a55ceb81db 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -70,9 +70,12 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
>  #define _XEN_DOMCTL_CDF_nested_virt   6
>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt=
)
> +/* Should we expose the vPMU to the guest? */
> +#define _XEN_DOMCTL_CDF_pmu           7
> +#define XEN_DOMCTL_CDF_pmu            (1U << _XEN_DOMCTL_CDF_pmu)
> =20
>  /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_pmu

Without an adjustment in the Ocaml bindings, the ABI check will fail.

~Andrew


