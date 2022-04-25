Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7A350E0EB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 14:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312890.530291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyJA-0003N9-Dq; Mon, 25 Apr 2022 12:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312890.530291; Mon, 25 Apr 2022 12:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niyJA-0003Ki-Aw; Mon, 25 Apr 2022 12:59:16 +0000
Received: by outflank-mailman (input) for mailman id 312890;
 Mon, 25 Apr 2022 12:59:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2itc=VD=citrix.com=prvs=107928106=roger.pau@srs-se1.protection.inumbo.net>)
 id 1niyJ8-0003Kc-Og
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 12:59:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8072877f-c497-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 14:59:13 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Apr 2022 08:59:10 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB5734.namprd03.prod.outlook.com (2603:10b6:510:41::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 12:59:09 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 12:59:08 +0000
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
X-Inumbo-ID: 8072877f-c497-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650891553;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=kczc593QPFPDyUXv5pbci64pg4O9zshNt3kH9RRv9sk=;
  b=Ma/izKwA7OsGy5gN166yeFVvl1oHkgJFiTfqmiF/VERo/ET39DVp1fG7
   OYFdIJqsqEDcQsz8TLpqgxRLigelhzhtpOWAP4cQe+m1pEfHZ1UtfrNCQ
   8AjeG3Ni+flZZExjkgA11VelqdVRk7egmEg0ikvq7zlTHJSUloJDaJP69
   w=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 69874314
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HZ4Wn6t7onhtTQqoYVk6IeOF2OfnVFJfMUV32f8akzHdYApBsoF/q
 tZmKWGFa/rfZTPzeYh+a9ixoE8E6JaAzNFgTVRurig0Qy4Q+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1/X5
 IuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8jO/DNqsctfCNGLABENI5e/o/GBCCg5Jn7I03uKxMAwt1IJWRvZ8g9xbwyBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4EGmmtv7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9gPF+vZsujS7IApZ8IbTHPXuQvGwAsRknEHDh
 1Oc0TTFO0RPXDCY4X/fmp62vcfNly7mXIMZFJWj6+VnxlaUwwQ7GBAQEFe2v/S9okq/QM5Eb
 VwZ/DI0qqo//1DtScPyNzWnpFaUsxhaXMBfe8U45xuK0bH8+BuCCy4PSTspVTA9nMo/RDhv0
 0DTmdrsXGZrqOfNFS3b8aqIpzSvPyRTNXUFeSIPUQoC5Z/kvZ03iRXMCN1kFcZZk+HIJN05+
 BjSxABWulnZpZRjO3mTlbwfvw+Rmw==
IronPort-HdrOrdr: A9a23:yPlUFqPhSOCfO8BcT4/255DYdb4zR+YMi2TDiHoBKiC9I/b5qy
 nxppUmPEfP+UYssQIb8+xoWZPsfZq4z/IFg7X5Uo3SIjUO1FHYSr2KzLGSvgEIeBeOsdK1t5
 0QApSWYeeYZTMU47eekW3IdOrIqOP3oJxAqt2usEuFJjsaE52Imj0JcDpzZXcGPzWua6BJba
 Z0z/A34QaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnA4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlMFtyssHfyWG1SYczegNkHmpDy1L/sqq
 iSn/4UBbUo15oWRBDqnfKi4Xiw7N9k0Q6Q9bbRuwqQnSW+fkNoNyM7v/MkTvKR0TtXgDmlvZ
 g7ql5wbPdsfGT9dP6R3am9azh60kWzunYsiugVkjhWVpYfcqZYqcgF8FpSC4poJlO51GmJKp
 giMCjw3ocXTbqhVQGbgoCv+q3iYl0jWhOdBkQSsM2c1DZb2Hh/0ksD3cQa2nMN7og0RZVI7/
 nNdv0ArsALcuYGKaZmQOsRS8q+DWLABRrKLWKJOFziUKUKIWjEpZL76Kg8oOuqZJsLxp0vn4
 mpaiIciUciP0b1TcGe1pxC9R7ABG27QDT208lbo4N0v7XtLYCbcBFqBDsV4oedS952OLyTZx
 9yAuMZPxbOFxqkJW8S5Xy3Z3B7EwhVbPEo
X-IronPort-AV: E=Sophos;i="5.90,288,1643691600"; 
   d="scan'208";a="69874314"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGazSG4LpNP2E1rKPUOs/8+J36f2A3hbutcamBZawWoA8xDbS5JX9Hh90Zs/iXKylRAzPJWWhaCm/MdljlnDGy7uhuP2wEV9E+j99mRZz3YtrQHoARhXzEYmxXAS/ZGX9ghkG5l9qrA/Y8P3qRBfkUrleVX3KkIF4DL/rR+6J2IPD/ALhs/6PVuer/OF8zIfSvjs5eHAksmedftwHcOB6u1UOCrSxJ5kEZ3RYdAEf8f+mPhLrX5AY9qj0tCe8ABNx5E3dob+dt9VcmTldlGpqr8HdEkEk9c6urhwPkIHjIBXUBpleJG4Wb2EmTvwTkm5fhw413Hduzwe8JP1Jo9j8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PyDMa2lIDtTbxbzDU1eV3lPk5v0MMJf5Oc/fUPvnTo=;
 b=H4agiNCbaOOJG5LY5CeA3KFZvP2L9I554bWV1aa2bjSwAWm/q2fKxbEp2Zocp04Q+ULWiiI9cF+Lq6NRKJGWDOQKX6XXxCuuZOhWPLa+pJLHjR3PK3lp0FiBKF0SyqNKet8ajSPSFhOsTHEiEnEvVoLbp7u1i4CqU9oHlCp2hPOhjrJXP4REwjhAWkEYfmb9MUg9oz3vBkv7S/lF0xpkBQauQFrt9InRoJpHbXWR0WMdMo5OmY3sSyJHDd3Rri7Oo7CJ6UTM12g5q4jh01FpFqJ8RCzKz/veCEnAx2JkApUUNuQDox+9/ZTvePth52qWZkn1Y42PkQE5RJTczlSfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PyDMa2lIDtTbxbzDU1eV3lPk5v0MMJf5Oc/fUPvnTo=;
 b=KkNqSwtfAr7pEXgRQDbEPYVUPwk4oBep44IoKBibIVtDcY6KA44eiFnQ5t31YHfGpmi1Prk2LRr2kB3mR+DQwdLgH/fqpLd8NDi8WpCOmDzy4LBTo1YVZ19C2A8FhKSI1oJ8QV2bE2GTPik6tFjrIfC4W1XYpVeZCoe4cDIUfCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 25 Apr 2022 14:59:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86+libxl: correct p2m (shadow) memory pool size
 calculation
Message-ID: <YmabFt952DO29pIA@Air-de-Roger>
References: <368e2d54-09f2-2081-349e-571bfeab13af@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <368e2d54-09f2-2081-349e-571bfeab13af@suse.com>
X-ClientProxiedBy: LO4P123CA0300.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35c94294-abca-47d3-b903-08da26bb62d3
X-MS-TrafficTypeDiagnostic: PH0PR03MB5734:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB57346EBFA7CCCE3CCB2755118FF89@PH0PR03MB5734.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3/E2GHOdCBAS/r3AxiYemEQs9VRkpUJEyeKQ98d6mRWDDnkjngjP5xwSix6ulJH07h36YUvOvnEZv6o/aUoSdtrp8EiKHy+MtvQjrVTGdEau55EvR5SC0WpPWQ6qRvgBH/lctne88R33YZCV6Rt/orLsPGCr0nwBNXzUhd8YlZ7HV5DJGnpQ0xDV8EgdWbXfhyh1XkrhUsTOaRusCcI5QFIcjlNiPBITDGqOY/5+bH63aQlhqn8xG7P4q+sJJaUnset/VIg6Zlxgjug/RYbGNMQtNEx5W53i9jH7K4WPlx6lxJO2jFynoXERuLiy1QgDePlAvUGZmsbLjkTQjf5Dn+SNjR4qfaoAb6gGPzhoZvBM24DBCp+nNd9DxzRSHDtWRmXfVQt5694Ul6fZvUr3DiIz1m3L0tJtGi12hkk3CSInxQGQi6ENWW58WPs2mTJcp2GWizw9aBAKMidq9JCCOqy54TF47Tq13QW5+z7fec5BtF6pOsZLoeQQiC1KHBdlY7P+ZxAZhlW76GupwO1yw0Pcle1afTFPSGWwHraRSOm3jns7A9LynYN3i+yA7htwgPs+WgkH7cljxgLLTjPSgq6ldRKg+OhHlVl6fW0yuClZCHAiYX4OoTTFlmpGvQxW5fXT3JefQIUPWhrthrASjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(8936002)(66946007)(508600001)(85182001)(316002)(5660300002)(186003)(6916009)(54906003)(8676002)(38100700002)(82960400001)(66476007)(66556008)(9686003)(4326008)(33716001)(86362001)(6512007)(6486002)(2906002)(83380400001)(26005)(6666004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGY2Nk8remhlbjEycVVCRm9vR3ZiSVkrVFJjbzZDdnowVkpCU2RZcTRabU1O?=
 =?utf-8?B?b2JPbDZwemJTNmR5a0J4dXFnenBsaHhwWklHQ3hXdjJPR1lUMC92WnZMcks1?=
 =?utf-8?B?dEJ0dGJJS3FDSkxDQnl1SlFmZEZBUkhiSER4dmgyNVBvUjFWaWdKREdFZ0pP?=
 =?utf-8?B?NnBKaXhFSEVtSEY3NXpzSHo5K1gvWE13bGIvbkxmeWJpWDNVMFljUUdkRFUz?=
 =?utf-8?B?bjQ5WFJobVM2dWRybGU2bVk3K3VsTzVMUWdRSDM1WndtWXppZ0ZlejFjYTJF?=
 =?utf-8?B?L0lxYnhLb0JnclpTV1dvVit0QTNDaTd0ZWw1N0YwS2g2UGlYVmNTbkJlWWxC?=
 =?utf-8?B?VHhkTW5JMSt3TTZQUVgxakhuYTVDY1lKT0dEbFptSm10N044aUl4Q2Q2N1VJ?=
 =?utf-8?B?a3Q5emlVeVl6Tlh0amhXVCtxMXFKeEsydGxqT0FuaURaZWN1aFd3SFhISVEy?=
 =?utf-8?B?MUk1dG5laUFTbFA0TXRsSXRFZmE4ZWhKeGgxTFgzc1c2YkwxUEc3RWVzdU5H?=
 =?utf-8?B?bk1idmxaS3N0Zk00eFIzTUtCVjh3MFpJYVdOMzFQb0o3TlQ1ZHZva21wNzJr?=
 =?utf-8?B?U0xFRUEvODNWcDdDMjJTVzRhYzM5a1drQUlzM1IxSjFLeFVmU2ZUSEcyV3J1?=
 =?utf-8?B?c2N4Y0Q2dXlZWGRNalZieEs1NWgrZ1kxZitpdUhiamsvODVGSWZaNnJTbnFu?=
 =?utf-8?B?WnNZN0JpNVpnazd4RHdkSTBvazk4dGUwSmhkT1FQTU1PTkZXRGVWMTRMVUVU?=
 =?utf-8?B?M1R3eVYxaDRBejFSc3JUbHJpdStsRW43ZXRrYXhlMkRhcXlwU1N1SVorYlZk?=
 =?utf-8?B?aFErUDVtMXF4aGZid3QwUXBYcUN5c1NLYytIancyUStjeTNaWTNyZlV5SHRP?=
 =?utf-8?B?ZkU1citNZWdJbkFyMWJVWXNpUjZtNEVzc2Q5c0ovMTZDTDZnSjZUcVN0MlY1?=
 =?utf-8?B?STVvT00rbk9uOHYzOVlUMUVNUHNlZk50UThVZDZiK0duSmhKS2hZVXNQb1FV?=
 =?utf-8?B?QmdYc1NjcTlaendKSWh1QUtNQ3FoQUJua3VSeTVYekNxakZ2LzFVVVlkbFFJ?=
 =?utf-8?B?MzRMOFMrMExMODJSRnVPQk1qdk5qRWVocXRETXVRVUthTVZHQ0ZQZzFlVXA4?=
 =?utf-8?B?YWVyWWFMcVIxcGc2cEwycitIRWhYS1ZaL3grcTV2ajFWeWV1SXBZK1RGYXds?=
 =?utf-8?B?Z0xybjFkZklCOG9BcjJ4M0RtM0lpbURLc2kwbG96Nzk2eDVjL3VGU1dJWHA2?=
 =?utf-8?B?Nk9YUDBXQTJPS1AzMjhiV1IrZlhsNllwK04vVTc1VU95TW90Y2ZROTdxdFdY?=
 =?utf-8?B?KysrOSszUnFFU0ZDNk92cmpkL1pRYXE1d3RsVXFEdFB1SXp0ZHZCZkZ2emxj?=
 =?utf-8?B?L0xXTkZPNGJrb0JhSzNCNWRyL2p2dE5RY3MwNVBDS0lqbkY5RVo4WXNMVGhE?=
 =?utf-8?B?c29oOTdNd3FHWk5HYWl4aFU1eU9wakdPVThlYk5ZM3piOFpTTjY1ZHQxQ3lF?=
 =?utf-8?B?Zi9NVVh6SkN6TUtQMXcrSmdkN1drVWVHRXJJaUJ2UTJWWUdxc3ZHUlRZOFBl?=
 =?utf-8?B?SWJqSlZmQlk3WVZyQmt3OHpzcC9pT2JwNzNVTExZeGtvMWJCdXhWNG5WMnNq?=
 =?utf-8?B?R3RxdytyL1hHemd2Q0V5VEtLbXZlRTFhSlRjbDIyZFdweUZlUnQ5aU8vM3Qw?=
 =?utf-8?B?WmxCSDQycm5iQXY4d2JtRmhqZm54dkZ6V3d5NjhsTnB4T0xCYWtOQ0loTmFy?=
 =?utf-8?B?VnM0YXZMbUpRVU9yRWZEeHcwUHFreDZBU0ZQcEoyNHNDSlVOSWE3ZDlDR2tZ?=
 =?utf-8?B?dDJxbndIMHlFWDlvcjdpY3U4QXgvUDZNOXVXQzJadmcxWTZFNS9GeGF1dCtj?=
 =?utf-8?B?enRISVkzQzdkc0phZVJrSHk4MG1zNjJDTE8rMHgyamZJL0twWXhKYkVzalpn?=
 =?utf-8?B?QjJoem8rbURNNWsvbHNaQU1ET3owbVNRcCsvdDBDR1VhNTg2RWJ4M0p6WVV3?=
 =?utf-8?B?SjhvV3ZjeDVMSnd6LzlSV1pQbERqaHhWUlVBNCtkRWltaVZMMzFrK1ExWUdD?=
 =?utf-8?B?YklRVjVlRmNETk5sVmpnWjBHbjhFYm9GdFVVNHl4NHluWHE5Y1Q1TkxjWFN4?=
 =?utf-8?B?NVVKY1ZLOVdHVmNUUzRYdFVOclAzbkpqbGNwaDZNaWlGN2NTVVN5WnVrQ0JY?=
 =?utf-8?B?QmlMbEtTdkx1QjFDYWhHRVBRQzBJc3loQ015S0tRdk5GcGUrbmFic1FuR2Nm?=
 =?utf-8?B?eUNWbDN5U0NMYzU1bkdBZG9tQ0pmeUVKWVQrY3cveFdqWk8zSlZTeW92Wkxt?=
 =?utf-8?B?eVVGdHA0TjdqdWVITjdTcW5tVHlJYllxWVE2QnVCUmFJZHpUcDJzS3ZSUUlR?=
 =?utf-8?Q?nbqflyi+LfhAu06I=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c94294-abca-47d3-b903-08da26bb62d3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 12:59:08.8409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCPFw4q0X8XxD9W2RKQCPDkyd6Iigr54p0PIUuFkZBDeIT5NxrAvJ2ywy4Qd3/+UxWLIvRX+ihOUXoH+pYKtCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5734

On Mon, Apr 25, 2022 at 10:49:34AM +0200, Jan Beulich wrote:
>  char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -317,9 +317,12 @@ unsigned long __init dom0_paging_pages(c
>      /* Copied from: libxl_get_required_shadow_memory() */

Could you also update the comment, maybe better would be:

/* Keep in sync with libxl__get_required_paging_memory(). */

>      unsigned long memkb = nr_pages * (PAGE_SIZE / 1024);
>  
> -    memkb = 4 * (256 * d->max_vcpus + 2 * (memkb / 1024));
> +    memkb = 4 * (256 * d->max_vcpus +
> +                 (paging_mode_enabled(d) +
> +                  (opt_dom0_shadow || opt_pv_l1tf_hwdom)) *

opt_pv_l1tf_hwdom is only relevant for PV guests, so maybe it would be
best to use:

paging_mode_enabled(d) ? 1 + opt_dom0_shadow
                       : 0 + (opt_dom0_shadow || opt_pv_l1tf_hwdom)

Or something similar.  Maybe placing this inside the sum will make the
expression too complex, so we could use a separate is_shadow boolean
to signal whether the domain will use shadow pagetables?

Thanks, Roger.

