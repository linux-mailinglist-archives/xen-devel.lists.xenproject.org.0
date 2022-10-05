Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D825F527B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 12:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416038.660655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og1W5-0001TL-KZ; Wed, 05 Oct 2022 10:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416038.660655; Wed, 05 Oct 2022 10:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og1W5-0001Q1-H6; Wed, 05 Oct 2022 10:20:41 +0000
Received: by outflank-mailman (input) for mailman id 416038;
 Wed, 05 Oct 2022 10:20:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzUo=2G=citrix.com=prvs=27000a6ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1og1W3-0001Pv-VF
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 10:20:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 548cf85a-4497-11ed-9377-c1cf23e5d27e;
 Wed, 05 Oct 2022 12:20:28 +0200 (CEST)
Received: from mail-sn1anam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2022 06:20:30 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM8PR03MB6214.namprd03.prod.outlook.com (2603:10b6:8:3d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.24; Wed, 5 Oct 2022 10:20:27 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.032; Wed, 5 Oct 2022
 10:20:27 +0000
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
X-Inumbo-ID: 548cf85a-4497-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664965236;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=oNRKdwI6uo6H3H+B9FQ4Pws6Sngmm0FTJHlhwatJmVs=;
  b=fufRr5e7yAJ57/IY94IBFB7j/zPm19Fu/MNBj/J4+yF7v1DIRknfLIoO
   gZc1iOvcRZujtg/FQvY1uS4bluQWpPYPtTAMWBtkT4P9BGdKXHV4SGJPI
   2BAtkWeedxBczJ5yCyR8k8bphj63xX/Pn+yFIMgzM7cbFizZcmwqFHt9Y
   Y=;
X-IronPort-RemoteIP: 104.47.57.41
X-IronPort-MID: 81134260
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QLOMPK9iXOTiKbOxBUk5DrUDdX+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WoeXjyGP62KM2TxfdB1Po2y9hxQu5DTm9dgHlM4qns8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5gFmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tpIJ3NL9
 6MJEhpXMQzciL2EzqC/SuY506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvzG7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVqyv32rWRxUsXXqoCGoTmy8Axn2HQ5WYjEzdKfAuch7623xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xJEIJUzpAY9wOr9ItSHoh0
 Vrht8ztLSxitvuSU3313peZqymjfxccK2AqbDUBCwAC5rHLpYgpixvVQ9VLEairj8b0EzX93
 zCLqiclg7wZy8UM0s2T8V3CghqtoIbIVQ8/4gjLXmOj4Rh9bYTjbIutgWU39t5FJYedC0KH5
 XECks3GtuQWV8nRzWqKXfkHG6yv67CdKjrAjFVzHp4nsTOw53qkeoMW6zZ7TKt0Dvs5lfbSS
 Be7kWtsCFV7ZRNGsYcfj1qNNvkX
IronPort-HdrOrdr: A9a23:L5OWWKCQJ7NWS8TlHejMsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl7x6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDyqIiCqo/zOl/Ccl6nfkx1PdqXz/ofbhTDZ/L8Zan4pWfjbQ9kJl5bhHoe
 p29lPck6ASIQLLnSz76dSNfxZ2lnCsqX5nteIIlXRQXaYXdbcUh40C+0F+FosGAUvBmckaOd
 grKPuZyOddcFucYXyclm5zwOa0VnB2JRuCSlhqgL3h7xFm2FRCi2cIzs0WmXkNsLgnTYNf2u
 jCOqN00JlTU84/d8tGdak8aPryLlaIbQPHMWqUL1iiProAIWjxp5n+56hwzP22eaYP0IA5lP
 36IRxlXFYJCgLT4PC1rd52GkinehT+Yd2t8LAT23FBgMy8eFKxWhfzDWzHkKOb0oci64PgKr
 KO0altco/exFvVaPh0NjLFKuhvwFklIbkoU4UAKiWzi/OODLHWncrmV9uWDIbRMF8fKxDC6z
 04LXXOGPk=
X-IronPort-AV: E=Sophos;i="5.95,159,1661832000"; 
   d="scan'208";a="81134260"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ak1s+zygFGg9jAXsm8NAhPXsBpqHU5ve20HVBalcGHTT/2urm4RWpRUx4Orz89L1LBF+5vHD5jePBKUcPbsssx5cV/ogtNRuyHHWSjr9thqurKItw1wqmNk++gtDCsIne2Ez7NuLEZc3EKVpUBEF1jSpbbps17KTqguyyLbMFKNPH0WDydyz8BJo4Q4vra6aCUkJ93QST+AKQDrlcMs4qHflwEZhDV1/KeR8UsgCBPiMp5eO2Tz/f+8J3JfMaGETKPyRAisOfjq+Oxmu5GN4tucRQBXKYb7YHhqQKCD9bnt0cX/vElTgDLx7+0z5qiVt/Cf50NjpzS8cvP3fqXNOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqfDtY1zyJirZeBvXhIJQBhuWBd58J1TjVocdM9ECA0=;
 b=cuoklVYa/2utu7GvFyGayFDdow6QKiJIHAHny5qY8wojzklf6/iPFKbpZhnhvQGHp6HXax1olS+0gIDx529fYg2gEq/18NFRjaYC1AjX8OjFIX9jQOjuVC0AKhhLofsKKrSuJXOQ+3yCpZJqB0zrZz229enLNvFkurmZMVgvu2Kw1qyKmut91nkJ8aoKY/jWxVrZKsny859ufpBZGNMVQ4QhJkCe2Yws8f45CW77NwjyWTUlHyi/kSAAKD+SyGLkH8RXbGRX/se/oyNlB+doyqMqclSZPuNh84vaZ1DFB8WK7zDzHA4xmXsql9AkVhwQUm2QG2jUNM2wO5rG657UlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqfDtY1zyJirZeBvXhIJQBhuWBd58J1TjVocdM9ECA0=;
 b=DbyYRndVG7YgYxtO1iOp96QQKg8gbw74UtxRtBbxaoLVVSPEy8x00UUi5fCm/iPK0Ih/RQsqb8HNR4/RxkzayTDYbYOqpUILys0mlo97bFK4BSqYsYSwwqv8Xylse39VwPxdtXxihUv6WMdG89Zdq1QNNywpiqV34Cg5JJDpmHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 5 Oct 2022 12:20:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: [PATCH 2/2] x86: Activate Data Operand Invariant Timing Mode by
 default
Message-ID: <Yz1aZJx5AZae/2U5@Air-de-Roger>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
 <20221004160810.25364-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221004160810.25364-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO2P123CA0047.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::35)
 To SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM8PR03MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2118ad-1627-49fa-1483-08daa6bb37c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3pTZ6MkL3xfGaYkW4KhdkH9WjNFXbDdaYZKSYNcdCQ7SCjRArXtoLpCw68ZlkoN0qy2gPH3JEEt68FjUFbAspUoppF/+rFXshH/9cfd7TLb2KIlmS4F8SGQhZIn1xDHpXvz3Kkucpf+pO9Z+Iy4rS+t+FRJhqIzkVdtsIRBtlx0H1OOM6t30PrIvaHzgSLJ/FOjcTeAvn6ileEBQs+AwzemqyN5v1UA0hiBL7S9HdB2xxM5q70azZ9oEwOV04iqOQqf7TIsSqt6eEks2WpvB6Tt+RjCRQeN14U7kLSEGmpB85G4pPj7z4hTTvhIaDfEsp3D73pKdsel8g/ojPeZpplM2fTmRDbGxXRbu4aT4XbCRHfi5zQMMPkxYFUmF+GRPHlVC/8NC+Z/O3ad4aQa5HHWU9Payf1WPzEg1uaGFM6DbXOnHK/O3eUYvyeN+mRQRCgnVKMEYZbW49ROJd6jJPtOOhvV099Tmodpx1yEAOzuTaPy+N1xDB3qFUwWCIHK5YiP69Wh6FtgMoW1x80zKSvAbLWKVj7TikCGc+1eql0dz7+bKsM2xhtMLSkJHXICTKwIjzCpwvgNz7NTavN4WgrAZiqwXS78XeP9wHSAFyImK1t41w86U5DBEAg7hBeeDmr0vgYBKg6jPD5B+tQpKm9F2W5+7YLxpwuN7P+FbLw2o8MJ3FIpsatVpS+B83F+cg93/1f+W6dDw6/lry/WR7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199015)(33716001)(9686003)(2906002)(6512007)(26005)(41300700001)(6506007)(6666004)(85182001)(5660300002)(478600001)(6486002)(38100700002)(82960400001)(86362001)(6862004)(8936002)(66574015)(186003)(83380400001)(316002)(66556008)(6636002)(66476007)(66946007)(54906003)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnZtM0N6OWRYVitYejhoaHcybE1OTDAwT1ZKbUtteVJDSzFQWUUyQW9xamtM?=
 =?utf-8?B?eGx6M05oWFd0dFN4N20xcURLeDM0NjR3VXcxVmdoWkQ3UjlaYzBOaWo3a0Zu?=
 =?utf-8?B?RndTa1gzRVRZZ2RIeDBnbE5aZHlwRTc2czN6SXkrV0ErL0lLZkxKUStaMnpE?=
 =?utf-8?B?N3dWZTBOWUJzby9ISzllL2lKWGRja1NMcXVtZmdwL3lPeVpneHNzSjNoT0xB?=
 =?utf-8?B?SnN6aHFRT1FuOU45bW5TcElCWDNxS2Nja1Z0UGFlMDM1N1RpMEFDc1ppSTZY?=
 =?utf-8?B?VVgxRjlWc01VczJlWDVVM0xYekkrVnQxYVl0a21FUW8xTElhb2tvcDRwTkJF?=
 =?utf-8?B?eGlHcjRHWVpIZHJUTnhhOXc3Qy9BQVFXYnBsN1FzcGs1UjZia1dnUlVJZU9I?=
 =?utf-8?B?U1Vsd0xZc3FPUUcrV0kvSWV0K3BlcHFLRHJia010Wm1GNjBxV0xoaFVTSTMz?=
 =?utf-8?B?RU13M1RVZENQaFRxWmd3VlBPTFRkYTFLdUxWKy9GNU5SNDd0dVVRTVRaSkR2?=
 =?utf-8?B?Tm9aQzIwNXVENkw4Qk4rdjR3NlZiR2VDbEYxRWd2ZFU5U2JQeXJZbWtudUJp?=
 =?utf-8?B?TkVndit0dXNqbk0rVkpWTiswVnhndVVmU29wVnhBMHRVa0JxMnlSa2J3VlRm?=
 =?utf-8?B?ZnRlWjN1azhEbDZGR282NnBjWVlKaURBdCtaU3B2WlZXWG9tK05FWVlFdFdP?=
 =?utf-8?B?L0FGTFFTY1l6ckxmYzNjT3lNVkgvbmdBZUxtRng0cWNVamNwVllsMUlmN3U5?=
 =?utf-8?B?ODFWZXpDWExkM3JxK2RaR0dxRzgzcjhBNm56cnFuSzhIWHlLTzlYcTJwOUI2?=
 =?utf-8?B?d01CSHJyVnBNNzN6T21ZQkVDek81ZlNtRkNJclFxU21SS2lZaXpVSWsvdFA3?=
 =?utf-8?B?eWk0OXNJSXUvQ0Fza3NPZ0FqQzBqSVpZNWdNbUVCNEN0V1FkNzk1aDY3OFBM?=
 =?utf-8?B?dkVEcGxqZGJoNzVnYlpOb1orSWwwOGtCdUlBQSt4ZnhLS3ZrTkdwYzk5cWFX?=
 =?utf-8?B?UmN0NHN0RWUvcFBOS1dDU2RiTTVCQ1pjSTB5Q0lJTXNOUzZURzdRQUVzcWJ4?=
 =?utf-8?B?S3M4ZmwyREdZT2F1K0F4SXpLWW96Ukd1aS8vZVFkVUJkYXFUK05LbHM3Wjli?=
 =?utf-8?B?OEJJTEx4ODhPVFZKblQyY0NuaXV4eStqQXBkWDlOZnBYaHBEQzJUTk0xYU51?=
 =?utf-8?B?WHNrS2ZPMXBTSkN3eSt1U3RDRGUrY0xWMHAySk4vQjE5M09XMS9GTnBaRWRa?=
 =?utf-8?B?WVY2SDVnSHl1cXlZSEJEQWdJTHY2Q0dRRENZZnJJa0ZzeEZMendZeCt4L3hL?=
 =?utf-8?B?RUJqVG9WS1dPbFJndmltdk5wUzF6c2Q3RzR0QyswUDBoQ1k1SENBN0JmMWFi?=
 =?utf-8?B?bEVFZzM5TkxTV2xIYXBYSWo2QUdqMlZyTDRrRkFYdCtvTkkwckZ5ME1QZ2w0?=
 =?utf-8?B?Ri9NS3M2T3BwTEQrdG9sT2xnVThqQkQyWWhCN1ZuRTZ1YU5UbXVzTGhjNmY1?=
 =?utf-8?B?a2Exem44WVFaMDB2eEZjWWRFRnZzZVNIYm9XeTlEdHdicWlZNS8xOWNvUXRm?=
 =?utf-8?B?bkZ6NklSam1zODVuQ21ncTNIaEtVYW92OWpNRHZ6K1AveXMvb3JNNWJoditH?=
 =?utf-8?B?QjVhNXY3ODUwQm5GSzh5TXZreW9LbWZWVkRBN3BmVFRZQXlNb3FCTEJvdmxt?=
 =?utf-8?B?V0h0b0JWTjdCeXdwRUtIZzc0S2liNjVlcHBVOXN3NU1XOFRhRGxDOTJncTRp?=
 =?utf-8?B?SWkreHNPZUl5dm9YZ1pJYjVLdzdqYXJwQjdkUnZCODkvOFZVZzhOSkxqR1FJ?=
 =?utf-8?B?RU9ld3Q4TldTMDhjQ3hORHFTbE9JWk5YTGpKQVNLem5MQ3dvOVdUS3hOenpD?=
 =?utf-8?B?WHNXQ3Y3R1BDZXUxMFpJaXM5akNJQzZldi9jSGNqY1Q1Z0RlNFAyd0xTa1V5?=
 =?utf-8?B?R1RGdlM2YzNIY0REU3JRUGhpdHBWTExOUjgzTmZNRnVtNitNR2ZQbGx5dXdx?=
 =?utf-8?B?dGpGRktUWndoc3JTVDZiekUybTI3bm1zTlNxUEU0dHNPZDBBWmEvYmYrOXRi?=
 =?utf-8?B?UjhZYUZPVGd0d0tROVBXSHF5VExOTThYdnhJYkpBbWROQzFPNzNWbEFqeTF3?=
 =?utf-8?B?dEo4VWJYaHlwYjRlN1FVQmZkMlJja3dieWpURDV1NktoQ09kNWJ1TE1ZdlZT?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?MGp0S0RWNStvVGE3emx1QUg1TVhpcnRicDEzaVpzTk9KVkw2WlRqUnkwOHpI?=
 =?utf-8?B?a2ZsM3QzMnpkRVkzMy84Zko4MFQ5a0oyc1RwYUxrdUxXYVplelUzK1A5dVU1?=
 =?utf-8?B?UnRXZFM4dC9ieGoxc0RDL2ZLa3d6akhEc0J3ZG1LVlFqM01TSGw5WThkblVL?=
 =?utf-8?B?dnF4VzN6WjhUM3cvcmtsQm9NUUI4UEZkUUM5Um9lMVAzUm9OYysrRVl0cGc0?=
 =?utf-8?B?emtuZmlrMERNR2QvRDZHWG9QSzd1SitRdjh0QXdkZElieUdjamRZbzl3TlVO?=
 =?utf-8?B?ajdDVE83a0xQNlBkY0laMWgrUy82cU5BS2hQdXR0VUQyY1NVR2ZvUXZYYlZU?=
 =?utf-8?B?OHlOeFFHMG9TdWdlYmF2eXdHQkVFaHV4STl3NnVRcUFXSkNDV01yejAvT0hl?=
 =?utf-8?B?V3g1UGtrOGM3a0o4SDhqLzBpb0w3MXpmcTMwTWhCK2pvUklDV3JGNU4rMSsy?=
 =?utf-8?B?QlBYWCtGM2pSNGIxdnZrbXVKNTkyMGhKQ1I5RzdBcjRpTGIxUTJQQnFXbzgr?=
 =?utf-8?B?b2ZGNkdQejJieCtGam9uT1VsdTdyRCtoQm9pbHZWU3d6bm0wbXExQVptdloz?=
 =?utf-8?B?Sy9PVlpNdVVDM1NBM2NVdU9qZUord1pnTmxuZVBwN3R1QUY2cjFONTFoYWdm?=
 =?utf-8?B?Mzh4SWZlMGhCZWhDR1hyVzNESFg2R3JCZjFyUFZycHB2MHJjTkhvb0tLZjE0?=
 =?utf-8?B?VTdXMElQUE5ybzZpOHBJT0xqc05jdGFYcUxzSTFwTXhuQzdydkxvUStTd2dM?=
 =?utf-8?B?OXF4SS8wWUxhbDhWelI0ZjAxLzhZTWlKSEY1R2RNallGdlNsRnczSHNaTmR6?=
 =?utf-8?B?cXJZT3ZIY2hiUnB6d3ZGSUJMQWxsWkxtQW1Fc1lkeWNmZWhaV3c4VE83YmU1?=
 =?utf-8?B?NHNnVmpQSnhWc0FRSlRrQ0Q5VXZyeitWbmsyNTFQeUVTVFphVjVwaTl2ODdw?=
 =?utf-8?B?RVZNemxKRThoOEJTVnAvVC8vV2I4WXBCUWIzSGVlbUJqZ2dhQXFqMVo5Z0Zh?=
 =?utf-8?B?ZFdLMUdOUVdncUg3RXpsdU9sSzNvR1FBclBtb2VMRHdySFdHblpuWHVOT0N4?=
 =?utf-8?B?bDdQSFJndnI0VDRlSmdwU2xBZFF5VWlmTWFyZXNSeUcwWlVodlh4d0ZEdnFj?=
 =?utf-8?B?VXVRU0pRdVJ1YTdYMXFuUXZtRkRmWkFiS1lrbkllbm9KS0RmcU9GdXJ2ZXNh?=
 =?utf-8?B?VUlEMDNsSHFUclhqNVN4ZGNPSC9WVUREZ2gvOGFGTHpOMkxyVkFFNGJhYkJO?=
 =?utf-8?B?RFpxK3RZeURoWHJYbEhxVElWVGlXaStVTXVrWGhyVHlsdHU5QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2118ad-1627-49fa-1483-08daa6bb37c4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 10:20:27.0884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsO8l64kNHm3hWiCpzNanxAlfabg/+oCZH9HyhEyP3tAjtTIagBpxRGW1B2KGgEvmo/RMSLxk0ZN8ggH70fy0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6214

On Tue, Oct 04, 2022 at 05:08:10PM +0100, Andrew Cooper wrote:
> Intel IceLake and later CPUs have microarchitectural behaviours which cause
> data-dependent timing behaviour.  This is not an issue for 99% of software,
> but it is a problem for cryptography routines.  On these CPUs, a new
> architectural feature, DOITM, was retrofitted in microcode.
> 
> For now, Xen can't enumerate DOITM to guest kernels; getting this working is
> still in progress.  The consequence is that guest kernels will incorrectly
> conclude that they are safe.
> 
> To maintain the safety of current software, activate DOITM unilaterally.  This
> will be relaxed in the future when we can enumerate the feature properly to
> guests.
> 
> As an emergency stopgap, this behaviour can be disabled by specifying
> `cpuid=no-doitm` on Xen's command line, but is not guaranteed ABI moving
> forward.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Henry Wang <Henry.Wang@arm.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
> ---
>  xen/arch/x86/cpu/common.c            | 29 +++++++++++++++++++++++++++++
>  xen/arch/x86/cpuid.c                 |  5 +++++
>  xen/arch/x86/include/asm/processor.h |  2 ++
>  xen/tools/gen-cpuid.py               |  2 ++
>  4 files changed, 38 insertions(+)
> 
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index 0412dbc915e5..8c46a4db430a 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -209,6 +209,34 @@ void ctxt_switch_levelling(const struct vcpu *next)
>  		alternative_vcall(ctxt_switch_masking, next);
>  }
>  
> +bool __ro_after_init opt_doitm = true;
> +
> +static void doitm_init(void)
> +{
> +    uint64_t val;
> +
> +    if ( !opt_doitm || !cpu_has_arch_caps )
> +        return;
> +
> +    rdmsrl(MSR_ARCH_CAPABILITIES, val);
> +    if ( !(val & ARCH_CAPS_DOITM) )
> +        return;
> +
> +    /*
> +     * We are currently unable to enumerate MSR_ARCH_CAPS to guest.  As a
> +     * consequence, guest kernels will believe they're safe even when they are
> +     * not.
> +     *
> +     * Until we can enumerate DOITM properly for guests, set it unilaterally.
> +     * This prevents otherwise-correct crypto from becoming vulnerable to
> +     * timing sidechannels.
> +     */
> +
> +    rdmsrl(MSR_UARCH_MISC_CTRL, val);
> +    val |= UARCH_CTRL_DOITM;
> +    wrmsrl(MSR_UARCH_MISC_CTRL, val);

Is it possible for the firmware to have enabled DOITM and Xen needing to
clear it if !opt_doitm?

Thanks, Roger.

