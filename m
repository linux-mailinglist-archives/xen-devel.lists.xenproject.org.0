Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673D843C668
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 11:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216774.376507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffA5-0004sD-Kr; Wed, 27 Oct 2021 09:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216774.376507; Wed, 27 Oct 2021 09:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mffA5-0004pe-Gn; Wed, 27 Oct 2021 09:23:57 +0000
Received: by outflank-mailman (input) for mailman id 216774;
 Wed, 27 Oct 2021 09:23:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ie0f=PP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mffA3-0004pV-Oz
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 09:23:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34a7a848-878b-4eb9-bef7-079b9d0a5116;
 Wed, 27 Oct 2021 09:23:54 +0000 (UTC)
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
X-Inumbo-ID: 34a7a848-878b-4eb9-bef7-079b9d0a5116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635326634;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IhK61ohyCJ3J+SKOaXO28vQ7vrrMr1/jcNPmr+N3S2c=;
  b=M36z9j9oJGomXpe75+MP4uWJ2jJeHma2lXTVGRW65fgmbWDHZ2QTh9lM
   hXb97A5oPpMErOqyAxo77/qOilMuPNdS7b9D6tLFPZiN7FHpz2EQ7TImz
   tlbxaRm/WLJbKxvpFcTOZcwUnOEFoDqBUvn2/IBZhFEJDKY1tABI9+u9u
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 30JGsgw1EYWZfFxYLUrdpJ8dyPBIVI/3vz+M6jZ7V/jk5sG7ag4FxzzxHCUq0/b2rX4kGU7gFP
 R7d7QTklNSPXSetjOwPau8ZqEXMxJoSouCUmPdDn5ZwuREd0EaWEDIOpHeVgkoGaTqGr7edG1m
 1gD3jAyDK+pFLiOruyYPBZbkW768r5flIr3IfGS5YRwfS/27rzGBGM62aOp8hjiYnhXROQFqWS
 D4qRIVEuDr1wMYdQovRPD7yxIayIKqXMgDzpL/xw7/8dX2uQdQsYoS6UFJDyfMFCwosj2EU5Qa
 rXCbMNsCmGLNqHlxfW3dOWEx
X-SBRS: 5.1
X-MesageID: 56732256
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FtxOZ6DvbnZY5BVW/2Hlw5YqxClBgxIJ4kV8jS/XYbTApD4lgmdUz
 mEWC2+PP/uDZDPweY12Ody/9EsO7cOAn4RmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX550007wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/0xeiu9J88
 eR0lKOVdVsIHYHSpNkeekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvuVvoUCgWlYasZmOPD9X
 8ErciBWNUrQSUcfNHkJD84UtbL97pX4W2IB8w/EzUYt2EDS0w5ZwLXrKMDSeNGBWYNShEnwj
 mjL5XjjCxcWctmW0yOY82mEj/XK2yj8Xeo6DrS46/osm1yVyWw7AQcTE1C8pJGRkVWiUthSL
 0gV/CsGrqUo8kGvCN7nUHWQh3qJvQUVXdZKJMQ85BuQ0arf4wufBW8sQyZIbZots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsTxYB4tTliJE+iFTIVNkLLUKupoSrQ3eqm
 WnM9XVgweVI5SIW60ml1QjlqBauq6H4dy8KwzmLf0GJ8D9EZ6fwMuRE9mPnxfpHKY+YSHyIs
 34Fh9WS4YgyMH2dqMCeaL5SRO/xtp5pJBWZ2AQ1R8BwqFxB7lb6JdgIiAySMnuFJSrtldXBW
 0TUpR9KrKFaOH+nfMebiKrgVpx0k8AM+TnjP804j+aigLAtK2drHwk0PCZ8OlwBdmB2ycnT3
 r/AKK6R4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+xYagTVPrphtfvZyOkwz
 zq5H5HSo/m4eLanChQ7DKZJdQxaRZTFLcmuwyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 RmAtrtj4AOn3xXvcFzSAlg6Me+Hdcsv/BoTYH13VX71iidLXGpaxPpGH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwVFWueq2VHNMCsxGGgHTzy7T+z0+OeSGFXV7ZrRhDT+8+ieQ3q9SIUCTGwu9d4q
 Lqlvj43i7JZL+i7JMqJOv+p0X2run0RxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/Ymbn72AoqeoD/B6QhhQEV7E4OvkLiLd5Gein9NNCb7aYTDHWWro06y+f
 uEJnerkOfgKkQ8S4YpxGrpm14wk4N7rq+MIxwhoBiyTPV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNIfVgrdOWO0/0QiwL+1/VtLRWo/jJz8ZqGTV5WY0uGhhtCIeYnK4gi2
 +og5pIbslTtlhowP9+apSlI7GDQfGcYWqAqu5xGUo/mjg0nlgNLbZDGU3Kk5ZiOb5NHM1UwI
 y/Sj63H3uwOyk3Hens1NH7MwesC2she5EEUlAcPdwaTh97Ipv4rxxkAoz04QzNcwghDz+8ua
 HNgMFd4JPnW8jpl7CSZs7tAx+2V6MWlx3HM
IronPort-HdrOrdr: A9a23:xsh/ZKFtn8NS5PzJpLqFcpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5pav854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.87,186,1631592000"; 
   d="scan'208";a="56732256"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6vGwwO1+8I0kAfL23Zd9RvAZAs6Qm+gajciVmOw64LU1ZQZ4kw1NeXYr4rjhhBpitiqt/t0oQ7whPbgt7yl8HBlZ3auXu8aOTofqy0Nv5MNzEwKrk5Ei10NoyaYp2EH4GSn3UODLAy95WMCqiH6KBL/B+YVXDYQOlXnwjDU6O8kXtvm5ANj4s85S5wiCES+D4eybBXcfHSq7ku2WKziSaEfvbyoenPjiy+UP+b04sJZmpkqRLo9uTM86bWJyJUvHRZS5bXAqkPu6Qm7oRQTPqaNPk+xwfjTsu9SCmkKbylaXMtweZPVB2P9UEnFIhFT2jFePIphzoLigY/VS38z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5L8CzlgT1le84DZ9Sp6SZvczRzklAW2BzcApxY0BHK8=;
 b=dcfFfk/BIvACbYm8YVPOKHameI0frTqGOvSpu7je83fLLFcVoNohDM7VKznAhVo5hzJLOC3UtiCQuKXoK/tfRK5jx5xgwoNpvgcujnW5Sico5DOsdnUlcHRmg82btGUcoYlX07IibGJraJ25wbhOm9y2iwWyiAJsUSl4cyafSBg8C6Y6JJgiL90xsB6TBENn9uzHIe7yncOsrfT3VVv6Z5gMB2SuPzKWSC/sq20O5aCbFM0Vc5j3f/4LZR531FtO3En/UjZqx5U2qyrQQyrDfnkWakos+CrHHRTykQMCIoT5wafE8Zyl+82P9sFHy+fRYzq/Bs5xm1CJAOmNPLv54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5L8CzlgT1le84DZ9Sp6SZvczRzklAW2BzcApxY0BHK8=;
 b=VWXuUPd7bqH1XnhVCI5QC5zH8F0c8Ely8JOValR4F3yiYJOrLwzT4hz1Vjto4Xkem3J5rTI+4QPEhu6aBRB7RwrZ7ZjA+EuoFhWFxfdN2ZGWJXzzuemJjWZ5BgUD53xJUds+4QtDNPhncbSsHg9JXgPYglRS9qgFglF4y5zUPNU=
Date: Wed, 27 Oct 2021 11:23:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "iwj@xenproject.org" <iwj@xenproject.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Message-ID: <YXkaov2E5CdWRjlr@Air-de-Roger>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <YXkU+DKYmvwo+kak@Air-de-Roger>
 <0bbe4d1d-421d-e816-42aa-f43581902a02@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0bbe4d1d-421d-e816-42aa-f43581902a02@epam.com>
X-ClientProxiedBy: MR2P264CA0107.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b193c5e-6be5-492b-4ca7-08d9992b7d4e
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3370068FDD3B98A1DE319DF38F859@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C1uZdeIWa+u+ulq71U6H2hMMiUNmacANfPeb6IweWSH10YtMUFdxVhRXRsfFsPsUhcoJ9R9+hJYJUeow/KWjBSt5HdmaeOKAfoiEggNLBqbs7Oj2nt2vh+MM4jFzErkFiUiHSgzgcTGdch/gD8cXELwMWSmH3AribpRBm8X3HXLCxCgI0HvutTLn75cgWp5KKuXac8m7v6FHyETlQ2267uYzTNWex6afP9RBnniMS8lxrXO7KJNWltijBs2CN4f2VGyi5QvRcrh6TmJ13vse+VeKZ9SRn7PuvOh7w2uHy4egWx6ImbRu4hB5Ob1KJhzhkl7BREv9GZB25XE+pZ/wDpyN5d2JMHrKZIwME6kzf0mhRxuTz7IHzXvMGwDf86cjbTb9r5jV1ADOqI8C9z3ng8ZHAOOvWzqZnKtc49lfllhedBk/rhhSGwivHZEtTRsE6URubNL64T0vmJSRpicNeioGKWtjSCQQtiXyqdfXPiZexAa09QTF+wOAAmSOWbHxQlkoIaG6SW6UvlBLDVgVF8Dmwr3EpcqfrniJvO41GpLZ58aZpffj+hjIVf95/fbXQ3rcz5GLQ2Crh0Ko81Zi9FIl/rw6OHJ8gI8I6vG1tXG0VREB0Y63912owsY4wRUMcL0A9mRgk4yuvYWeGkdLDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66476007)(26005)(186003)(9686003)(6486002)(2906002)(508600001)(33716001)(956004)(316002)(66946007)(54906003)(5660300002)(6496006)(86362001)(85182001)(6916009)(53546011)(8936002)(82960400001)(4326008)(6666004)(83380400001)(66556008)(38100700002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlNnL1cvd2daRE1QL0l3d2F2YmJKVnRFMEN0dmdoKzl2VnpzUlNhYkdzNERz?=
 =?utf-8?B?L3gyekFrclJEUWg5aVNMUkx4S1hrMVUzVURNWGsyMGdBcHpzbzh6MUJiNGRy?=
 =?utf-8?B?RzZyWHFCaTZwcUFoRTJXd0c3WFBtSXQ1SmNWWlpBVlc0T1c0Vkx6dVh4Nldq?=
 =?utf-8?B?ZnVPYzVxdVJsNnVvN1czZHBGaGtUTnJXTVEzYkgrUWVNU1dtY1ZNZTlpVzd5?=
 =?utf-8?B?aXduc3MzcmVrSjFHZ2JMRG8rbHhhbDdpNE5ac3RrZ1IzeGhjUWZHRmhHZzBN?=
 =?utf-8?B?NWJLemtmaWYrZlFEck5DNXVHcWpIVEhnQkFsK2wzUUdkRjY1QmxhL2l3VkNh?=
 =?utf-8?B?RWpOM3lZTjd5WElEeHBXNjU2MG5tOUdYeWpmMldGdG5pQ1RCdGp1WmlpcE1W?=
 =?utf-8?B?ZnR6ZUpSeHZNUlExc3BKbzdvbEkwQkdxcXduc0ZZbUsveTZPa0Z6a09lWXNH?=
 =?utf-8?B?Uzk5UHROMmVBdTRSZXgzaHQrYzFzSStjbEJiWGdmSkJBV092NlVEb3VleHR1?=
 =?utf-8?B?ZUgyWGJXMkU1bjZTVDNSSVBpVHVHc2x6dmFKSmVtWXFIWWR5VlFoaEthaGJp?=
 =?utf-8?B?WDNkZTA2UUxUYkRSNnJxblNHMFNPY3l3dDVWSVAyazVZTnBlYXBvU0F1WlFX?=
 =?utf-8?B?RXdJRm1CWDdzcC9RQ2NpZm41MElpeUVYOVpkMVhaNWh4Z2luN045eU5JVUlk?=
 =?utf-8?B?RWFBbURZUjhqajBGNzlBaGFudis3MW0zUCtuMEtMcC9kZkltd2k5WVQxS1ho?=
 =?utf-8?B?cy9vM1F1YzRDVXhwSmFzUVpnSnVoZm5Yck5RYnNFa3VjYVF0dUhiT04zd1ZS?=
 =?utf-8?B?Y0xnUlJsb2xKNjdIS3RXTUxqRXhhR1FTcWpheE04bERPQUsvQm1rMndnTlJr?=
 =?utf-8?B?dTFoSENRNDc0Q3ZwQW9IVXBXS0J4WEkremphVTEvdXdDZ0owYThWN21xbkFa?=
 =?utf-8?B?VGxLRjBTckIrUkRIaXBWYU1FcjVURXNWbXNrYWprMkpIZDZrK3ZyN1U4ODk0?=
 =?utf-8?B?aWZLanQ2UTJMSU1zL2lFZUptU2loZjNMUzJDSlN2aUNvQlBGUE5kUWVrbUJp?=
 =?utf-8?B?Yk9ZNm1vQ0JQSkM0b0xha1JOU3A4bHFPVnVkekV3YUNSdEQzaDI1MTl5TnpW?=
 =?utf-8?B?Ym1XcE04MEdyRnpybEdURDF6S0FRRzE2c2xLVHVwMzVDMmc1S1RaQVVEeWgw?=
 =?utf-8?B?bDJWMTFyZlJpdDVIclZTYmt4SlNMZWRqVTF0VDBaVkRWNk9peFBENGRaNXRj?=
 =?utf-8?B?eUN6RU5VMTUwRTlZeWFxMVQra3dWcTdZdEZQVFhVZHNUNmROQy9IbzNFUTRp?=
 =?utf-8?B?SjgwZ2hIdGtHY25hZHh0d0EyMU9ldGg2UDhyeVZMUUh3VWRuYUpPUWJjT25N?=
 =?utf-8?B?U3Naek1ROXQ4R0JBS1U4RUxmVU0wOUo2RFhKYjZmaXNHUWpheW9HM3pSRHU1?=
 =?utf-8?B?TWRENDNvQTZmeXlJa3k2cW96WTV3eFJmWjBlNWloQTNrN2JKUnplZFp2TmZD?=
 =?utf-8?B?d2VnMGE2MGhoNm05RFRtZXZtRXRRaDZqcnFMU0N5VlQ4VmRZNW5uaGp5OUhG?=
 =?utf-8?B?VFRSd0Q1SWdrdm80bW5BM2lLVXllV0JyRE93eloxM0xUWmFUaDhmQXpscUNv?=
 =?utf-8?B?WGZJbkUzUnQ1TW9PTUJXYW5WbHRXVlhkaHpnVzF0M0pDdHNHbVBmUEtoNHI5?=
 =?utf-8?B?VUMvUnFqcWlmTlhtNVh0MzBVLzk2eWJVSVpSNXdFdHVpbGFMeEh2NXNya1Zj?=
 =?utf-8?B?TWZyY0tnKysvcVBBeUxDU3AvQ1ZZQStZeUVkb2NXZ3NwTm1OeWx0UWgwU0Q4?=
 =?utf-8?B?T05FaG10eEEzZ3pNYUcvdlVGb3Y2V1dBclJMTVR3VnlCUDNvT0lJMDIwWnRK?=
 =?utf-8?B?bEJrL2RBOUJRV3ltcmQvTFVOaVRrRk1sZHE0WWxPcDd4anRMQ0piM3ptV0lh?=
 =?utf-8?B?OENhUklLT2Y4QmxzS3RaVlhDb2lWUEEzdHhjMEdFWGt0SWg1Q2ZNdlIyVEZT?=
 =?utf-8?B?STBYS3ZNa2FNZkVXR1d6UllVM0ZvTDJ1SytLT3J5cThVdW1mVVI0Zmw4UlAz?=
 =?utf-8?B?dE9McVR3YUVlZDVtcW5xZUZiTUZiaS9YMnVkWXVUOFN1dVJwOVlRTXhoVTAw?=
 =?utf-8?B?VHF5RlN2SERleWlEdU5wQ2VVU0hXVHVCMzM1dW9uOFJqejZtSjF0cGlQNGlk?=
 =?utf-8?Q?R89yDxNXlusopbNpTajWWeU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b193c5e-6be5-492b-4ca7-08d9992b7d4e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 09:23:51.6962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5I6G0SKVFNrje7LyvfskW3FWyGOMrIFYGyi2lgEelQAXnA+Y7X2OT6tfAijM0K+9o+P4RpCsuY6+yo6ivnK+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Wed, Oct 27, 2021 at 09:04:39AM +0000, Oleksandr Andrushchenko wrote:
> Hi, Roger!
> 
> On 27.10.21 11:59, Roger Pau Monné wrote:
> > On Wed, Oct 27, 2021 at 11:25:33AM +0300, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> While in vPCI MMIO trap handlers for the guest PCI host bridge it is not
> >> enough for SBDF translation to simply call VPCI_ECAM_BDF(info->gpa) as
> >> the base address may not be aligned in the way that the translation
> >> always work.
> > I think I've already raised this during review [0]. But this is only a
> > problem if you change the current value of GUEST_VPCI_ECAM_BASE
> > AFAICT, as the current value has bits [0,27] clear.
> Exactly, so we were just lucky not to hit this before
> >
> > I assume this is a problem for the hardware domain that needs to trap
> > random base addresses as present on hardware, but that code hasn't
> > been committed yet.
> Yes, I am facing this on the real HW when Dom0's access is trapped
> and the base is not taken into account. So, I have a patch for the
> future upstream which subtracts the relevant base from the gpa,
> e.g. either GUEST_VPCI_ECAM_BASE or bridge->cfg->phys_addr
> >
> > If that's indeed the case, please expand the commit message to contain
> > this information.
> I can only mention about "the current value of GUEST_VPCI_ECAM_BASE
> AFAICT, as the current value has bits [0,27] clear" as of now because
> Dom0 traps are not yet there.

Indeed, I would rather mention both cases, ie:

"This change is not strictly required given the current value of
GUEST_VPCI_ECAM_BASE which has bits 0 to 27 clear, but could cause
issues if such value is changed, or when handlers for dom0 ECAM
regions are added as those will be mapped over existing hardware
regions that could use non-aligned base addresses."

Regards, Roger.

