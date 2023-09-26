Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C87AE2CA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 02:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608217.946567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkvbj-0006TS-32; Tue, 26 Sep 2023 00:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608217.946567; Tue, 26 Sep 2023 00:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkvbi-0006Rl-W3; Tue, 26 Sep 2023 00:07:18 +0000
Received: by outflank-mailman (input) for mailman id 608217;
 Tue, 26 Sep 2023 00:07:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQH+=FK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkvbh-0006Rf-BE
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 00:07:17 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe13::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a57968fa-5c00-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 02:07:14 +0200 (CEST)
Received: from DU2PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:10:3b::18)
 by AS8PR08MB9042.eurprd08.prod.outlook.com (2603:10a6:20b:5b0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 00:07:11 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::4b) by DU2PR04CA0013.outlook.office365.com
 (2603:10a6:10:3b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Tue, 26 Sep 2023 00:07:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Tue, 26 Sep 2023 00:07:10 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Tue, 26 Sep 2023 00:07:10 +0000
Received: from f6fc9ab6cc1a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD2B995D-6DF5-4ED3-A3AE-68A1F64BA647.1; 
 Tue, 26 Sep 2023 00:07:03 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6fc9ab6cc1a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Sep 2023 00:07:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB5952.eurprd08.prod.outlook.com (2603:10a6:102:e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 00:07:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 00:07:02 +0000
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
X-Inumbo-ID: a57968fa-5c00-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE2MJngDGAq5i/YJf7EcjA96TPSxh3SA4byG8OXiYGg=;
 b=2UyiSiFqi6zZEvHEm6r3UEdYKGlDSnx99PV6sGkz0eqXp/JIZQlA3DEtKiukyGza3BfpDh9pErX6tHGHm9IcOagq04MU/acBszoJdkwKVXpdGWZs4sZvTJfxsTSSSZYhTd2ElEaY16Spi39tBaZvqK9ngm4K0dCYFT4jtw+8p88=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3d02c5c8d692575b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7w4UI/FTJMmt0Re+syCRqYMgnFVcaKvkikcPAl9JtGib/cERuoFmC5AnO4h2UXRuhxA52xxntWu5p+k2e7SFQPWAbc+uTnQf4qr4OCjhwk1SqWlUhsxo0lyYvJkYSBisJjngouICO2u+MaeE3o+iAdiChTBqbZX2IjISpBsX3SI5L3LdBrTw/WVkfHNF9M/RhRihvOoqTVz/TMQgdJGka4sAjfaw4dxoZTTc1OfOjTLVFh+RQDhHQYWQGVhB9E4jDeTy7XvZuhJ9H4M/L8/hLX4Z7Q2/XfThpRMKD2C3AIcr5JfKfSOF9cRO6GfPsCwryxSF1VFLsffXwKgakx7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IE2MJngDGAq5i/YJf7EcjA96TPSxh3SA4byG8OXiYGg=;
 b=hLnFTjkeOv8DehcP42LzymkhuJcR5Ph2hjYPAEqv3oQe/OBHtqbKcodf2H2DP5yZYavpy+cfa9MMcCw/0nT41xMeoMbcDKXjIlcH/W9iA9BaqggqBbD2aPETfA/0YATJL/HlEhrUAPXf4YHQ78YhHamYaQUncXQOd1pGFVy64a6Q15zYBxdEez/eME5ZJvvyP/2C1KBlpi7flI1DEHqpv+ygRspBKbQYAb77pCJ+F7eu5qhLKxjI5ccW7wvSnbOUyT+hpDD1lc0kyoShOBoQgoolLpW8EYWzAnbDuK23Pbmqhqn187lM51ALjS8x1hYgBCsne64ZaEorwGQQnRsEUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IE2MJngDGAq5i/YJf7EcjA96TPSxh3SA4byG8OXiYGg=;
 b=2UyiSiFqi6zZEvHEm6r3UEdYKGlDSnx99PV6sGkz0eqXp/JIZQlA3DEtKiukyGza3BfpDh9pErX6tHGHm9IcOagq04MU/acBszoJdkwKVXpdGWZs4sZvTJfxsTSSSZYhTd2ElEaY16Spi39tBaZvqK9ngm4K0dCYFT4jtw+8p88=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Timothy Pearson
	<tpearson@raptorengineering.com>, Doug Goldstein <cardoe@cardoe.com>, Jan
 Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/3] automation: Drop ppc64le-*randconfig jobs
Thread-Topic: [PATCH 1/3] automation: Drop ppc64le-*randconfig jobs
Thread-Index: AQHZ8AGnwE786bP3sE2cm1TVrz+0uLAsJ1yAgAATU4A=
Date: Tue, 26 Sep 2023 00:07:02 +0000
Message-ID: <3C3E3297-1C2B-4B77-A83A-1D3F0B1E2BA3@arm.com>
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
 <76d21ac8a0de7d5ebac8b39a8d552b931a6302a3.1695681330.git.sanastasio@raptorengineering.com>
 <alpine.DEB.2.22.394.2309251557350.1403502@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309251557350.1403502@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB5952:EE_|DBAEUR03FT043:EE_|AS8PR08MB9042:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5a5d7f-ca52-42e6-27f8-08dbbe2487d2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 f5k8t34D9VzLG/GvHN3u4sq0uWPD+D/QEJBXVvJEetrdmoQGIlbIiEs+SaKXU+n5mJzMExxG7pnxlYHnxOS+SCS9DZ0jRaXawvz0bz81IiCv7Pzwa+QSczYtZw0F3Q81AeB3hpLiTC5nL+W7P1T1L+Ry+gEt5cyZH4vdEZ18TD3Je9vShK+ybG9iwuyfCI8NxIJ6n5dph/z52/1ROlut0aJBmqlP/N+ch5D9vAkaOmamVfq04hMYizDEgNpeEYshfkQbGDs/9vBEY+B61WKKonv1LMu5W6quOwU5YjRbUnlTrhxQJJU5M5vEeTjoSB7CMZHDn7exoXyrLhBShlvImBdlI2pZQyIk1qDMadfLW0qgqjj2m8UK3nYnksd2Xkl7B1n3to1L37wtrby16hH3ChDK1efKx/Y8oOJQkIGxHlg1xV1/k0rZ8OaWogp3YID7R5s6QHzRyV6q3R5WA1dC/ckQb0UrJEn0dOgYghpYTSfGDf4V/YGLkFGsfG5g1G/V51+dVAxY1nIVV2Rq5Ka+3mVcfc7Yk6Ase9MlPoiCZLBJUlJ7cITd0QNJR4wu8JW0avwrOnkFihvRauva8LoSzVF+dQZ+rYC8LSoQxna0dYb7N5oUAzBHIjlSx6O33SayK8Mr1kx1pfHdteJuHEi45A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(136003)(366004)(346002)(230922051799003)(1800799009)(451199024)(186009)(41300700001)(2616005)(8936002)(4326008)(8676002)(54906003)(66476007)(66446008)(66946007)(64756008)(66556008)(6916009)(316002)(26005)(76116006)(91956017)(86362001)(2906002)(6486002)(122000001)(478600001)(33656002)(38070700005)(53546011)(71200400001)(83380400001)(36756003)(6512007)(5660300002)(38100700002)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AA948B0A006FF84B8C1F6C72F00DA605@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5952
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5a06960d-1219-492a-557e-08dbbe2482a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	slRPUwmptYkStjGNxAbJ95eIQAyjlNCYX6iTR26kQ7wq4hZGUZfLkvOrYB4x8XOJ5/twsAV1dkFBwapkibz2BihR/GsYmW7LbllOvioaR+etwe5ihqE159xOcukdrPLCIUweu72V2/D+2VpSDXZc+YQGqp75YWVV9AE1vVX7NqbFX0jZawwP8RcACa14/nx6VCRUigMMLkZqzcHmNgQvc21zhvuFpucS7C7vfXjobKiYa6+XH21tvWw0DpxXfkXOllBYPXcIOuri2rbz+KX8MKtNkQuqokmP55PBWDqN01Q31NkL2CrWRFhkFQn+QoLj8oYheQBOCJnDv5NyykK46qiOJTYeBrXi9yGgAhW2ih/FVeVdZvGC78fQwGp5kdaAnrUkuFPYJ/ZNC56JKwqbbnwC5umElNj8jKtG367OQWMnqOpVLJ6uonbaD3hz6gYajP/XWWzt/qM0m+EH0VEMJgOw1tdU69J+wRegzlzdl88vuz+kixp81EgcGiyHElf+GRrfJJv01aRJqpz4kIhO0q2mIHxYrIOrWFwSqN74MIbTyfJyqGSNhLCfNLG02LZnKs11exfvs/fjB/g3V1tKfDRggyys6IUDHzEO0XvvqjTK2sTNYlNHa36XEwerrJdA+4FgB5JwPFXA9BRno2NaSEhociS3f2zqYEwM3IyGNw5IInaSP/eRH/7jCFfBCCUQ9w026yAqvD6kum5sYnLAb2RarXBgC/HuQEUt8BqYL6FR+X1unFkAjpQKGagsugL3
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(451199024)(186009)(82310400011)(1800799009)(46966006)(40470700004)(36840700001)(41300700001)(316002)(8676002)(54906003)(70586007)(70206006)(40480700001)(6512007)(8936002)(6862004)(2906002)(4326008)(478600001)(40460700003)(26005)(36860700001)(6486002)(47076005)(33656002)(6506007)(53546011)(81166007)(83380400001)(5660300002)(36756003)(336012)(2616005)(107886003)(86362001)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 00:07:10.9697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5a5d7f-ca52-42e6-27f8-08dbbe2487d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9042

Hi,

> On Sep 26, 2023, at 06:57, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Mon, 25 Sep 2023, Shawn Anastasio wrote:
>> Since ppc64le is still undergoing early bringup, disable the randconfig
>> CI build which was causing spurious CI failures.
>>=20
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20
>=20
>> ---
>> automation/gitlab-ci/build.yaml | 18 ------------------
>> 1 file changed, 18 deletions(-)
>>=20
>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/buil=
d.yaml
>> index 1619e9a558..32af30cced 100644
>> --- a/automation/gitlab-ci/build.yaml
>> +++ b/automation/gitlab-ci/build.yaml
>> @@ -563,24 +563,6 @@ debian-bullseye-gcc-ppc64le-debug:
>>     KBUILD_DEFCONFIG: ppc64_defconfig
>>     HYPERVISOR_ONLY: y
>>=20
>> -debian-bullseye-gcc-ppc64le-randconfig:
>> -  extends: .gcc-ppc64le-cross-build
>> -  variables:
>> -    CONTAINER: debian:bullseye-ppc64le
>> -    KBUILD_DEFCONFIG: ppc64_defconfig
>> -    RANDCONFIG: y
>> -    EXTRA_FIXED_RANDCONFIG:
>> -      CONFIG_COVERAGE=3Dn
>> -
>> -debian-bullseye-gcc-ppc64le-debug-randconfig:
>> -  extends: .gcc-ppc64le-cross-build-debug
>> -  variables:
>> -    CONTAINER: debian:bullseye-ppc64le
>> -    KBUILD_DEFCONFIG: ppc64_defconfig
>> -    RANDCONFIG: y
>> -    EXTRA_FIXED_RANDCONFIG:
>> -      CONFIG_COVERAGE=3Dn
>> -
>> # Yocto test jobs
>> yocto-qemuarm64:
>>   extends: .yocto-test-arm64
>> --=20
>> 2.30.2
>>=20
>=20


