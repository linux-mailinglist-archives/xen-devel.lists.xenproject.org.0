Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C464544EF1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 16:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345556.571201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzJ7x-0004SL-F1; Thu, 09 Jun 2022 14:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345556.571201; Thu, 09 Jun 2022 14:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzJ7x-0004Pk-Bj; Thu, 09 Jun 2022 14:27:13 +0000
Received: by outflank-mailman (input) for mailman id 345556;
 Thu, 09 Jun 2022 14:27:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kiA=WQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nzJ7w-0004Pe-3k
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 14:27:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ed8ef23-e800-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 16:27:10 +0200 (CEST)
Received: from AM5PR0201CA0014.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::24) by PA4PR08MB6080.eurprd08.prod.outlook.com
 (2603:10a6:102:ec::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 14:27:07 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::2f) by AM5PR0201CA0014.outlook.office365.com
 (2603:10a6:203:3d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13 via Frontend
 Transport; Thu, 9 Jun 2022 14:27:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 14:27:06 +0000
Received: ("Tessian outbound 5b5a41c043d3:v120");
 Thu, 09 Jun 2022 14:27:05 +0000
Received: from 0714082b2b4c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DFB08579-FE97-4829-9A20-09A747D570F9.1; 
 Thu, 09 Jun 2022 14:26:58 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0714082b2b4c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Jun 2022 14:26:58 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB4957.eurprd08.prod.outlook.com (2603:10a6:803:109::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 9 Jun
 2022 14:26:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 14:26:47 +0000
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
X-Inumbo-ID: 3ed8ef23-e800-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mOwsHeif3aKvUaDwji3/QC6pDlancOfMUAHwggmM0oqW8WOE5uZnNacynr47WPA/fdvz0UWXNxYSlYzjWV+2iYabIal53lOUvpPJC0Mz6QTXTDIPy8XTPkV80kqVYv3Zvr6JfBleWsgvXDT4gaM/Gq6nHDNlX61XNFf/LZ5fmmXYM4Jl6cspw7WlmdV1pqXwARFAY/KF9IQInIE7oJ2XIqjgjLyv3/E73BuLdYJQhL4pCdn0cjthG0PsevoebTRwHVZehYQwCg/+e/TMnb/BqU26U1KR0x0wkuWb/vjXnLOby17oL8XxbXEsMtZ1lliTkhBbc9zWA4tbZeBWxiA9Fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXQt8AAD0BbyAzVfLu9P2t3Skg4ZAY9an+vYNmZO0fk=;
 b=CwsC5zey0zUm4/N7fyALZrr9Hutv8+7OreDBbmKshrMQLpSpAQavk1QVs280fFAtMyCSfjA6vOgXOFV4fki06Fp5hIFM+44LL7Nv9xBiqdg7o37mbAYhvHJTtFyI9Nv5px38FQlRou4C8qidhVjo2sgxuiq6Df8O9XDiO8EpY3gqA5lOkmzwMB1k5oZ8PvmZu03OI867D6s3zFcdmNX5vXFUA1qi+9vp8rCAyMeP4mxJLA23te3yZC9YhxQeTipJDYCjmpyb/nbNznjtjDDg3KWaSWBOCQbBlQLVlqeee8E1nwVUvLj9hr3uCV8Y35Z73cmNOPcjindUiUscB00IYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXQt8AAD0BbyAzVfLu9P2t3Skg4ZAY9an+vYNmZO0fk=;
 b=Rp+9TpW1jUbf1KI7BgWsiaYc2OC3xKAT2V4rgCKb6OfNFazx6IkV8u4m82USCWulXFbrtblegdXA62Xidr7/ImVXKDtRHb5QV+s8rUygpjvOJmPkyh87Rnd20s6MK4mxWLkKKCpBi+hj48GPSRbMBrdub+fmbzu8BNI83xa8ms4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 324674f756b96692
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfEfhstPjtJgFhUKCVhyWFm6rCg6FGoCSuOIfEbjxUHt7mF7pyS56toIKQ1wNr/rLy1qdQOo6qkxZz7ZL/EFBwAU1CNBDKJ/djiI0mA2vUnlHYrBtBVchWdks2PZC4PnIvOgoSCUfoGLYf6lFR//Zkn1pBnCd72DmbvSmGdNs6OE9kj1Q35cBERbUP2hoQxa5xEQq5SbOQg5g23H9nrbsz8YFUSfvEguf5fsPSpQ7ZEhBxW1tfMur0b11PHNQdXjA/AjhMksJnlpafsJE/UftBPEs0y/sxNEQ09WLawZn/l7GWZPlSIaTvrXSoCOqmli/sC6D4RYfwrm0oWMXTGsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXQt8AAD0BbyAzVfLu9P2t3Skg4ZAY9an+vYNmZO0fk=;
 b=A8wDWEb2HmEOViAq68eRfz/CMdmB0KSniwPE9+nIojKrKJYEzYPc9+X859/Puf2dtFnZRkpfnOCuFmR5646VQcR4M5vHkegZ3nNlGsTHMfjoJ4qRSXM+FBuUUFyWqkzQeYhYAo27P1R6fyqKOLhVP97mVH1ODNUzc4FCcgKzxxwJ1GBwxljQR71eHdcRVSwc8hfp9tF4PixE6D3tYXGl/J1zSFa09S6KutiCHUyyR2zLPAcXt3PrUrkm1n+f54prNiK/MUPHTZyLLDEK704RI6FK017ZDXzKv/uvyWQOmeexnLie2WkBuYK0BinuGuF+EwovH5k5uVjJ8r4qSLNKPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXQt8AAD0BbyAzVfLu9P2t3Skg4ZAY9an+vYNmZO0fk=;
 b=Rp+9TpW1jUbf1KI7BgWsiaYc2OC3xKAT2V4rgCKb6OfNFazx6IkV8u4m82USCWulXFbrtblegdXA62Xidr7/ImVXKDtRHb5QV+s8rUygpjvOJmPkyh87Rnd20s6MK4mxWLkKKCpBi+hj48GPSRbMBrdub+fmbzu8BNI83xa8ms4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/4] build: xen/include: use if_changed
Thread-Topic: [XEN PATCH 1/4] build: xen/include: use if_changed
Thread-Index: AQHYddkD4JsESJA0gkGnWWwykzQjSK1G6E+AgAAC3wCAABeVAIAAEeqAgAAZh4A=
Date: Thu, 9 Jun 2022 14:26:47 +0000
Message-ID: <F2278406-E9CC-4672-9669-10B4895CA854@arm.com>
References: <20220601165909.46588-1-anthony.perard@citrix.com>
 <20220601165909.46588-2-anthony.perard@citrix.com>
 <6EE2C13C-7218-4063-8C73-88695C6BF4CE@arm.com>
 <0d85ad23-a232-eac3-416f-fff4d5ec1a93@suse.com>
 <258D1BE1-8E77-4748-A64C-6F080B9C1539@arm.com>
 <YqHtvZPQJOAFt/8K@perard.uk.xensource.com>
In-Reply-To: <YqHtvZPQJOAFt/8K@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 126c83ef-852f-4ad0-4b96-08da4a242119
x-ms-traffictypediagnostic:
	VE1PR08MB4957:EE_|AM5EUR03FT018:EE_|PA4PR08MB6080:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB60806B2BF95542D2A69A83B79DA79@PA4PR08MB6080.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fLK2H/TycALrzoUg7W8OARGc8b2JQxAlvC57tbhrageo1DZ6cOMJTQ0FsrD30+MNcNIEE6KEY1q+WvbXM5CQSsHtKvQ2UWvFZROgA1INH2cP+ZqrItHpRYeVcw5cUsiZzSpnNRanU2n5U8+najJ0htlk8Vb7ndTdFC3R57SdKOBeK2FChXdQh6PSzFnN35b7LebvQBjCxzpBjjW6EqIvSyxTHu+7M2c8qCBqihH+oYGSj4IvKdGYfE3zpTUvC4AJ4lGgNlrvhPTMx4S7+0k8oJaQgVC/BASGHMWTfhWnzxuJxgMZFeIVxBnliZBLe71JKkbaoyTEP6c2K+8o1SU2CfNgBncWyHDfuLkFNtdULc3k461WkS6x1RN1EGra6tnxWqbafL11vWAsFHDHCE+BQOa+w5SN3S2VpNvU1mD+XLZEiqDq96TIfAqkTmjm/1cpwM30KmxYqWKBTscYSMKjotiplaY8j5vImieoG2t35rgulCKIn78+LXqQCvok5pcQZQD00I3bBvEpNwW/IyqU7WzA1tgEivBGTBIfgU1uusNS1+DJbWDHNK9VXQPXcs/ggezIymGYFmxt9IH9mCVAIPZMaNDfyc369egDCu7gXODn1FHAvqxq6iodnYo/HyjWj0+5e0ykFhrUcinKQZwxEI2RISfsfFN8o9oTEpEbCPU4BfhJPORcFUHrH6grTY0awelS+v5CtETu8hh09JawohvtO3cDFHbxperemdxU3YW8ToSobp7rB4VbSY/3+xT5
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(26005)(6506007)(38100700002)(6916009)(122000001)(316002)(6512007)(36756003)(86362001)(83380400001)(2906002)(71200400001)(38070700005)(8936002)(54906003)(53546011)(76116006)(4326008)(66476007)(2616005)(66946007)(8676002)(64756008)(66446008)(91956017)(6486002)(186003)(5660300002)(66556008)(508600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <52AC22F6A40552438030B30563131149@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4957
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	702a3087-05fe-4f2f-e2c9-08da4a24161a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	APv1ooL0x9vWL3+7qAvnmXhrXp6rJP9P/LPXMCrc55IPPpGh0Lf44eM6b1x+dZJwdcLq/wXvks5V/6XwVWx/GEo/0I4l4hR80Yra6CDq3oqst3gvkCFv1iD+8eDVbRNWTxn9A8q0d39WtfF9AYZl9DzCteMswPftmspNfa/fuPU3CnWVxnvNIPd4C+qRop2+pIE98P19ohhNoHaP4w1y80+rG5jMxHb8Tpa19GJdOS+jTtF29t2Aw2aKs+wMkWCBBVnLyhjCv0yBV1Ab14CD5IqEXbTu0b3DgKLkhlZ3/KxpfItOHeowczsgyqJv9zG3uOb69OJ9ZXy47oYYYrfIADHBieCWkKhhhq7r90X2bmQRI6zMbLmMGF+TriwwNc9MPtr9arJtYpQn7sinzDpqZIGu+rDyonkv2h/ZPn9mMHbvp076ISXEUM6I6PZQT3PEqLF7hYSbvqZlE5uaL/UbnRkBnsWyZ2ms4xIPK0P+NSeWLHkuU25Vto0oz2Hcdd8VwPnYCjzKgS/S4xqSkM03l4btceJoyhbLJ2XVAPJSJ6Vt+i/E+BME51/GDPXJ4TOnnpQrwrSoE2ea+JknwuaY9bqp2HD6HMW5w/lGFLVa/rkd6vhyW2XtoQsREJNS5MwCDwfO3/vrQyxzvB08YoofwfiwlQ7dJQ/x9kFMwfRpSpyhm6uA+8k8pKOfjlECU0Nm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70586007)(6862004)(6486002)(70206006)(36860700001)(508600001)(40460700003)(316002)(54906003)(8676002)(4326008)(83380400001)(336012)(186003)(47076005)(86362001)(5660300002)(8936002)(36756003)(2616005)(2906002)(6506007)(6512007)(356005)(53546011)(81166007)(82310400005)(33656002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 14:27:06.0149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 126c83ef-852f-4ad0-4b96-08da4a242119
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6080

Hi Antony,

> On 9 Jun 2022, at 13:55, Anthony PERARD <anthony.perard@citrix.com> wrote=
:
>=20
> On Thu, Jun 09, 2022 at 11:51:20AM +0000, Bertrand Marquis wrote:
>> Hi,
>>=20
>>> On 9 Jun 2022, at 11:26, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 09.06.2022 12:16, Bertrand Marquis wrote:
>>>> With this change, compiling for x86 is now ending up in:
>>>> CHK     include/headers99.chk
>>>> make[9]: execvp: /bin/sh: Argument list too long
>>>> make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
>>>>=20
>>>> Not quite sure yet why but I wanted to signal it early as other might =
be impacted.
>>>>=20
>>>> Arm and arm64 builds are not impacted.
>>>=20
>>> Hmm, that patch has passed the smoke push gate already, so there likely=
 is
>>> more to it than there being an unconditional issue. I did build-test th=
is
>>> before pushing, and I've just re-tested on a 2nd system without seeing =
an
>>> issue.
>>=20
>> I have the problem only when building using Yocto, I did a normal build =
and the
>> issue is not coming.
>>=20
>=20
> Will the following patch help?

Yes it does, thanks a lot.

You can add my:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
>=20
> From 0f32f749304b233c0d5574dc6b14f66e8709feba Mon Sep 17 00:00:00 2001
> From: Anthony PERARD <anthony.perard@citrix.com>
> Date: Thu, 9 Jun 2022 13:42:52 +0100
> Subject: [XEN PATCH] build,include: rework shell script for headers++.chk
>=20
> The command line generated for headers++.chk by make is quite long,
> and in some environment it is too long. This issue have been seen in
> Yocto build environment.
>=20
> Error messages:
>    make[9]: execvp: /bin/sh: Argument list too long
>    make[9]: *** [include/Makefile:181: include/headers++.chk] Error 127
>=20
> Rework to that we do the foreach loop in shell rather that make to
> reduce the command line size by a lot. We also need a way to get
> headers prerequisite for some public headers so we use a switch "case"
> in shell to be able to do some simple pattern matching. Variables
> alone in POSIX shell don't allow to work with associative array or
> variables with "/".
>=20
> Reported-by: Bertrand Marquis <Bertrand.Marquis@arm.com>
> Fixes: 28e13c7f43 ("build: xen/include: use if_changed")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> xen/include/Makefile | 17 +++++++++++++----
> 1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/include/Makefile b/xen/include/Makefile
> index 6d9bcc19b0..ca5e868f38 100644
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -158,13 +158,22 @@ define cmd_headerscxx_chk
> 	    touch $@.new;                                                     \
> 	    exit 0;                                                           \
> 	fi;                                                                   \
> -	$(foreach i, $(filter %.h,$^),                                        \
> -	    echo "#include "\"$(i)\"                                          \
> +	get_prereq() {                                                        \
> +	    case $$1 in                                                       \
> +	    $(foreach i, $(filter %.h,$^),                                    \
> +	    $(if $($(patsubst $(srctree)/%,%,$i)-prereq),                     \
> +		$(patsubst $(srctree)/%,%,$i)$(close)                         \
> +		echo "$(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq),   \
> +			-include c$(j))";;))                                  \
> +	    esac;                                                             \
> +	};                                                                    \
> +	for i in $(filter %.h,$^); do                                         \
> +	    echo "#include "\"$$i\"                                           \
> 	    | $(CXX) -x c++ -std=3Dgnu++98 -Wall -Werror -D__XEN_TOOLS__        =
\
> 	      -include stdint.h -include $(srcdir)/public/xen.h               \
> -	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$=
(j)) \
> +	      `get_prereq $$i`                                                \
> 	      -S -o /dev/null -                                               \
> -	    || exit $$?; echo $(i) >> $@.new;) \
> +	    || exit $$?; echo $$i >> $@.new; done;                            \
> 	mv $@.new $@
> endef
>=20
>=20
>=20
>=20
> --=20
> Anthony PERARD


