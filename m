Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DF67AA689
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 03:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606668.944655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjUzw-0006VW-Vg; Fri, 22 Sep 2023 01:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606668.944655; Fri, 22 Sep 2023 01:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjUzw-0006Tb-Sb; Fri, 22 Sep 2023 01:30:24 +0000
Received: by outflank-mailman (input) for mailman id 606668;
 Fri, 22 Sep 2023 01:30:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aXRy=FG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qjUzv-0006TS-Vy
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 01:30:23 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0623.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 983c3109-58e7-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 03:30:21 +0200 (CEST)
Received: from AM5PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:206:1::17)
 by AM0PR08MB5329.eurprd08.prod.outlook.com (2603:10a6:208:185::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 01:30:18 +0000
Received: from AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::e0) by AM5PR04CA0004.outlook.office365.com
 (2603:10a6:206:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.32 via Frontend
 Transport; Fri, 22 Sep 2023 01:30:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT038.mail.protection.outlook.com (100.127.140.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20 via Frontend Transport; Fri, 22 Sep 2023 01:30:17 +0000
Received: ("Tessian outbound d084e965c4eb:v175");
 Fri, 22 Sep 2023 01:30:17 +0000
Received: from 2a6b74460c97.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A63772DC-BBB5-4F82-B6C6-BBC484C8C330.1; 
 Fri, 22 Sep 2023 01:30:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2a6b74460c97.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Sep 2023 01:30:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB5328.eurprd08.prod.outlook.com (2603:10a6:803:13a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Fri, 22 Sep
 2023 01:30:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 01:30:07 +0000
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
X-Inumbo-ID: 983c3109-58e7-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DmG/0PLShl3H4gxcy6xb3Bgu4KUSierfAUVBk9+GNk=;
 b=BFwPVPsYOKCwOy6At48tdrlko1NvT5t+aJZsqTRKatM4MJ1nogzklbLrS0lI+R4OlJ0cifPe/HzoTWmJ12tKIZKyvO6jZL72+ERv2A4iswaPLcdVNXl1yRSq/UVflOjpRxbmciL+6s6QUJYRvkbq0Iq25ZnHpXgYtthwp7sqPkc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32af3c5d409fb996
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ow0GjO6NTKyXG7w05HhWrvS9neCY9rwHZx0pvXJvudit5PVT4G4xK87I9BLpuBOiehsoZsKr+yg+uR41bz7h+s4kSVnAzYCgOBzHFI8xXH+uD7Szf2Ek8VoCfHkv+LtkU2LRoCkZhFx1lqRiDTJfm+bS9kgIMauV1F3r7ZHgCmQbFjxZ+qcssIPrwht5I8eK47w5jcN8aHxHWzvv4INX8y9T/GVb+wUJy20PmWuPBo9AzmRCra3K0+nJLOpBUozddR9BT2OUmfJ+e1ONRniRMLIu4nQI0ewPDHR+UphUd9kXCx52p874ak6XRCR/x9WKkBmpLjw7/qPvVTopg4vj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DmG/0PLShl3H4gxcy6xb3Bgu4KUSierfAUVBk9+GNk=;
 b=coIuWE+WnR+jd5jb/q+ckXt728Z2h/CrUvnvtDiQxjpzgxXvCGfbZ8yak5t04zAPyrxYHf4cq/V/qxqqhMCFjfIKE7gXHv/dg4E2z3MMZPtpxrvUJVh4Tr//jAIfghHN0X+eaaG+D2PX7pkljKRxnPS8nrgGxqp3D1N16sww7GOwcoDnXjWgBaK7uZZ2XtMftbxhEcP9qq4vx/fhw3g/D2HW4JD+jmeFnMK5ub6WZsOza7+sLC7hvAy1aiiQqicr635euuvCUu1gdEqoHC9h+DraW2lJR5k1ONirVbfPG/xHrSJubATzVuEXHK1rzx3Yv1ixwAmDR6HEwfjSJi0Cnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DmG/0PLShl3H4gxcy6xb3Bgu4KUSierfAUVBk9+GNk=;
 b=BFwPVPsYOKCwOy6At48tdrlko1NvT5t+aJZsqTRKatM4MJ1nogzklbLrS0lI+R4OlJ0cifPe/HzoTWmJ12tKIZKyvO6jZL72+ERv2A4iswaPLcdVNXl1yRSq/UVflOjpRxbmciL+6s6QUJYRvkbq0Iq25ZnHpXgYtthwp7sqPkc=
From: Henry Wang <Henry.Wang@arm.com>
To: George Dunlap <george.dunlap@cloud.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli
	<dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v2 1/2] credit: Limit load balancing to once per
 millisecond
Thread-Topic: [PATCH v2 1/2] credit: Limit load balancing to once per
 millisecond
Thread-Index: AQHZ7IaJ6Rl/uO3Tg0W3bsFOfjroMrAmD4qA
Date: Fri, 22 Sep 2023 01:30:07 +0000
Message-ID: <8874B973-1191-42FC-BBCB-73DDF33091EF@arm.com>
References: <20230921122352.2307574-1-george.dunlap@cloud.com>
In-Reply-To: <20230921122352.2307574-1-george.dunlap@cloud.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB5328:EE_|AM7EUR03FT038:EE_|AM0PR08MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb2d9cf-7f0d-4f01-1255-08dbbb0b7a6b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5L8qiPqSAJlqEJqBHQRhDAO/sEqFky3bLgZr6YDDOhIZqYj5abakKNhOVgxwdbW3Tqlf6Rxl1dzcdHwQwMhwntydSjGDzdQXvZHH6JAd7WsKyTt4lb2+sYkA9JqeOQm9Yd8xVfz7pEEtZc/Gk0RAiTxoWNHr+yLuFulwgpnNGtUrb7BvCliqKmyWZKCAAPXzPKAgEqS/zhm9+8Pb9JfpqGfkguOla+Gvb/ljUCkWtcxqm7GbU57z8MX1Fnihb/PgD3kD3kNPQW5OfAkp81JobP8RYtyfBGMzxd+AecPLs3kaB4haHBbGW9oOP8wmUPQSRB0da9a5NcJyu3ESuUKB7ON5ewhCgS/rV4byeFnkCQ8N3CvLFBF4xVq6nORYEkoqQXcAgbFK9q3XshkZkm1e7nvucl28HY/Rzgbl2apE9S3sOLjd91Ox1Z6e49dt3Dq198zKu3BW+VrTljAfNtBuI+UV+7/MTnvZ2VPo2ZbbOKULmiuaVqIJdO9qTp13tpoEwXuNaj1N0oIT+RvNSKLkFvfl0xvJNDee2mbXTT/YEAbHENxqYaEJNjcNvigltal7sB9S7UmOFqd1rytkzf+ghQUjdXbH8qtCy//84BbTnAku1EYM9k6dBDnvbkwrSdTSyLutNR/S43fnU5yTY+1zXw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(376002)(366004)(346002)(186009)(1800799009)(451199024)(2906002)(316002)(5660300002)(54906003)(76116006)(26005)(41300700001)(6916009)(66556008)(91956017)(66446008)(66946007)(64756008)(66476007)(478600001)(4326008)(8936002)(8676002)(71200400001)(6486002)(6506007)(53546011)(6512007)(38100700002)(2616005)(86362001)(36756003)(33656002)(122000001)(83380400001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F68A04F5BC63ED4AA810F2EB70FA2EA8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5328
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	262c22e3-6a80-4f07-16f9-08dbbb0b745a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dbLRwOTSGm9l0X4W4BQa8cujjxBTV0irWKDuEXYi6Vv72FZ9Uvgg+jPV+tq0LfX8srGx9wt2cq7sbdre3NQk8D356FMT2jb6kG1kF5+yfIP52Jg2916naOAtVIDZ2E6gCD6K2wslTAEqpVL915XFxbvBuMxP3OjRR8P6yRENVEgiF/Q4NhmvUd1zxK6sQILjyB35gyWeZ88WtQ4I08ErwEHmfpc8xjFqVTsAHNk0wQvuyFrNOfPdAGHVDemKaWtRbqeLmzBwrgt2bxXwHMwXW1Iec4LMl5h56HvZ91F3D3sTpqxKcJHkLmCyI90RQ0xF2VvRi8Wd1iy9RlVzCsZru4CVe6pdvpV61mFRS82KDLZL27Ic2CRUmlHf9fqwRMSSgDvESLUxyrZEdGxoeYUU7QkTjW/qpz/TOk0p4rfrqBcx6TUj1xZRoeLmNvJ4cISqxafbBEDGzr7g40TzkkD8EoMzAwo00P7X6R7brWvPZvDkv/caKbbGxjjEkEsDAINjn0xpDQYLEp7qWIlcW+PRFMyv5YxQWDkrK+qAqLwUKIYcqWzb7CyTnQalj2ePNNSc+fwpvQTZ9n01o5r0IC3dMA3KoEsV5qamgV6jBqrXXbug2Ejei9crBbUcVcPrgBboTDQqfyu/zl4TjymUjkd+UfkQk3UHandvAIGugKVbNnkrVLMzlAt0Onr9Q9YKC69fc5mPB0H/Iuup3oTJfKcKog8RkV0wRwyYkH1kxMLnxJwH+zc73gcRPrg8XIunSZRpAajBjGYVUIOag/sBolnRuw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230921699003)(186009)(82310400011)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(40480700001)(2906002)(4326008)(70586007)(70206006)(54906003)(316002)(6862004)(40460700003)(5660300002)(8676002)(8936002)(41300700001)(86362001)(336012)(36756003)(26005)(83380400001)(47076005)(36860700001)(2616005)(356005)(81166007)(478600001)(6486002)(53546011)(6506007)(6512007)(33656002)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 01:30:17.5304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb2d9cf-7f0d-4f01-1255-08dbbb0b7a6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5329

Hi George,

> On Sep 21, 2023, at 20:23, George Dunlap <george.dunlap@cloud.com> wrote:
>=20
> The credit scheduler tries as hard as it can to ensure that it always
> runs scheduling units with positive credit (PRI_TS_UNDER) before
> running those with negative credit (PRI_TS_OVER).  If the next
> runnable scheduling unit is of priority OVER, it will always run the
> load balancer, which will scour the system looking for another
> scheduling unit of the UNDER priority.
>=20
> Unfortunately, as the number of cores on a system has grown, the cost
> of the work-stealing algorithm has dramatically increased; a recent
> trace on a system with 128 cores showed this taking over 50
> microseconds.
>=20
> Add a parameter, load_balance_ratelimit, to limit the frequency of
> load balance operations on a given pcpu.  Default this to 1
> millisecond.
>=20
> Invert the load balancing conditional to make it more clear, and line
> up more closely with the comment above it.
>=20
> Overall it might be cleaner to have the last_load_balance checking
> happen inside csched_load_balance(), but that would require either
> passing both now and spc into the function, or looking them up again;
> both of which seemed to be worse than simply checking and setting the
> values before calling it.
>=20
> On a system with a vcpu:pcpu ratio of 2:1, running Windows guests
> (which will end up calling YIELD during spinlock contention), this
> patch increased performance significantly.
>=20
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

