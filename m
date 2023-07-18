Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B67578D7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 12:06:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565081.882962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLhaA-0003kv-FN; Tue, 18 Jul 2023 10:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565081.882962; Tue, 18 Jul 2023 10:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLhaA-0003iZ-BM; Tue, 18 Jul 2023 10:05:26 +0000
Received: by outflank-mailman (input) for mailman id 565081;
 Tue, 18 Jul 2023 10:05:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=88xE=DE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qLha8-0003iT-9Z
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 10:05:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bf1ed44-2552-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 12:05:23 +0200 (CEST)
Received: from DUZPR01CA0125.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::17) by AM0PR08MB5313.eurprd08.prod.outlook.com
 (2603:10a6:208:17f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 10:05:19 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bc:cafe::f5) by DUZPR01CA0125.outlook.office365.com
 (2603:10a6:10:4bc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 10:05:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 10:05:19 +0000
Received: ("Tessian outbound f5de790fcf89:v145");
 Tue, 18 Jul 2023 10:05:19 +0000
Received: from 418430abdbd7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1FD4F538-6F1C-4D65-B530-731997A7C40D.1; 
 Tue, 18 Jul 2023 10:05:07 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 418430abdbd7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 10:05:07 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by DB9PR08MB6362.eurprd08.prod.outlook.com (2603:10a6:10:25a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 10:05:04 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 10:05:04 +0000
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
X-Inumbo-ID: 9bf1ed44-2552-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2sn6TXjX9SVIBOnlPuFS5o7VszCt87+7nyoNk+Yv+s=;
 b=dDicXCBSbReJrVEsDiI5gY1p3mjkZCLfinvjM8KoaUiEnyJZ5yPmSRaf4Z0ZJ6jwB5Jp1WBUXswEOlGYkHMqgyhXqXcFhpN6mcZSl/VAdKbwPn2kQA/84OdgT+ifcNATK7ErZiGEGBebnbZtkQJhVq8uRdow2rkfMNW+ORTnCCE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 88d75ca8eba2c4c4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xr9olOqE/ssS6pxwYCFW7CQEDjhoiv/LCK87bcNS7ZhrPZSUyHf8ZbjEcPTxuUMeU5t8wITXyt0dFtl8Q54Eq4YyZA6um/HsrvSreCzxqPl3MIPTDSpiPUn2vbkolfLoBKDLrEmRr4gjSW/bsxGaGJV52rnEIZk73OYIItDjaX8+k7Le0yc1ttoI+L41jDcvrco5K53Q9wPd6cFIJS9GRmPueRKS/70fPRU1uTqaBWIxW5QQIaqjGqmGytmlY2Ek7xlNYzZxnpZJUTgqeGXXuy4NsW5HggTzXz1K5834Hx/Yo3bIwfjibPGXkszgTdL7xPxGU9CaH3G1fw24TIMnvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2sn6TXjX9SVIBOnlPuFS5o7VszCt87+7nyoNk+Yv+s=;
 b=A707MwBo7m0WSx3wDVqEzgGIvnrig7Is3qUOWmWV8fI4r8c8JeVfgcyTbFqqbMGbn4FFx2t88Ugz/9XqX6AQQ1jOf2o5ZtkWx6eUq1QOVzrb1MJ3KfC9OuqC5ygYjubSADduViXOgd7949W7o2V8NNeXoDXBIAayQnWA35GGAY++VemqH06QgwNW0lLcFP8bWvlSaHNOVOnLo0Sa868SBgPx2Jmbi6T9mczJBl6QflEla/oHEzIsvzKsYehLOZzUNer89wNavxbomKLH1GVTunN22GvKtvR877r2nh2llPMEzNie8gKu3N6SAFaEmFMGVOVBBIDV+2QRczkK5iMjhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2sn6TXjX9SVIBOnlPuFS5o7VszCt87+7nyoNk+Yv+s=;
 b=dDicXCBSbReJrVEsDiI5gY1p3mjkZCLfinvjM8KoaUiEnyJZ5yPmSRaf4Z0ZJ6jwB5Jp1WBUXswEOlGYkHMqgyhXqXcFhpN6mcZSl/VAdKbwPn2kQA/84OdgT+ifcNATK7ErZiGEGBebnbZtkQJhVq8uRdow2rkfMNW+ORTnCCE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v10 12/24] xen/arm: ffa: send guest events to Secure
 Partitions
Thread-Topic: [XEN PATCH v10 12/24] xen/arm: ffa: send guest events to Secure
 Partitions
Thread-Index: AQHZuH9Y3GtzhbsKLUy5Uqxsc0bAdq+/TZoA
Date: Tue, 18 Jul 2023 10:05:04 +0000
Message-ID: <98D9585F-AE4B-4AC2-9D3B-BAF5590C0DD7@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-13-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-13-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|DB9PR08MB6362:EE_|DBAEUR03FT032:EE_|AM0PR08MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6aacc5-9dd2-40ec-bd9d-08db87767de7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F9AK7VF/a4CpDLGjjeQmzrf3Qa3TFy+jXmnY4tv0JWKLYyhUGQDjpOSTQQy4gZzxAc/Y/QD9ypX2D6+O4Orh7ih6AIr5Vcyj0v9b/fqcNnODzCdE6Cx0OagYTiavZRsUaxHVeLv9yXn8EnkygVPDfj9/1jmWpr36Sw0mScu9anRa1BKGaQi/N9dgrH6VF0cpB3j0s0fF27KLY52VuQcWv3OQSgwdaQfCodPW0ezKt8675R1uhC79w+wAj5pdyuntqkA2sQZyk4AOP4qJKdVAuqER/UjM/nJxn3Pe6uOoHNMrtUrwti+/ZkMGat+6tJe6aNzFp39plM8a61pPNjuSDtjXf9vKQfS9zfFH7FY+LNB+mNOSTE5nG4mZ5P+PQHY7fETb6Vjtrb9ag/Yv326pE4SuFrncVj/DToI91NTrv88+Re3Ql676j3bOQuwN/UofCkj2rMN4BqwCv5af0yJVvPqf0ExcGQOQFf8xzTT86QRCJZmlbJtSb/fa5ouLZOYE9qbAGrphuCTrf2i2zSI9Wgqin6LB4ELJg/zZXGzbXN4ytzXD2IMwcZrvVci5rZB18aK6inWbvYs1xzB6DRw08++kR7j0qzlIbLwPOlmII6QxYkir1Sopm0JP3mzpXGP5q6qX8IuxcuC6rZSgYwBYng==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199021)(6486002)(53546011)(6506007)(6512007)(36756003)(122000001)(2616005)(83380400001)(38070700005)(86362001)(38100700002)(33656002)(186003)(8936002)(8676002)(41300700001)(2906002)(478600001)(91956017)(5660300002)(64756008)(4326008)(76116006)(316002)(6916009)(66446008)(66476007)(66946007)(66556008)(54906003)(66899021)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <485E34A84464A54AB05065362EBB865B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6362
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	381f4a32-0d91-4f4c-a668-08db87767543
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8YKc2Wb/bBYml/ishGs+sVTlba0W23VPh76GNQQbWRuxKZUJaBJhtEphkH7xH+pZ32xWW78Edch7sp0tcqsNABZBuqma2b38cSO8vP9OHKTm/7Rzz1io45+h1nOJ4VJhLd/TPvWHy1G5lBbfTUJPyx9xKZ92i/B7SuR3c8l9ioiJI3m8CpA8JPFixPjDb7DoUUdKd5XJ2G3CI1IjBRyKZkHXKdLOIDlAf/FBapHjGfGZNlHFy4hAdbp+I7PlCB8K1U5RN1s0j6zTqFHpxVJC9sMAhqZziUwBhprv8PXbRe+I7TJ694u8woUFGo4QswO7pvSeq2Es0CW7ciJNymn0Yxcrqq/HC3Epq0cU2uuIhJk2Rps8tyOORKeX6WduW+EXc1rAIUz7sF4P3PNajfhigB4tXHUkhBCGNhTKEElZ/FryT0CU5creRjwt7ncBX707yDDS+ylGxN4vVgdj87T61AMpbRI08iynOIZWTv8PaqrAurhwYKGvf9k1QxKHfCvPpdK3Pu7oE1aT4agoj2A34PvdrRY6MUNcLqqZxBXZt4mVTXDeKCU5om+QQkVsSk9zm6MEJtNeNtFWJnaNviCH7IDjwCH4/OeoLbxnSMVnm1p6/dKbAWEt4LIE6/+JEBw3Vre0hwKfPZ9jvRjncvdYhQGUeI3n8N196gwGn3ISTBH/ezcl44Mir/TOExJIskc+S61eSihstBIH9ilMPTFQwoph+WBIyTOKeGLAlVSQ2/XQ3lnNQHf8xVMcVRewONAE
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(136003)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(66899021)(478600001)(6486002)(54906003)(83380400001)(336012)(2616005)(47076005)(40460700003)(36756003)(86362001)(33656002)(36860700001)(40480700001)(356005)(186003)(2906002)(26005)(6506007)(53546011)(107886003)(6512007)(316002)(6862004)(81166007)(70206006)(70586007)(4326008)(41300700001)(8936002)(8676002)(82740400003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 10:05:19.1130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6aacc5-9dd2-40ec-bd9d-08db87767de7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5313

Hi Jens,

> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> The FF-A specification defines framework messages sent as direct
> requests when certain events occurs. For instance when a VM (guest) is
> created or destroyed. Only SPs which have subscribed to these events
> will receive them. An SP can subscribe to these messages in its
> partition properties.
>=20
> Adds a check that the SP supports the needed FF-A features
> FFA_PARTITION_INFO_GET and FFA_RX_RELEASE.
>=20
> The partition properties of each SP is retrieved with
> FFA_PARTITION_INFO_GET which returns the information in our RX buffer.
> Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
> caller (us), so once we're done with the buffer it must be released
> using FFA_RX_RELEASE before another call can be made.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 233 ++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 231 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index f8ccaabc568d..d755363de686 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -160,14 +160,33 @@
> #define FFA_MSG_SEND                    0x8400006EU
> #define FFA_MSG_POLL                    0x8400006AU
>=20
> +/* Partition information descriptor */
> +struct ffa_partition_info_1_1 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +    uint8_t uuid[16];
> +};
> +
> struct ffa_ctx {
>     /* FF-A version used by the guest */
>     uint32_t guest_vers;
> +    /*
> +     * Number of SPs that we have sent a VM created signal to, used in
> +     * ffa_domain_teardown() to know which SPs need to be signalled.
> +     */
> +    uint16_t create_signal_count;
> };
>=20
> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t __ro_after_init ffa_version;
>=20
> +/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
> +static uint16_t *subscr_vm_created __read_mostly;
> +static uint16_t subscr_vm_created_count __read_mostly;
> +static uint16_t *subscr_vm_destroyed __read_mostly;
> +static uint16_t subscr_vm_destroyed_count __read_mostly;
> +
> /*
>  * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
>  * number of pages used in each of these buffers.
> @@ -251,6 +270,87 @@ static int32_t ffa_rxtx_map(paddr_t tx_addr, paddr_t=
 rx_addr,
>     return ffa_simple_call(FFA_RXTX_MAP_64, tx_addr, rx_addr, page_count,=
 0);
> }
>=20
> +static int32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_t=
 w3,
> +                                      uint32_t w4, uint32_t w5,
> +                                      uint32_t *count)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_PARTITION_INFO_GET,
> +        .a1 =3D w1,
> +        .a2 =3D w2,
> +        .a3 =3D w3,
> +        .a4 =3D w4,
> +        .a5 =3D w5,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    uint32_t ret;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    ret =3D get_ffa_ret_code(&resp);
> +    if ( !ret )
> +        *count =3D resp.a2;
> +
> +    return ret;
> +}
> +
> +static int32_t ffa_rx_release(void)
> +{
> +    return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
> +}
> +
> +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> +                                      uint8_t msg)
> +{
> +    uint32_t exp_resp =3D FFA_MSG_FLAG_FRAMEWORK;
> +    unsigned int retry_count =3D 0;
> +    int32_t res;
> +
> +    if ( msg =3D=3D FFA_MSG_SEND_VM_CREATED )
> +        exp_resp |=3D FFA_MSG_RESP_VM_CREATED;
> +    else if ( msg =3D=3D FFA_MSG_SEND_VM_DESTROYED )
> +        exp_resp |=3D FFA_MSG_RESP_VM_DESTROYED;
> +    else
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    do {
> +        const struct arm_smccc_1_2_regs arg =3D {
> +            .a0 =3D FFA_MSG_SEND_DIRECT_REQ_32,
> +            .a1 =3D sp_id,
> +            .a2 =3D FFA_MSG_FLAG_FRAMEWORK | msg,
> +            .a5 =3D vm_id,
> +        };
> +        struct arm_smccc_1_2_regs resp;
> +
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        if ( resp.a0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 !=3D ex=
p_resp )
> +        {
> +            /*
> +             * This is an invalid response, likely due to some error in =
the
> +             * implementation of the ABI.
> +             */
> +            return FFA_RET_INVALID_PARAMETERS;
> +        }
> +        res =3D resp.a3;
> +        if ( ++retry_count > 10 )
> +        {
> +            /*
> +             * TODO
> +             * FFA_RET_INTERRUPTED means that the SPMC has a pending
> +             * non-secure interrupt, we need a way of delivering that
> +             * non-secure interrupt.
> +             * FFA_RET_RETRY is the SP telling us that it's temporarily
> +             * blocked from handling the direct request, we need a gener=
ic
> +             * way to deal with this.
> +             * For now in both cases, give up after a few retries.
> +             */
> +            return res;
> +        }
> +    } while ( res =3D=3D FFA_RET_INTERRUPTED || res =3D=3D FFA_RET_RETRY=
 );
> +
> +    return res;
> +}
> +
> static uint16_t get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
> @@ -374,6 +474,8 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
> static int ffa_domain_init(struct domain *d)
> {
>     struct ffa_ctx *ctx;
> +    unsigned int n;
> +    int32_t res;
>=20
>     if ( !ffa_version )
>         return -ENODEV;
> @@ -387,20 +489,68 @@ static int ffa_domain_init(struct domain *d)
>     ctx =3D xzalloc(struct ffa_ctx);
>     if ( !ctx )
>         return -ENOMEM;
> -

This line removal does not seem to be intended.

>     d->arch.tee =3D ctx;
>=20
> +    for ( n =3D 0; n < subscr_vm_created_count; n++ )
> +    {
> +        res =3D ffa_direct_req_send_vm(subscr_vm_created[n], get_vm_id(d=
),
> +                                     FFA_MSG_SEND_VM_CREATED);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %=
u to  %u: res %d\n",
> +                   get_vm_id(d), subscr_vm_created[n], res);
> +            ctx->create_signal_count =3D n;
> +            return -EIO;
> +        }
> +    }
> +    ctx->create_signal_count =3D n;

For clarity here, i would do:
signal_count =3D subscr_vm_created_count

> +
>     return 0;
> }
>=20
> +static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
> +                              uint16_t end, uint16_t vm_id)
> +{
> +    unsigned int n;
> +
> +    for (n =3D start; n < end; n++)

Coding style, missing spaces

> +    {
> +        if (subscr[n] =3D=3D vm_id)

Coding style, missing spaces

> +            return true;
> +    }
> +
> +    return false;
> +}
> +
> /* This function is supposed to undo what ffa_domain_init() has done */
> static int ffa_domain_teardown(struct domain *d)
> {
>     struct ffa_ctx *ctx =3D d->arch.tee;
> +    unsigned int n;
> +    int32_t res;
>=20
>     if ( !ctx )
>         return 0;
>=20
> +    for ( n =3D 0; n < subscr_vm_destroyed_count; n++ )
> +    {
> +        /*
> +         * Skip SPs subscribed to the VM created event that never was
> +         * notified of the VM creation due to an error during
> +         * ffa_domain_init().
> +         */
> +        if ( is_in_subscr_list(subscr_vm_created, ctx->create_signal_cou=
nt,
> +                               subscr_vm_created_count, get_vm_id(d)) )
> +            continue;

I am not following the logic here and would need some explanations.

A SP is subscribing to be informed of any VM creation, but here you check
the list against the VM ID that is destroyed.

Also a SP could subscribe to be informed of VM destroyed but not VM created=
.=20

In my head the logic should be:
if (signal_count < subscr_vm_created_count)
	for each sp in subscr_vm_created
		if is_in_list subscr_vm_destroyed sp
			send_destroyed
else
	for each subscr_vm_destroyed
		send_destroyed


> +
> +        res =3D ffa_direct_req_send_vm(subscr_vm_destroyed[n], get_vm_id=
(d),
> +                                     FFA_MSG_SEND_VM_DESTROYED);
> +
> +        if ( res )
> +            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_i=
d %u to  %u: res %d\n",
> +                   get_vm_id(d), subscr_vm_destroyed[n], res);
> +    }
> +
>     XFREE(d->arch.tee);
>=20
>     return 0;
> @@ -411,6 +561,81 @@ static int ffa_relinquish_resources(struct domain *d=
)
>     return 0;
> }
>=20
> +static void uninit_subscribers(void)
> +{
> +        subscr_vm_created_count =3D 0;
> +        subscr_vm_destroyed_count =3D 0;
> +        XFREE(subscr_vm_created);
> +        XFREE(subscr_vm_destroyed);
> +}
> +
> +static bool init_subscribers(struct ffa_partition_info_1_1 *fpi, uint16_=
t count)
> +{
> +    uint16_t n;
> +    uint16_t c_pos;
> +    uint16_t d_pos;
> +
> +    subscr_vm_created_count =3D 0;
> +    subscr_vm_destroyed_count =3D 0;
> +    for ( n =3D 0; n < count; n++ )
> +    {
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED)
Coding style: spaces

> +            subscr_vm_created_count++;
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED)
Coding style: spaces

Cheers
Bertrand

> +            subscr_vm_destroyed_count++;
> +    }
> +
> +    if ( subscr_vm_created_count )
> +        subscr_vm_created =3D xzalloc_array(uint16_t, subscr_vm_created_=
count);
> +    if ( subscr_vm_destroyed_count )
> +        subscr_vm_destroyed =3D xzalloc_array(uint16_t,
> +                                            subscr_vm_destroyed_count);
> +    if ( (subscr_vm_created_count && !subscr_vm_created) ||
> +         (subscr_vm_destroyed_count && !subscr_vm_destroyed) )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n"=
);
> +        uninit_subscribers();
> +        return false;
> +    }
> +
> +    for ( c_pos =3D 0, d_pos =3D 0, n =3D 0; n < count; n++ )
> +    {
> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> +            subscr_vm_created[c_pos++] =3D fpi[n].id;
> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED=
 )
> +            subscr_vm_destroyed[d_pos++] =3D fpi[n].id;
> +    }
> +
> +    return true;
> +}
> +
> +static bool init_sps(void)
> +{
> +    bool ret =3D false;
> +    uint32_t count;
> +    int e;
> +
> +    e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count);
> +    if ( e )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
> +        goto out;
> +    }
> +
> +    if ( count >=3D UINT16_MAX )
> +    {
> +        printk(XENLOG_ERR "ffa: Impossible number of SPs: %u\n", count);
> +        goto out;
> +    }
> +
> +    ret =3D init_subscribers(ffa_rx, count);
> +
> +out:
> +    ffa_rx_release();
> +
> +    return ret;
> +}
> +
> static bool ffa_probe(void)
> {
>     uint32_t vers;
> @@ -462,7 +687,8 @@ static bool ffa_probe(void)
>      * TODO: Rework the code to allow domain to use a subset of the
>      * features supported.
>      */
> -    if (
> +    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
> +         !check_mandatory_feature(FFA_RX_RELEASE) ||
>          !check_mandatory_feature(FFA_RXTX_MAP_64) ||
>          !check_mandatory_feature(FFA_RXTX_UNMAP) ||
>          !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> @@ -484,6 +710,9 @@ static bool ffa_probe(void)
>     }
>     ffa_version =3D vers;
>=20
> +    if ( !init_sps() )
> +        goto err_free_ffa_tx;
> +
>     return true;
>=20
> err_free_ffa_tx:
> --=20
> 2.34.1
>=20


