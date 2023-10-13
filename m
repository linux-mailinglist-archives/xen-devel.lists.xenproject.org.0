Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E683F7C9158
	for <lists+xen-devel@lfdr.de>; Sat, 14 Oct 2023 01:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616953.959369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRfJ-0002F4-CF; Fri, 13 Oct 2023 23:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616953.959369; Fri, 13 Oct 2023 23:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrRfJ-0002CE-92; Fri, 13 Oct 2023 23:33:57 +0000
Received: by outflank-mailman (input) for mailman id 616953;
 Fri, 13 Oct 2023 23:33:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/5iA=F3=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qrRfH-0002Av-NN
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 23:33:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7538707-6a20-11ee-9b0e-b553b5be7939;
 Sat, 14 Oct 2023 01:33:51 +0200 (CEST)
Received: from AM6PR01CA0061.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::38) by DB4PR08MB9285.eurprd08.prod.outlook.com
 (2603:10a6:10:3f2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 23:33:48 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::f5) by AM6PR01CA0061.outlook.office365.com
 (2603:10a6:20b:e0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47 via Frontend
 Transport; Fri, 13 Oct 2023 23:33:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.16 via Frontend Transport; Fri, 13 Oct 2023 23:33:47 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211");
 Fri, 13 Oct 2023 23:33:47 +0000
Received: from 82bf1fae3fcd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C61261F-8966-4CB9-BD21-6943F0035BED.1; 
 Fri, 13 Oct 2023 23:33:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82bf1fae3fcd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Oct 2023 23:33:39 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9869.eurprd08.prod.outlook.com (2603:10a6:20b:596::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.41; Fri, 13 Oct
 2023 23:33:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Fri, 13 Oct 2023
 23:33:36 +0000
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
X-Inumbo-ID: f7538707-6a20-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6i5kopqek43+flfOP6vSbXovs94Nimi6d+tXRm5kAI4=;
 b=ZUbmNRBh2V39Ca8daXOnIgkmDSGyp5P1XFtTNbchgEQy/1AVEHrs8aDFUJ47oyB6wINMnyJ9DxJdiUOcUIZVs9+NC7z/qCWUVGQoFTtTM/w0yBOA6v6ulM2aYDPxPEBFdVwvI9kihXjf4LtNsHt+ROW6Qxq01ET5vxy2CWQ7Z2s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1939bc1e9ee64ce0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UafHbNGR3xUG5giZgugpXbgRLQ0Rz8mRYIKZ/Ztwr1Ky21ZhuFWbnX/NDmkQeMc6sjOGdgTg6qSzBJZYOsfYhP1hojz+7vdS8FojygUVlxjrwvIeohKruGDuKF3dicSy2xc1nSiRoZA/iYJ24KX+MeL9sPpMz4vrQqaHcngXdypavsllxcK+eHjODBQhaZmZFrBVFeIItkHu6U51aPjrOurB9O/V/BQf8TzsO8xHVLXDunZ/u3nSHMy6ieDpaRj+7+8v6Zoltb4fai+Wm+YN4k3fnUIOfMJzMb1VH4j0XVvsogPKsHqWh30ZGQrSKVb/85jNRK3KC+MlKieb2f7wgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6i5kopqek43+flfOP6vSbXovs94Nimi6d+tXRm5kAI4=;
 b=VaeRtV9hAPlOB6NWDfM5VcDN3ACoFj5JJc2rlDP478jd3A6TE21XAJcC/8xHDH2xk8cD2rutPWSQ87JZf02m8DZ52rU6+SBImcvaRzi/EntF5MSA0g8C1FEHeMxvep7yHV77HAc6uy+oaK3VCBqwmuQX5sPX/SvMk3u5jnHpvOxpeB0DofXHZjnj1BSmYFZsF0TRqoWLUUj1mPsw5CUCybJb5ZFj4ojA+hbtNqcZjmBkvsvT1YQzPgIFQcN6hNAQvhxXFQIikemd9yeBOgAIIuU7zO/qb2SC+gW8+YBrk5yE+OCUG8Sycdvsa9xYPKanGM+h85peXPwb/7uSutQn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6i5kopqek43+flfOP6vSbXovs94Nimi6d+tXRm5kAI4=;
 b=ZUbmNRBh2V39Ca8daXOnIgkmDSGyp5P1XFtTNbchgEQy/1AVEHrs8aDFUJ47oyB6wINMnyJ9DxJdiUOcUIZVs9+NC7z/qCWUVGQoFTtTM/w0yBOA6v6ulM2aYDPxPEBFdVwvI9kihXjf4LtNsHt+ROW6Qxq01ET5vxy2CWQ7Z2s=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v7 2/8] xen/arm: Split MMU system SMP MM bringup code to
 mmu/smpboot.c
Thread-Topic: [PATCH v7 2/8] xen/arm: Split MMU system SMP MM bringup code to
 mmu/smpboot.c
Thread-Index: AQHZ+kx0F2v+gIdRRkSLGpfAPDpgbrBH/UYAgABpcYA=
Date: Fri, 13 Oct 2023 23:33:36 +0000
Message-ID: <9F177421-D23F-4FE8-82B2-76D73940764D@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-3-Henry.Wang@arm.com>
 <48223382-531f-4638-870c-fdcc58bb0e97@xen.org>
In-Reply-To: <48223382-531f-4638-870c-fdcc58bb0e97@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9869:EE_|AM7EUR03FT005:EE_|DB4PR08MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 46593023-bdf5-4a52-d285-08dbcc44d90f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uNopQ44ueN/MgWH34+yAFwvj6a4C4ZFScJZRoV8RNiuj8hi0XTa/AmRrLmnhI99W372TX0/XVBR8mdax67SDnAO1oDVRW+UidUSDJsmv1OIHda27gQth3bYrmue/tuCo8jUPyX6OMdNzTr5zq87LN7IkXtH3fFAH9kBZ7SQS24s2LPaKe4TpKV2e+OcIp9zt5BZ6Fae/aMrr7w9qkFVIYS+4twS2CiNWxDVpGztZesHIMcsJVg0+3mP0dYMDWkJcozRnbETVwb7/mvDZdOXFTHiGCHwcaOdXHcKlPKCk7RYe0mPfIg1ObM5ZnH0FCe2+RWMqJwiJZr4QTHy7Sz3EzOVytfXZSI1IQD2ql5s+TpvNzO8hKThq+ZtzMue6UGIgw4s0G30/8rQg3sqvPbYbEK09XH0REAcZZrM7kdz9kd+98vj+JtSDSM3OsxjLt+8UMTX0w2dcD51lTaOtvJ79jSGfw96DQxwtx8BLFxPURbog8uwKYB8njfXQk0QsIo9BNQqRPS25PyF3ylvAQxsjLKZFe4Vj0zlPiGokuk8L+ZK5z0cZRTvFjODTz1p3XIbFppZKWL4Yw2+b83fGzn1vkCg/F+BTMctYH9XUyeZjx/kn1hqSKpS6Oels82iV6hYbb/iDXZ2fkupO4FdskH8Xow==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(396003)(376002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6486002)(2616005)(6512007)(53546011)(6506007)(478600001)(2906002)(4744005)(66556008)(71200400001)(26005)(66476007)(76116006)(8936002)(54906003)(91956017)(66946007)(66446008)(64756008)(6916009)(316002)(4326008)(8676002)(5660300002)(41300700001)(33656002)(86362001)(38100700002)(122000001)(36756003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CD844F8ADB6DC0418C09668BD798DE3F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9869
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aad97f94-701d-4248-793d-08dbcc44d248
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7AyLZDMgIkGfVeev7thvAcJUu+XSZ40+BInaiyUt4WCu6SH61Xh0TT2NHWAUNyIXPXXxXfSH+/e9VhSsK429zTXyGFVdoTIvhoyrRW6wxu65Vs6Ld0sWqXN0qVJQUU7TPOtO5D0FtJfS0GraUevAxOu4VzuEtkLVLQZKexGRfwUOMxAK4xpafpGfR5sbyBgKuBnTOunxWwUQ2f5ZNxGPVRGf0dFb3A+KKDibzN3nCq4vmnTAGWOE3jloj7eZASn87qfo+kmXZOzEbK/0sILuf2bZv6SvmK+hqnA2Rs9Ej9E2qrrBCLeHL5TObdq1Z9z2XPT24v23XiDgbkRaNNAZft3sRp5fUXbWRXhHhssaXZJInwPi6lr75LOkgDL+yHDNyUdP1cSPK4fvMK0UJ+2MWofJjpWHTJc4mZZFaT/XKc6w3cvJEpQQ+ZhVDv8ZPylGqTeT9IIGdxoyHiqHF+T86BL1ePd8TM4hkA6+OmVr4yZzBfIsMDnbh+AZY015HuCWwsZHekOfHrkQ2SivJv/8h8YpHlspkujn3PwxjRkHWoXKvVpfgY6UwozmHVIOY6LlBj8udh6fWqA/MwxIYYe2r2RXpnQEjhrWWW8lZWP/4QrsItqrIKvLI+nXiNbIgtABNxpcl/toWU+uiM3wIXbP15Dyz9HHju8kUjCfrjvETqlPMSENNqvASBU0pcfp2be7MqezV+lq9UhfPBYoc3K1VtbYnK9zU8n4EJCnYcH7WqM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(82310400011)(36840700001)(46966006)(40470700004)(81166007)(356005)(82740400003)(40460700003)(40480700001)(36756003)(86362001)(33656002)(2906002)(478600001)(4744005)(6486002)(6512007)(2616005)(26005)(53546011)(5660300002)(41300700001)(4326008)(6862004)(70586007)(8676002)(70206006)(316002)(54906003)(6506007)(8936002)(47076005)(36860700001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 23:33:47.3967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46593023-bdf5-4a52-d285-08dbcc44d90f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9285

Hi Julien,

> On Oct 14, 2023, at 01:16, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Henry,
>=20
> On 09/10/2023 02:03, Henry Wang wrote:
>> +#ifdef CONFIG_ARM_64
>> +int init_secondary_pagetables(int cpu)
>> +{
>> +    clear_boot_pagetables();
>> +
>> +    /*
>> +     * Set init_ttbr for this CPU coming up. All CPus share a single se=
tof
>> +     * pagetables, but rewrite it each time for consistency with 32 bit=
.
>> +     */
>> +    init_ttbr =3D virt_to_maddr((uintptr_t) xen_pgtable);
>=20
> The cast should be necessary. With this dropped:

Nice catch, my mistake, will change in v8.

>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks!

Kind regards,
Henry

>=20
> Cheers,
>=20
> --=20
> Julien Grall


