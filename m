Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB459F7F7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 12:41:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392387.630706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQnol-0006v3-Tu; Wed, 24 Aug 2022 10:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392387.630706; Wed, 24 Aug 2022 10:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQnol-0006re-Qm; Wed, 24 Aug 2022 10:41:03 +0000
Received: by outflank-mailman (input) for mailman id 392387;
 Wed, 24 Aug 2022 10:41:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DC3Q=Y4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oQnok-0006rV-IB
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 10:41:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140054.outbound.protection.outlook.com [40.107.14.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ea634d9-2399-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 12:41:01 +0200 (CEST)
Received: from AM5PR0301CA0014.eurprd03.prod.outlook.com
 (2603:10a6:206:14::27) by AM0PR08MB2978.eurprd08.prod.outlook.com
 (2603:10a6:208:66::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 10:40:57 +0000
Received: from AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::d2) by AM5PR0301CA0014.outlook.office365.com
 (2603:10a6:206:14::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Wed, 24 Aug 2022 10:40:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT050.mail.protection.outlook.com (100.127.141.27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 10:40:56 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Wed, 24 Aug 2022 10:40:56 +0000
Received: from 0e21242dc0c3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A17BB1C1-54ED-4A64-ADD0-0A5D1EA924F8.1; 
 Wed, 24 Aug 2022 10:40:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0e21242dc0c3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Aug 2022 10:40:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7188.eurprd08.prod.outlook.com (2603:10a6:102:20a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 10:40:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 10:40:38 +0000
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
X-Inumbo-ID: 3ea634d9-2399-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BTSkJkj1NJ/LVFMLi56+uapV7JmaiAiOF/OTt4bjJGhpxJ6kByn/1LN95RitBJX6lYkYQLpUSo69cWOkvp/jmBAj8WFce3sK22R33H5p34a+9Ktd52E3WtMlOuXcAXwvwooqJkPDSiEptB86Pe9WExHsidL51vSQMjV3w0bdv4aU2bP2+JuVSlgkSj8l+lrh1dJJooC9iPdbD1l979qluEH6Bv6ZgAJQkVSU1hn2GnwBpuWe0oiOhn/B37pgoxepDTMcfzalTfyZvkALD0MLHRlcHTMTTfloS/JcNgEBg7tD+8R1C3QVUoNOUFv/OWrQKkxSDw0eEPo2pnpbjYTn3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwuAQpNcIRhn7bJZNrrmtgGwCaaN0+nBvbMogofl8EU=;
 b=iLVCWhEaXpJZv80fBzt8dtZRUXjbDu5HUIh9E4293XMSxfaPa+Og+EmLIUBbp/BjOPQZGCRRI59hf7zYwyvsxs+R6nUKQsZaj5e7yN0q3MyabeyWspR3I2paBNidMu+6g1OSJWtcXqbqdDKa6g7bfV+TXdL1DP5djOtzivPLo0LN+8gAMSE12TuKCR4zswvWRuES7T//0g36jo44LgrBVP254waYeLKneoHoaFmuY8m1zUdKot4frAZSZIfh7IMaWJkVICj2Xft+pvxmh5Y3BDcgCIfz0qQUpQUbwn1Enbad2ZRmEkJYw9DdZhzJwsi/5Iu4ak/WH0h4ZhnWWfNfFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwuAQpNcIRhn7bJZNrrmtgGwCaaN0+nBvbMogofl8EU=;
 b=n/qLoKPNWBtQRowWx/BRzkTB5EtQD1MqT856ijtFzM9KXhDJPcYSAhfSUDzlJt8fodhTWyw34EeGJKm+dWDkjlKH5CHhUPT4pOWiZPksSW623Ll+yydWcEY2GRaeKSSL5YoP7iSCODyujMfUMtY69W2n0i4ouMGoP/RoLcT8vTY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8eba462976e05ba9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ao+yoWlaRQB6qPJADNxYZpdx2Vrwr4VT8673cJTydQ6jvH5uPX7Na8RtpAq20BvYvkTuS8bXijKwwAmwkx5IONBQQPkIbwLCRDthka8WbirCQMac3LUZvpvr3K3IUgz6jUbPdSbm5AsaxTW5J/1gNrbCwJi/1jQn0cYXVri5RnUhAqy4STnK07Q6b9z5z5U9KrOezh0UWRjdOKt9NRTVKYXoZCFccUxGZaVmPwFKem6CrcNTlfgMukvVnRilahV8GcuRR/INrxwcHmxNsRaGzcHtihYGghC1X00Wzy3qNSioChlBgWnPYP4KJNUcGVvLwRcc9STNXWIN21qpD/X05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwuAQpNcIRhn7bJZNrrmtgGwCaaN0+nBvbMogofl8EU=;
 b=NgPFOXLrNeCEX4luCyAD8eri5E3QkWc2SbvdnL8CeUUT86sS7UWrWwZCyl9KhKAjyGAcJ+HDFlZP6HkF8nlTRi2iIwlHgGy27mqzV4yRJKGTR30NRSs4U3vgmxwzSlEps21x2laUe4VOeVMDNKNA6QoXY+qkUxJbvzyjJfdn7VilP/Abnp8rD4cijLYTwDTaY4qLWKKmRPE8tKMu/DEQY7GPulrzAi5ljiX4vBEgPZcDRG3bGcchW7oWaAusCj7akknU3rWxRCNvtJeBCfvaBqRX01npWebuQX7Id+Ho9C4vXt05PXchmmj1DiOGZ9P6CgpgNuitl2gCXDwXWYKJpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwuAQpNcIRhn7bJZNrrmtgGwCaaN0+nBvbMogofl8EU=;
 b=n/qLoKPNWBtQRowWx/BRzkTB5EtQD1MqT856ijtFzM9KXhDJPcYSAhfSUDzlJt8fodhTWyw34EeGJKm+dWDkjlKH5CHhUPT4pOWiZPksSW623Ll+yydWcEY2GRaeKSSL5YoP7iSCODyujMfUMtY69W2n0i4ouMGoP/RoLcT8vTY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen: let ASSERT_UNREACHABLE() WARN() in non-debug builds
Thread-Topic: [PATCH] xen: let ASSERT_UNREACHABLE() WARN() in non-debug builds
Thread-Index: AQHYt6NyK7b3RgMjVkS3bZkU2qcg36292w4AgAABj4A=
Date: Wed, 24 Aug 2022 10:40:38 +0000
Message-ID: <09AA829A-6628-424F-AC87-49C47FCD0B9C@arm.com>
References: <20220824102225.11431-1-jgross@suse.com>
 <e611392b-7186-cf0a-96e0-4ea39b2bc151@suse.com>
In-Reply-To: <e611392b-7186-cf0a-96e0-4ea39b2bc151@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c11bd0f1-f0ce-422c-7bf4-08da85bd206f
x-ms-traffictypediagnostic:
	PAXPR08MB7188:EE_|AM7EUR03FT050:EE_|AM0PR08MB2978:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hFrgvhqCf2MJT40Wy3dN9mmeqWDxLeLWIoZmmJ5M2lRMzD1Fr0ZRJ7i2zGRJ3sqdu44IOERddDQHIhRmRTe6wbkqUebSY3VEtwqKUMk7aM4Eqq1VYabGd8L45i7JmV5YCi3o3eD/peeDoysrJvcF+6TUBIX5NcbqABC5E2Crp/FP8P3LS4wba6Ax6iXA7WmHI6pXOnnYgqtq1EzMBSOrxhGeCJXdgso8wEo9XksPRGgrV6jjOpccC8YgXyRjArxybugePh7YxWj6T7zfQoT/Dlq8/6WcwwDVnED9BgsWZIDOmcveTkoEp3CHHLZ3Uz4tlUNkcfdVFtF31DMK8k0JutNyEUf/BjpNoodqRkouic3/qVtWkdbfX2cmxHGCeOX9IG5dMeXBpZTQt3Z+GRFoxyZz7lGK1j956dITi8RCy3Givo6jMS/WeORvbQb3wZIeYLCOcYJQEnLI3xfluLGAGy1uOpTVYFfEO2SxsaUbw2KW4cSZNgSfgqwt1g20WnTj4G8YyB759nQg78874NHuGN6eAk65WTnTocUUSDLb1ZHfXHGSa84qC8jIt/r3ATnb/GhN9f0fM5uJIQObAcjtDXEz7aTDSZzD7sT7tRDRXem/wKNxM2ptvQDhYUOon6cPcziQ/LQANI1ho1PkgrcMmhvau8mhqSPxqGEbvAoAwId4+M5gYvF8dVSxVtNeL7uLRC4x6JXq7G6/MPLhb05QhrHcKZUyXLLT+b6o4rGze7Ll5wteVqEin26w4QKZf2RRTuR5yp91MIYiAr33g9vdO3pReMAqdxbFwc+EX9R+Q+s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(64756008)(76116006)(66556008)(66946007)(66446008)(4326008)(91956017)(8676002)(8936002)(41300700001)(4744005)(38100700002)(122000001)(5660300002)(66476007)(478600001)(6486002)(316002)(6916009)(36756003)(71200400001)(54906003)(2616005)(53546011)(6506007)(6512007)(26005)(33656002)(186003)(2906002)(83380400001)(86362001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4708A5BC4216C543B9F6FDB53E81EEE0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7188
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd8b9670-916a-466b-ddee-08da85bd15b3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aOc+BFav7jW+BEsRSR/qQ+rLqjTYA46HmLhjOVWc+MwS8hCsa9Yxlzk2kgA8D2Q+71vhRgK1mwn6xn0Fm2u/pOTFmmqy/3yHURZ4PugyGFBysiTVmLJ8g8V0tv8ciHpHdzedfsrJBnyYETFq38rqfhNFM8MQe3meFwLhUEfRCV1wol7XIIOXY/fmiTZR5R6+FtxitVIIMWdI3ALCi6w1+1gG7+UxOiWhzXzSfTvUBK9k4a3t8aNRwEfCECcZJQxbKQfCj/B0zOLg7mfZfgM+/qjJeptJ8j2T+OjYp9jqGCMwJOfz/V5jR2zVhzkilRbwGP7vvGXtkqty/KSqE/S+NCfSzFVqJMwXj6i/grWT9Yw/fh+uhROoaE16HugyAakYBZismZHvRa9mQ3rP93l8qyrzBn/4uzDUJvTQpe4ZsiPnlxtmXwSv1Yl13+9xChC/g15+pb1BC02FD+h6CO1iQvS+TxJ8cQjpQkRT1VJKhbbVtFRqsZE/5IaIY2zwAbShbN6vONh0Gq1wSNNG2PzwyOV66VD4XV9oNHhIk/WYhMTC36mH70We5tnzPDBZi7DiP8Rt5Aap6wKUhWJQq8LYwDcAx9ccJxJZ66KLpXcKFDynszpg+tJFyf1cPy5UwaD6hfIMPqF8861EgIE3dInpJZ5GBGP4086LtHyh6W3x4GunloR3zBcpk8Sdimx4oKWM/OOW2dBET5Ierwde9bz1XhXOquwTtcS4b104RM/yPHvjSY2UxKWmYC7pLzRaUg9vye4+MIxuLqtN91fyxQX+Dw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(40470700004)(46966006)(36840700001)(4326008)(8936002)(356005)(5660300002)(8676002)(81166007)(2906002)(70206006)(70586007)(82740400003)(86362001)(82310400005)(33656002)(4744005)(6862004)(316002)(54906003)(40480700001)(83380400001)(6486002)(478600001)(41300700001)(336012)(186003)(47076005)(2616005)(6512007)(36756003)(40460700003)(36860700001)(53546011)(6506007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 10:40:56.5211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c11bd0f1-f0ce-422c-7bf4-08da85bd206f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2978

Hi,

> On 24 Aug 2022, at 11:35, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 24.08.2022 12:22, Juergen Gross wrote:
>> Hitting an ASSERT_UNREACHABLE() is always wrong, so even in production
>> builds a warning seems to be appropriate when hitting one.
>=20
> I disagree, for two reasons: This violates the implication of NDEBUG
> meaning ASSERT() and friends expand to no actual code. Plus if doing so
> for ASSERT_UNREACHABLE(), why would we not do the same for ASSERT()?
> There's a reason we have ASSERT() and friends and, independently,
> WARN_ON() / BUG_ON() et al.

I agree with Jan here, this is introducing code in ASSERT which is not the =
intention
and will end up with dead code in production mode.

In NDEBUG those should appear.

If something is needed or we think there could be a situation where this is=
 reachable,
then the code should be modified to use something else then ASSERT[_UNREACH=
ABLE]().

Bertrand

>=20
> Jan
>=20


