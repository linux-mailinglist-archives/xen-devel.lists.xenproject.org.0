Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6972131DC79
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 16:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86328.162019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCOuB-0004eg-UJ; Wed, 17 Feb 2021 15:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86328.162019; Wed, 17 Feb 2021 15:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCOuB-0004eH-QZ; Wed, 17 Feb 2021 15:38:19 +0000
Received: by outflank-mailman (input) for mailman id 86328;
 Wed, 17 Feb 2021 15:38:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrto=HT=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lCOuA-0004eA-18
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 15:38:18 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dd6f48e-e634-4dc3-a13e-c35fa940d2ad;
 Wed, 17 Feb 2021 15:38:15 +0000 (UTC)
Received: from AM0PR10CA0017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::27)
 by AS8PR08MB6743.eurprd08.prod.outlook.com (2603:10a6:20b:399::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 17 Feb
 2021 15:38:13 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:17c:cafe::a4) by AM0PR10CA0017.outlook.office365.com
 (2603:10a6:208:17c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Wed, 17 Feb 2021 15:38:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Wed, 17 Feb 2021 15:38:13 +0000
Received: ("Tessian outbound e7cb4a6f0881:v71");
 Wed, 17 Feb 2021 15:38:12 +0000
Received: from 68169c2f96a3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4FB785DD-2CB2-4365-8369-0B2841FA733B.1; 
 Wed, 17 Feb 2021 15:37:55 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68169c2f96a3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 17 Feb 2021 15:37:54 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5295.eurprd08.prod.outlook.com (2603:10a6:803:e3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 17 Feb
 2021 15:37:53 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3846.042; Wed, 17 Feb 2021
 15:37:53 +0000
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
X-Inumbo-ID: 7dd6f48e-e634-4dc3-a13e-c35fa940d2ad
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9z5DojfRds/MZyMmVcgqQxaHneUZe/0lwMvjpw8rlo=;
 b=Zb6wpNYV1b7ruX+jLvjuczpyQp71gyDOojuzJjVpL6FtQmFwBHXuHrXsp63IvvXCmvyGdnSI6ctFQ1AJ54ZybHxKiLK15UxZTzm4rbP05ioimjtndMkMOSFHaHB9Jxmo/IDZrp43fgAErYeJ8DEbst9b/+gd//s4Wak+zYD6siw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 77254a5e94b361a9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+AU3WQZN4708/B7WWGopUp9Kk4tXntb5D0LtGzTQ9U1ds6tZZFso5Q84zHxC81N348cwwBJKxz6Ct9BxFggkkHZpzYq36Gi5mBYz8EiWja3f0LwFglKikEkro/4RWzL88gDRztY+xI0daH+0Jvi5LTp+AxBUhNEw52Q68c8VEKzMDEuw5iRRRJASTL+shTUaFXSSrzwqD52tbSp+gybkhVc483SYGk828iLPduDbgASnkA9P4Dg9UoKhuoCjTNXA0YLpiMG3qHdmxZhNhPMXsdlzWdCMiS5ncaUMjE6MAxuw8S2CpBT/oQALAq0l91C+igkKO4AIiAJN6NvdrKN8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9z5DojfRds/MZyMmVcgqQxaHneUZe/0lwMvjpw8rlo=;
 b=K96aGYuJSVaKAE0OmEgLJgVqua0JxsOJJ/oRe7O2nh8DieLquBHb2EHGYivVyn3zN++tvu4HbU0ty2QRlzoh/+iE5ReG5QUtWm36Hbl4Hx3NfZrMu/1PsO/Y1Ig7H1kdJ63ZWTtFV7fKLQKbNfZkInitwOHaPzaMydFCcJhRySQia7ZRc2RN1p9wHhekD03yCz6yhjv63Dcd2pR8DOQIzn7NGQy1HuAKvw9l+m8biCJxmjDExHt+SpbxIGlht1kfHEkRJLr1sQ4uaIikrJZDEYzhfaMQmQx4PstMybTYi3yHN49XEEnlze0NeK7nUvvFfYnSnPqjJE2HO5tAJmaPPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9z5DojfRds/MZyMmVcgqQxaHneUZe/0lwMvjpw8rlo=;
 b=Zb6wpNYV1b7ruX+jLvjuczpyQp71gyDOojuzJjVpL6FtQmFwBHXuHrXsp63IvvXCmvyGdnSI6ctFQ1AJ54ZybHxKiLK15UxZTzm4rbP05ioimjtndMkMOSFHaHB9Jxmo/IDZrp43fgAErYeJ8DEbst9b/+gd//s4Wak+zYD6siw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
Thread-Topic: [RFC] xen/arm: introduce XENFEAT_ARM_dom0_iommu
Thread-Index: AQHXBNDUDoMffJM9X0qFA5iW4kfZOqpcCj0AgABx1gA=
Date: Wed, 17 Feb 2021 15:37:53 +0000
Message-ID: <505CE19F-B324-4DE2-8EC4-D885780FD17A@arm.com>
References: <alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s>
 <2d22d5b8-6cda-f27b-e938-4806b65794a5@xen.org>
In-Reply-To: <2d22d5b8-6cda-f27b-e938-4806b65794a5@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 24beb32e-a4ad-420b-fb8d-08d8d35a0961
x-ms-traffictypediagnostic: VI1PR08MB5295:|AS8PR08MB6743:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6743AC3D882DDF1425CB01269D869@AS8PR08MB6743.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3cVu1sYVKoWGRRwWuEPTBqW0xF+J4VqIyFcqwU5UvSdmdqnrhsyQ5c9nWKGvQPjtxw6E8DRvy9Rd4NWqZ82P57rOAAZi8xQUB1oYwQfRMwJfqvn2Y+FyM6jKx3qceD0C3Ew5jyWApbzdFPd4T3xbeBUBd6ctxZI1mj4LE+Bx5MJL3f0DMOxYqpwihMyD4SlCQcP3WEF4rMtIhELZkPenCKqmp/ojpcQoO1UlZ8ICKT49PvosssOggAleLEtzUP1In4VtdUnLX8JhkZp4/WvET0824T4yTp+BODpAEjsJYvgE/j3ddctwc7etWvSjSKDI82UzI68f6hVCnGTPQuOqqoGy0AubgvydUmUCoUs3tLoShlu8Nv3O0/zph6aBSglO49KAWk41J+7uy13ej0NORLxPg94eCJtTnFON6apHYxyoPMmYqqDDdD+gdhbtLdqV3Q7Udoa5l511YYzpvBxrH7YQv+zP8myKAjwpVw4NDF4tQhAILBkE2LGzaYHxOxapG0hiGW73S8wcmSbTvV4PjblGiUl5BwWrX2ozHF+XZEG0wDI+onOtw8iMKx00TvZQRrkElvUdNwTBjuQR2n6q4A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(83380400001)(53546011)(5660300002)(6506007)(86362001)(186003)(6916009)(2906002)(6512007)(4326008)(478600001)(6486002)(54906003)(71200400001)(76116006)(36756003)(91956017)(66446008)(66476007)(66556008)(64756008)(33656002)(8936002)(66946007)(55236004)(26005)(2616005)(8676002)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?bGdOQjR5WEx1Nncwc0xjR1RZWGdkdHNIU25TeUZxL0ZFTWhBQlY0alZ2T21O?=
 =?utf-8?B?NG1uZ2YrTHJZbzA2bWltWk5ZZWNZVEdjRHVMUFZPYnNXL3pqN2ZxL3ZvQVR0?=
 =?utf-8?B?NnRETXRrYkIxOXNXUzZLSmZRdEgyazRpNTFSRDFsNVpoREZYTzdreVQxcE41?=
 =?utf-8?B?dkRaOE9wVEpja3VhV1g0KzkwK05jb29lWUlsdmFNUXp0WUcxNmFHQ0xaL1Fo?=
 =?utf-8?B?L2JTWkFEcjNqaFFzNWZRWWxhR0xmVVJzalc5UG83Rmc5bSttQW9ZWkRDSU03?=
 =?utf-8?B?Rld2TW5heUJPZDJJRkJpWDJGcStCNElyNnF6dWVJOFYrRkZTZiswZEYwV1hD?=
 =?utf-8?B?eDVTN1Nvei92UmZtMEh0QU5nMldNVnU0RW5sc0swakdxc1Q4NjAvVkJmK0xj?=
 =?utf-8?B?U00wNXphVHFtZW8ycXZDNGV3cjU1YU5GUGdLMjhoUjczRTJlb1NKU1dBdjJ6?=
 =?utf-8?B?M2lTTlBWMG9QeUQ4c2JJNFd4dVJNNHFLa1ZaNEhoYlA2clM1MWs5WlhMdE4y?=
 =?utf-8?B?NXlMRElmYkhnZWZkR1FSYlh1ZEM2aGQxVGtxaDJ0QmdvOFdmb0VueG5CL2FU?=
 =?utf-8?B?MXpSdW5HM1dvUkt5cG1jcDE3WDhqc2xvZllxdmpDNjBaL1U1dzRTemxmdjM2?=
 =?utf-8?B?ZFhnOURnYmhsb0FqVGk3ci80VFZrcmxncDdhaUYxdURiSXdpTHFDT0J1OWZB?=
 =?utf-8?B?U0NieElLcFh5QUFCYWtsWGZ3UGpibE8yRlNSMjZwR281eHFUVnNyVlVsSVM3?=
 =?utf-8?B?UzhxZEVKN0pzd3h0OUtzaHVrOHpQaHcrNVkydHRMT3ZQc1c0Y0VyT1ZYaHBH?=
 =?utf-8?B?UDZsOXNRaVUrcDI4OGRBVTROUDlkYkF4MVB4UUtndktRSVgrNnhFK3c4cWtt?=
 =?utf-8?B?OVJPOGYrL1ZvTWF0bERvZnMxZmN4Zm9XU2lUMzZCNjR1UDFPdnUxSjA5UG9p?=
 =?utf-8?B?aGhkTUg0RUNBMVFBT1BUU0c3ZE5qZVlkZjI0L0I2bzRoUXhjNCtLa1dqMmo2?=
 =?utf-8?B?RHZ0VFNxdFJnbjJlMFhCWGNPZEtuMy9wbWF0LzZEMXV5ajgrZ0VTTVFnZGll?=
 =?utf-8?B?RStibEh6RVJrRVY5MDk4clNvcFdjbG5Ec3l4SlZWQWtoUWxDTlp3L0EyWnND?=
 =?utf-8?B?ZFNKWVVHUnFVVTVsT2ErVnRleXd2NjNWYWZ2enRJRUFLbWhXMzdHa0puSnFF?=
 =?utf-8?B?ZUQ2ajVFakIzaThpVElVTkN6SkRWRGgrQkMzNDM4SDFIS3pIWHZ4SVVvb09Z?=
 =?utf-8?B?NEJ3M0lqMGI0UGRhY0JPQVI5UHBvNUFJSGpjdUdTc3o3S0Zxa05CN2NNK3lP?=
 =?utf-8?B?Q01lbzNyWm10dnJTK01NQVVzb0pBOGttK05PVmVmYnZRendGQ0FOK1hpL2tr?=
 =?utf-8?B?VUhNa1JXbHNmdlNncDNCMHAxMjlVdG80TW5ndEVyaVVHSS8zZzk0ZnVMdlN0?=
 =?utf-8?B?ZEZkT09TY1BHU2w3UUVxc0NzdzZBYTl2TldhZlh2MDNnbGxITzdkUGxLNDgx?=
 =?utf-8?B?K0ZWcnE4YkRVY3lFYXBvRzhuOTRrSDBsbS80ZS8vQnJXT1JKQThSYVNSbytM?=
 =?utf-8?B?ME9ZaTYxMlBaVjMvUzJ1TjhCNmNHVW9VTUlleHRUQm1ER1V2UDJMbXQxNnNQ?=
 =?utf-8?B?UjF3Z09Pa05lLzdwT0FXT01KK1BqK25LekJWaXFxNTZ1bTNJcGhzK2k4N2Y2?=
 =?utf-8?B?bGhXclZrbEVxZkMzM0xnRVhyQlFET1ZqaHpRK3pZVHByYjc3dkVhYStid2p1?=
 =?utf-8?Q?WAJX9FU9G57JxmHqXmsaI+qhjFFr9m2UIvRh8hX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE2959492815A041A11E0860008AA97E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5295
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eec8377b-cb7c-41e2-1c0d-08d8d359fd9f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iBMHPBCAYtACw69A9oSUOphV8fT7N2xUKtSX1jUY09bJzC8Iad0FECAZJtwJ7Whp042VSLNOLW6AMK6III0JnIJiLQ1NbICY8FwLaofueOkouby6o8NjFjNxrwZLziXR0d51y+hVnrkSHfHzQSEi0WPoE1Q1PjcdtFUGG6z237Mmh5dESmiPsYXSmVIYQZ/NCp6/Is9wlYiZtGSk7iR+MUpBbQ419chq7OsvbrO+BRnMOyr3ZCTFHtdKMF/+qxG4Wh30KPSXT/G9CoiNtc4v4+mirZVE6RaH8RkfXsYuiYAy8GBvfFGz5zb3NFeiBv9TGh7U6HvTtNrHHNZQjJ8OZFSqAFoTSK2Rfw21ZY49izJkzj0QGMmmElqAjIsGs63S5woB/psg0p+XV0+yR3Adc3mJ/vIojINj0AmYijQV1GLsxuOE4xva+EXmHvBJvlOUGsjk3oJFjkUu/AiQUzMeCIn0i3pf69mWL2Pr4tMkjuhT15G5wYyBdvaVcx7uYcwCPc2fQLAXgvJ1l8BybM4w4jCvhjmIJPtsHo9QePZpaJDKOjbtTaxy186FV8OQ+ooD/VCUwc32MAPujqPgpLrs9EO842WWsMF8kC831Fr4XDkj01HyK77mcgB9ELWdfxanAd00L7ypFisV+xXKyCWq80U+OYCjkpBGgYSZ8nn0ATg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(36840700001)(46966006)(4326008)(8936002)(8676002)(6862004)(55236004)(5660300002)(6486002)(53546011)(6512007)(2616005)(86362001)(54906003)(478600001)(26005)(70586007)(70206006)(316002)(186003)(82310400003)(6506007)(36860700001)(36756003)(2906002)(336012)(33656002)(47076005)(356005)(83380400001)(82740400003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 15:38:13.0159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24beb32e-a4ad-420b-fb8d-08d8d35a0961
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6743

SGkgSnVsaWVuLA0KDQo+IE9uIDE3IEZlYiAyMDIxLCBhdCAwODo1MCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDE3LzAyLzIwMjEgMDI6MDAs
IFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4+IEhpIGFsbCwNCj4+IFRvZGF5IExpbnV4IHVz
ZXMgdGhlIHN3aW90bGIteGVuIGRyaXZlciAoZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYykgdG8N
Cj4+IHRyYW5zbGF0ZSBhZGRyZXNzZXMgZm9yIERNQSBvcGVyYXRpb25zIGluIERvbTAuIFNwZWNp
ZmljYWxseSwNCj4+IHN3aW90bGIteGVuIGlzIHVzZWQgdG8gdHJhbnNsYXRlIHRoZSBhZGRyZXNz
IG9mIGEgZm9yZWlnbiBwYWdlIChhIHBhZ2UNCj4+IGJlbG9uZ2luZyB0byBhIGRvbVUpIG1hcHBl
ZCBpbnRvIERvbTAgYmVmb3JlIHVzaW5nIGl0IGZvciBETUEuDQo+PiBUaGlzIGlzIGltcG9ydGFu
dCBiZWNhdXNlIGFsdGhvdWdoIERvbTAgaXMgMToxIG1hcHBlZCwgRG9tVXMgYXJlIG5vdC4gT24N
Cj4+IHN5c3RlbXMgd2l0aG91dCBhbiBJT01NVSBzd2lvdGxiLXhlbiBlbmFibGVzIFBWIGRyaXZl
cnMgdG8gd29yayBhcyBsb25nDQo+PiBhcyB0aGUgYmFja2VuZHMgYXJlIGluIERvbTAuIFRoYW5r
cyB0byBzd2lvdGxiLXhlbiwgdGhlIERNQSBvcGVyYXRpb24NCj4+IGVuZHMgdXAgdXNpbmcgdGhl
IE1GTiwgcmF0aGVyIHRoYW4gdGhlIEdGTi4NCj4+IE9uIHN5c3RlbXMgd2l0aCBhbiBJT01NVSwg
dGhpcyBpcyBub3QgbmVjZXNzYXJ5OiB3aGVuIGEgZm9yZWlnbiBwYWdlIGlzDQo+PiBtYXBwZWQg
aW4gRG9tMCwgaXQgaXMgYWRkZWQgdG8gdGhlIERvbTAgcDJtLiBBIG5ldyBHRk4tPk1GTiB0cmFu
c2xhdGlvbg0KPj4gaXMgZW5zdGFibGlzaGVkIGZvciBib3RoIE1NVSBhbmQgU01NVS4gRG9tMCBj
b3VsZCBzYWZlbHkgdXNlIHRoZSBHRk4NCj4+IGFkZHJlc3MgKGluc3RlYWQgb2YgdGhlIE1GTikg
Zm9yIERNQSBvcGVyYXRpb25zIGFuZCB0aGV5IHdvdWxkIHdvcmsuIEl0DQo+PiB3b3VsZCBiZSBt
b3JlIGVmZmljaWVudCB0aGFuIHVzaW5nIHN3aW90bGIteGVuLg0KPj4gSWYgeW91IHJlY2FsbCBt
eSBwcmVzZW50YXRpb24gZnJvbSBYZW4gU3VtbWl0IDIwMjAsIFhpbGlueCBpcyB3b3JraW5nIG9u
DQo+PiBjYWNoZSBjb2xvcmluZy4gV2l0aCBjYWNoZSBjb2xvcmluZywgbm8gZG9tYWluIGlzIDE6
MSBtYXBwZWQsIG5vdCBldmVuDQo+PiBEb20wLiBJbiBhIHNjZW5hcmlvIHdoZXJlIERvbTAgaXMg
bm90IDE6MSBtYXBwZWQsIHN3aW90bGIteGVuIGRvZXMgbm90DQo+PiB3b3JrIGFzIGludGVuZGVk
Lg0KPj4gVGhlIHN1Z2dlc3RlZCBzb2x1dGlvbiBmb3IgYm90aCB0aGVzZSBpc3N1ZXMgaXMgdG8g
YWRkIGEgbmV3IGZlYXR1cmUNCj4+IGZsYWcgIlhFTkZFQVRfQVJNX2RvbTBfaW9tbXUiIHRoYXQg
dGVsbHMgRG9tMCB0aGF0IGl0IGlzIHNhZmUgbm90IHRvIHVzZQ0KPj4gc3dpb3RsYi14ZW4gYmVj
YXVzZSBJT01NVSB0cmFuc2xhdGlvbnMgYXJlIGF2YWlsYWJsZSBmb3IgRG9tMC4gSWYNCj4+IFhF
TkZFQVRfQVJNX2RvbTBfaW9tbXUgaXMgc2V0LCBMaW51eCBzaG91bGQgc2tpcCB0aGUgc3dpb3Rs
Yi14ZW4NCj4+IGluaXRpYWxpemF0aW9uLiBJIGhhdmUgdGVzdGVkIHRoaXMgc2NoZW1lIHdpdGgg
YW5kIHdpdGhvdXQgY2FjaGUNCj4+IGNvbG9yaW5nIChoZW5jZSB3aXRoIGFuZCB3aXRob3V0IDE6
MSBtYXBwaW5nIG9mIERvbTApIG9uIFpDVTEwMiBhbmQgaXQNCj4+IHdvcmtzIGFzIGV4cGVjdGVk
OiBETUEgb3BlcmF0aW9ucyBzdWNjZWVkLg0KPj4gV2hhdCBhYm91dCBzeXN0ZW1zIHdoZXJlIGFu
IElPTU1VIGlzIHByZXNlbnQgYnV0IG5vdCBhbGwgZGV2aWNlcyBhcmUNCj4+IHByb3RlY3RlZD8N
Cj4+IFRoZXJlIGlzIG5vIHdheSBmb3IgWGVuIHRvIGtub3cgd2hpY2ggZGV2aWNlcyBhcmUgcHJv
dGVjdGVkIGFuZCB3aGljaA0KPj4gb25lcyBhcmUgbm90OiBkZXZpY2VzIHRoYXQgZG8gbm90IGhh
dmUgdGhlICJpb21tdXMiIHByb3BlcnR5IGNvdWxkIG9yDQo+PiBjb3VsZCBub3QgYmUgRE1BIG1h
c3RlcnMuDQo+PiBQZXJoYXBzIFhlbiBjb3VsZCBwb3B1bGF0ZSBhIHdoaXRlbGlzdCBvZiBkZXZp
Y2VzIHByb3RlY3RlZCBieSB0aGUgSU9NTVUNCj4+IGJhc2VkIG9uIHRoZSAiaW9tbXVzIiBwcm9w
ZXJ0eS4gSXQgd291bGQgcmVxdWlyZSBzb21lIGFkZGVkIGNvbXBsZXhpdHkNCj4+IGluIFhlbiBh
bmQgZXNwZWNpYWxseSBpbiB0aGUgc3dpb3RsYi14ZW4gZHJpdmVyIGluIExpbnV4IHRvIHVzZSBp
dCwNCj4+IHdoaWNoIGlzIG5vdCBpZGVhbC4NCj4gDQo+IFlvdSBhcmUgdHJhZGluZyBhIGJpdCBt
b3JlIGNvbXBsZXhpdHkgaW4gWGVuIGFuZCBMaW51eCB3aXRoIGEgdXNlciB3aWxsIG1heSBub3Qg
YmUgYWJsZSB0byB1c2UgdGhlIGh5cGVydmlzb3Igb24gaGlzL2hlciBwbGF0Zm9ybSB3aXRob3V0
IGEgcXVpcmsgaW4gWGVuIChzZWUgbW9yZSBiZWxvdykuDQo+IA0KPj4gSG93ZXZlciwgdGhpcyBh
cHByb2FjaCB3b3VsZCBub3Qgd29yayBmb3IgY2FjaGUNCj4+IGNvbG9yaW5nIHdoZXJlIGRvbTAg
aXMgbm90IDE6MSBtYXBwZWQgc28gdGhlIHN3aW90bGIteGVuIHNob3VsZCBub3QgYmUNCj4+IHVz
ZWQgZWl0aGVyIHdheQ0KPiANCj4gTm90IGFsbCB0aGUgRG9tMCBMaW51eCBrZXJuZWwgd2lsbCBi
ZSBhYmxlIHRvIHdvcmsgd2l0aCBjYWNoZSBjb2xvdXJpbmcuIFNvIHlvdSB3aWxsIG5lZWQgYSB3
YXkgZm9yIHRoZSBrZXJuZWwgdG8gc2F5ICJIZXkgSSBhbSBjYW4gYXZvaWQgdXNpbmcgc3dpb3Rs
YiIuDQoNCkkgZnVsbHkgYWdyZWUgYW5kIGZyb20gbXkgY3VycmVudCB1bmRlcnN0YW5kaW5nIHRo
ZSBjb25kaXRpb24gaXMg4oCcaGF2aW5nIGFuIGlvbW114oCdLg0KDQo+IA0KPj4gRm9yIHRoZXNl
IHJlYXNvbnMsIEkgd291bGQgbGlrZSB0byBwcm9wb3NlIGEgc2luZ2xlIGZsYWcNCj4+IFhFTkZF
QVRfQVJNX2RvbTBfaW9tbXUgd2hpY2ggc2F5cyB0aGF0IHRoZSBJT01NVSBjYW4gYmUgcmVsaWVk
IHVwb24gZm9yDQo+PiBETUEgdHJhbnNsYXRpb25zLiBJbiBzaXR1YXRpb25zIHdoZXJlIGEgRE1B
IG1hc3RlciBpcyBub3QgU01NVQ0KPj4gcHJvdGVjdGVkLCBYRU5GRUFUX0FSTV9kb20wX2lvbW11
IHNob3VsZCBub3QgYmUgc2V0LiBGb3IgZXhhbXBsZSwgb24gYQ0KPj4gcGxhdGZvcm0gd2hlcmUg
YW4gSU9NTVUgaXMgcHJlc2VudCBhbmQgcHJvdGVjdHMgbW9zdCBETUEgbWFzdGVycyBidXQgaXQN
Cj4+IGlzIGxlYXZpbmcgb3V0IHRoZSBNTUMgY29udHJvbGxlciwgdGhlbiBYRU5GRUFUX0FSTV9k
b20wX2lvbW11IHNob3VsZA0KPj4gbm90IGJlIHNldCAoYmVjYXVzZSBQViBibG9jayBpcyBub3Qg
Z29pbmcgdG8gd29yayB3aXRob3V0IHN3aW90bGIteGVuLikNCj4+IFRoaXMgYWxzbyBtZWFucyB0
aGF0IGNhY2hlIGNvbG9yaW5nIHdvbid0IGJlIHVzYWJsZSBvbiBzdWNoIGEgc3lzdGVtIChhdA0K
Pj4gbGVhc3Qgbm90IHVzYWJsZSB3aXRoIHRoZSBNTUMgY29udHJvbGxlciBzbyB0aGUgc3lzdGVt
IGludGVncmF0b3Igc2hvdWxkDQo+PiBwYXkgc3BlY2lhbCBjYXJlIHRvIHNldHVwIHRoZSBzeXN0
ZW0pLg0KPj4gSXQgaXMgd29ydGggbm90aW5nIHRoYXQgaWYgd2Ugd2FudGVkIHRvIGV4dGVuZCB0
aGUgaW50ZXJmYWNlIHRvIGFkZCBhDQo+PiBsaXN0IG9mIHByb3RlY3RlZCBkZXZpY2VzIGluIHRo
ZSBmdXR1cmUsIGl0IHdvdWxkIHN0aWxsIGJlIHBvc3NpYmxlLiBJdA0KPj4gd291bGQgYmUgY29t
cGF0aWJsZSB3aXRoIFhFTkZFQVRfQVJNX2RvbTBfaW9tbXUuDQo+IA0KPiBJIGltYWdpbmUgYnkg
Y29tcGF0aWJsZSwgeW91IG1lYW4gWEVORkVBVF9BUk1fZG9tMF9pb21tdSB3b3VsZCBiZSBjbGVh
cmVkIGFuZCBpbnN0ZWFkIHRoZSBkZXZpY2UtdHJlZSBsaXN0IHdvdWxkIGJlIHVzZWQuIElzIHRo
YXQgY29ycmVjdD8NCg0KV2hhdCBkbyB5b3UgbWVhbiBieSBkZXZpY2UgdHJlZSBsaXN0IGhlcmUg
Pw0KDQo+IA0KPj4gSG93IHRvIHNldCBYRU5GRUFUX0FSTV9kb20wX2lvbW11Pw0KPj4gV2UgY291
bGQgc2V0IFhFTkZFQVRfQVJNX2RvbTBfaW9tbXUgYXV0b21hdGljYWxseSB3aGVuDQo+PiBpc19p
b21tdV9lbmFibGVkKGQpIGZvciBEb20wLiBXZSBjb3VsZCBhbHNvIGhhdmUgYSBwbGF0Zm9ybSBz
cGVjaWZpYw0KPj4gKHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvKSBvdmVycmlkZSBzbyB0aGF0IGEg
c3BlY2lmaWMgcGxhdGZvcm0gY2FuDQo+PiBkaXNhYmxlIFhFTkZFQVRfQVJNX2RvbTBfaW9tbXUu
IEZvciBkZWJ1Z2dpbmcgcHVycG9zZXMgYW5kIGFkdmFuY2VkDQo+PiB1c2VycywgaXQgd291bGQg
YWxzbyBiZSB1c2VmdWwgdG8gYmUgYWJsZSB0byBvdmVycmlkZSBpdCB2aWEgYSBYZW4NCj4+IGNv
bW1hbmQgbGluZSBwYXJhbWV0ZXIuDQo+IFBsYXRmb3JtIHF1aXJrcyBzaG91bGQgYmUgYXJlIGxp
bWl0ZWQgdG8gYSBzbWFsbCBzZXQgb2YgcGxhdGZvcm1zLg0KPiANCj4gSW4gdGhpcyBjYXNlLCB0
aGlzIHdvdWxkIG5vdCBiZSBvbmx5IHBlci1wbGF0Zm9ybSBidXQgYWxzbyBwZXItZmlybXdhcmUg
dGFibGUgYXMgYSBkZXZlbG9wZXIgY2FuIGRlY2lkZSB0byByZW1vdmUvYWRkIElPTU1VIG5vZGVz
IGluIHRoZSBEVCBhdCBhbnkgdGltZS4NCj4gDQo+IEluIGFkZGl0aW9uIHRvIHRoYXQsIGl0IG1l
YW5zIHdlIGFyZSBpbnRyb2R1Y2luZyBhIHJlZ3Jlc3Npb24gZm9yIHRob3NlIHVzZXJzIGFzIFhl
biA0LjE0IHdvdWxkIGhhdmUgd29ya2VkIG9uIHRoZXJlIHBsYXRmb3JtIGJ1dCBub3QgYW55bW9y
ZS4gVGhleSB3b3VsZCBuZWVkIHRvIGdvIHRocm91Z2ggYWxsIHRoZSBub2RlcyBhbmQgZmluZCBv
dXQgd2hpY2ggb25lIGlzIG5vdCBwcm90ZWN0ZWQuDQoNCkkgYW0gbm90IHN1cmUgaSB1bmRlcnN0
YW5kIHlvdXIgcG9pbnQgaGVyZSBhcyB3ZSBjYW5ub3QgZGV0ZWN0IGlmIGEgZGV2aWNlIGlzIHBy
b3RlY3RlZCBvciBub3QgYnkgYW4gSU9NTVUgYXMgd2UgZG8gbm90IGtub3cgd2hpY2ggZGV2aWNl
IHJlcXVpcmVzIG9uZS4NCkNvdWxkIHlvdSBleHBsYWluIHdoYXQgdXNlIGNhc2Ugd29ya2luZyBi
ZWZvcmUgd291bGQgbm90IHdvcmsgaGVyZSA/DQoNCj4gDQo+IFRoaXMgaXMgYSBiaXQgb2YgYSBk
YXVudGluZyB0YXNrIGFuZCB3ZSBhcmUgZ29pbmcgdG8gZW5kIHVwIGhhdmluZyBhIGxvdCBvZiBw
ZXItcGxhdGZvcm0gcXVpcmsgaW4gWGVuLg0KDQpGcm9tIG15IHVuZGVyc3RhbmRpbmcgdGhlIHF1
aXJrcyBoZXJlIHdvdWxkIGJlIGluIExpbnV4IGFzIGl0IHdvdWxkIGhhdmUgdG8gZGVjaWRlIGZv
ciB3aGF0IHRvIHVzZSBzd2lvdGxiIG9yIG5vdC4NCldoYXQgcXVpcmsgZG8geW91IGltYWdpbmUg
d2UgY291bGQgaW1wbGVtZW50IGluIFhlbiA/DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4g
U28gdGhpcyBhcHByb2FjaCBzZWxlY3RpbmcgdGhlIGZsYWcgaXMgYSBuby1nbyBmb3IgbWUuIEZB
T0QsIHRoZSBpbnZlcnRlZCBpZGVhIChpLmUuIG9ubHkgc2V0dGluZyBYRU5GRUFUX0FSTV9kb20w
X2lvbW11IHBlci1wbGF0Zm9ybSkgaXMgYSBubyBnbyBhcyB3ZWxsLg0KPiANCj4gSSBkb24ndCBo
YXZlIGEgZ29vZCBpZGVhIGhvdyB0byBzZXQgdGhlIGZsYWcgYXV0b21hdGljYWxseS4gTXkgcmVx
dWlyZW1lbnQgaXMgbmV3ZXIgWGVuIHNob3VsZCBjb250aW51ZSB0byB3b3JrIG9uIGFsbCBzdXBw
b3J0ZWQgcGxhdGZvcm1zIHdpdGhvdXQgYW55IGFkZGl0aW9uYWwgcGVyLXBsYXRmb3JtIGVmZm9y
dC4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

