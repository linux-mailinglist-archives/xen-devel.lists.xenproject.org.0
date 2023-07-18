Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B95757815
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 11:32:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565044.882871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh4K-0003fa-OZ; Tue, 18 Jul 2023 09:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565044.882871; Tue, 18 Jul 2023 09:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLh4K-0003cw-Lp; Tue, 18 Jul 2023 09:32:32 +0000
Received: by outflank-mailman (input) for mailman id 565044;
 Tue, 18 Jul 2023 09:32:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=88xE=DE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qLh4I-0003cn-Rw
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 09:32:30 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2077.outbound.protection.outlook.com [40.107.13.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03e2bb86-254e-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 11:32:30 +0200 (CEST)
Received: from DU2PR04CA0290.eurprd04.prod.outlook.com (2603:10a6:10:28c::25)
 by DU0PR08MB8090.eurprd08.prod.outlook.com (2603:10a6:10:3e9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Tue, 18 Jul
 2023 09:31:54 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::37) by DU2PR04CA0290.outlook.office365.com
 (2603:10a6:10:28c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 09:31:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 09:31:54 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Tue, 18 Jul 2023 09:31:54 +0000
Received: from 18c611d46daa.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6BC555C7-97A8-4AE6-A9AB-5EFF955ACAA1.1; 
 Tue, 18 Jul 2023 09:31:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18c611d46daa.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 09:31:47 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by VE1PR08MB5646.eurprd08.prod.outlook.com (2603:10a6:800:1a9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 09:31:45 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:31:45 +0000
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
X-Inumbo-ID: 03e2bb86-254e-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nkxybcKz/kKqitIA/L3d1MUkjLXX2JEm/+eTdp61zk=;
 b=aSn12jnfFX3nasbfh9/DJvlLCIp2LIfFbh13lkeEnmSrLkfLbSfrNkm9Pg/62hPj7WvQ9BlHLHwHoZK0qpplmNtjTqnBAUPhehW1y35sN5rNxq1kRU7pKHNLsywsAhvsHrzoRz2ZgdqKM7919DsOT8mA95G0zQNOfAn2ylT12kM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 441db6f728790835
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUHuB5/3xxpPxZtvVnUBd4RFCTGDhVQBrJC64c+TDBD6Bn8yia3ChBWXQlEyW0RSRHk1mlnF/neopP9Baf6LaJkvIc4Y2383a7PiDATbIsFReed0FPOMRcWkAjLRaeSTpTSRz9jn2BasTLqvdzOLm4KTL655PK4dkfFSSkMncmNvnJVl3NLnUUWmU2VIjUQ65UQA5kcBR7Kr4ku2FM3dUBLWUzccM0xYNHPIQyv2IVsXLEJjoUb2Pbe4m3D0uiyOr1VFpWITBzgojjMBk1mJD7CeplRVZklh35TjmlOxFPywtbT3Nwfko6B2GgQ4laddhlxpfWTW4o94G97eCasPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nkxybcKz/kKqitIA/L3d1MUkjLXX2JEm/+eTdp61zk=;
 b=mnHPPR3f58xq3qcjzTwNj1HaCY8DO2v7NkhHf1Q03QdFW+wa5XxGG4/2kEHTN0aXAn70Bt1PbcJFUjCmW78N2lHF6CPrMqiZDTIZEGNOt8eaWSHELW8gfUgjg6mCu/NMNWAsjT5FtwrSsTNvQpy0sCTcLfS402/H5yg75BsL7xJnkK8d2OvfwBOmPHFwDTY9EEm4rIH2dEzjlzRT/9ME2hhoBOnW9U6U3YMCbHOgy1r3KZPLy6hi4RVjNjCm8U4pfiyp+jgeALgxLOVURb0pY7pha7fqKxJnhwfPE5zBUtGQcAX14U2f4dOe6Y3QSzogG3b9SuqWXjfXMm3az5B2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nkxybcKz/kKqitIA/L3d1MUkjLXX2JEm/+eTdp61zk=;
 b=aSn12jnfFX3nasbfh9/DJvlLCIp2LIfFbh13lkeEnmSrLkfLbSfrNkm9Pg/62hPj7WvQ9BlHLHwHoZK0qpplmNtjTqnBAUPhehW1y35sN5rNxq1kRU7pKHNLsywsAhvsHrzoRz2ZgdqKM7919DsOT8mA95G0zQNOfAn2ylT12kM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v10 06/24] xen/arm: ffa: add flags for
 FFA_PARTITION_INFO_GET
Thread-Topic: [XEN PATCH v10 06/24] xen/arm: ffa: add flags for
 FFA_PARTITION_INFO_GET
Thread-Index: AQHZuH9UcezrZ1Z5z0iYCGhuk3ABB6+/REoA
Date: Tue, 18 Jul 2023 09:31:45 +0000
Message-ID: <6858FD7A-9F24-497E-B976-E21B776CF18B@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-7-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-7-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|VE1PR08MB5646:EE_|DBAEUR03FT016:EE_|DU0PR08MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d939ca0-2075-4052-1c04-08db8771d2f2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fspfLjQTINQFUFAZE6zssZ3V2ZN5uLIIRrm9KAQCv2V7NIAJ/FqfapKP/rvC7OQQoRbG7ciV/1YxqFxyI334nJcX2bKGZSCQB0r5YxZ7tUdkDLTLT3XdH2rRqBsxsU3yZMcjNHHzbvOlkah8gfACkmSGkrE/MulYltz0EwrLWOpDN0lk2uKwm8fN0WfNBdj2g+VP9kwGfdNWDrRws2CtqBGM9YBYKWwWa+zAhx9cOdDU9uA+4d/1MNyGXzhtACADW18zGSo8JCNHTnQ7WWnWFQGWKn9Lc+0PlUL6Aqrfw5rLqKGmdiNF+7m6EhzWzPlqEehbD8pj+/UYGzkhjBB24ZgPYely6hM2FR/JDotfviSRoSER9eKoweV2zKFsDfegizRibRer1gt2hPqVwdhvhoWOxLK66L2zTi7BKQC9e6Whs5lqaw3VE3tmKNSMZLbrnRbTrAakUPV11zxNav4TLgujZtIqFkocIGNgRwGzd/ZJYaywJgNJt9Bm6qkZKx+ABH1pVzfqC0HyW/Nrg5qYXttkfiwStqg23kdudOKwL6GEzhOo3D3229GOjg85hXJ4iusAsueOW8lqG0tO6cg1EavvNm/1ns33y9/Gy2XN0cAiXpnrTLQM3UAo0XqyO2D24gtzdxnNbDUjihP7QpwYwA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(2616005)(53546011)(41300700001)(6506007)(316002)(6512007)(83380400001)(186003)(6486002)(478600001)(122000001)(71200400001)(4326008)(6916009)(76116006)(66476007)(66946007)(91956017)(66556008)(64756008)(66446008)(38100700002)(33656002)(86362001)(8676002)(2906002)(8936002)(36756003)(54906003)(38070700005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA1BD542C3A2074FB5335536FF1C9B86@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5646
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b73629bd-e2e5-4c62-cb01-08db8771cd7e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EWWHA3/l8On9r/bcfpuXOezdwDNSEtJg+u351mUaR+C0lOFMCNmpgIgoKnPueYiCAPYOdedVXm2A6WLyiN58XbgYVeNrvC3hWCdL0PFjqeZn4xlgwwuTanFRyeifPqOrh2nN0ehyQ1MNct/yRID/T+TwN73GnTFCjRtERFJgwJCXDCqJlWjhd8z7ExduhKULvO4ottbHQWRGE7SfO7pFohBqzZ8fyU3MymaPNoWxQyt0Uzct1N5AFKVi3BoN62CDGkJDO+pUuEB1rHgCVEysoCqQF4VNKgvrgq0dawqa9knrSw8MkbKoQeFB8kquBC4y/bTfX+rXNfwcY8jRyZ4Bms8o/FavVecYD7F3PfSfDbVkOkm3CFwcQFxV54l/L9gSQIv7Urvy9ZD+sTWYzGrHaKdDhGqhmWLyW5LNNt4j+fPjRP5HaW/AgBAWDRvvdrhFoLif2JWdWNEwqvYvmwumgh/8IJb2T2hvd4r9tEAsEoOCw4ScCGQRRvgxeyojucUdwwS5pEQ4m6x1FioKdCA8xU7OymuLWNgyLrEARWrctSTDDMxwu5vpcRQy+B9Pj1je5NT5OsnKCLonl9Upo9KlCVgypKO4+EAUuz0p6NNZZQiJPE/ewNBnL7N+31goODkJdVHyalcAwm3YYQZQzvnN2yoFAj/O4G/bOte+KS9hKe9XSt939rOc/IO6IC6QK6mV6RpWSNx7sRMhLFbjnGGgFYKwendj947F9fFa4LnWb7D12xk+3G2U9mGPL58vtLUx
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199021)(82310400008)(40470700004)(46966006)(36840700001)(86362001)(6486002)(53546011)(336012)(186003)(36860700001)(40460700003)(82740400003)(356005)(316002)(40480700001)(4326008)(70206006)(70586007)(6512007)(36756003)(26005)(41300700001)(6506007)(81166007)(2616005)(54906003)(2906002)(47076005)(83380400001)(5660300002)(33656002)(478600001)(6862004)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:31:54.3193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d939ca0-2075-4052-1c04-08db8771d2f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8090

Hi Jens,

> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> According to DEN0077A version 1.1 REL0, section 13.8, defines
> flags used for the function FFA_PARTITION_INFO_GET.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 34 ++++++++++++++++++++++++++++++++++
> 1 file changed, 34 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 2296e3115beb..c1dead73d1f2 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -57,6 +57,40 @@
> #define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
>                                                  FFA_MY_VERSION_MINOR)
>=20
> +/*
> + * Flags to determine partition properties in FFA_PARTITION_INFO_GET ret=
urn
> + * message:
> + * BIT(0): Supports receipt of direct requests
> + * BIT(1): Can send direct requests
> + * BIT(2): Can send and receive indirect messages
> + * BIT(3): Supports receipt of notifications
> + * BIT(4-5): Partition ID is a PE endpoint ID
> + * BIT(6): Partition must be informed about each VM that is created by
> + *         the Hypervisor
> + * BIT(7): Partition must be informed about each VM that is destroyed by
> + *         the Hypervisor
> + * BIT(8): Partition runs in the AArch64 execution state else AArch32
> + *         execution state
> + */
> +#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0, U)
> +#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1, U)
> +#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2, U)
> +#define FFA_PART_PROP_RECV_NOTIF        BIT(3, U)
> +#define FFA_PART_PROP_IS_TYPE_MASK      (3U << 4)
> +#define FFA_PART_PROP_IS_PE_ID          (0U << 4)
> +#define FFA_PART_PROP_IS_SEPID_INDEP    (1U << 4)
> +#define FFA_PART_PROP_IS_SEPID_DEP      (2U << 4)
> +#define FFA_PART_PROP_IS_AUX_ID         (3U << 4)
> +#define FFA_PART_PROP_NOTIF_CREATED     BIT(6, U)
> +#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7, U)
> +#define FFA_PART_PROP_AARCH64_STATE     BIT(8, U)
> +
> +/*
> + * Flag used as parameter to FFA_PARTITION_INFO_GET to return partition
> + * count only.
> + */
> +#define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
> +
> /* Function IDs */
> #define FFA_ERROR                       0x84000060U
> #define FFA_SUCCESS_32                  0x84000061U
> --=20
> 2.34.1
>=20


