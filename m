Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C106A9472
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 10:51:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505690.778574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY24R-0006no-6H; Fri, 03 Mar 2023 09:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505690.778574; Fri, 03 Mar 2023 09:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY24R-0006kt-2Q; Fri, 03 Mar 2023 09:51:23 +0000
Received: by outflank-mailman (input) for mailman id 505690;
 Fri, 03 Mar 2023 09:51:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/yG=63=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pY24P-0006ki-Eg
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 09:51:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f161f64e-b9a8-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 10:51:17 +0100 (CET)
Received: from DU2PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:10:234::25)
 by AS8PR08MB9792.eurprd08.prod.outlook.com (2603:10a6:20b:613::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 09:51:09 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::1b) by DU2PR04CA0050.outlook.office365.com
 (2603:10a6:10:234::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22 via Frontend
 Transport; Fri, 3 Mar 2023 09:51:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.20 via Frontend Transport; Fri, 3 Mar 2023 09:51:09 +0000
Received: ("Tessian outbound cfb430c87a1e:v135");
 Fri, 03 Mar 2023 09:51:09 +0000
Received: from 424ef3d3d830.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7317B396-579B-4290-A8AA-72B6557BD866.1; 
 Fri, 03 Mar 2023 09:51:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 424ef3d3d830.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Mar 2023 09:51:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB6254.eurprd08.prod.outlook.com (2603:10a6:102:f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21; Fri, 3 Mar
 2023 09:50:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 09:50:53 +0000
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
X-Inumbo-ID: f161f64e-b9a8-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPI9wzLSJDON6ZuMpiPJ+4bStDfQXl6D68MKm+x16NA=;
 b=eroggrAWNzVPns4gghfyBjVjqqG6ZaK8AdIfYgIg0fOtIFzEm7sXj5qHU98LC7Ga9Q2Bxy8xl1NLOjvjaW/kl+yL4oEQfUyIybA5q5t/UUOeKSaKHfGABd0sbjFwfZxPPBmpuSfWb/oxbqV20ThylAxbM9VlNMYeau29bGW+BPc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9c6cef000f0ca020
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6GkG8RBojmWMOTBDYzug5Kkz3ReQrOikPUJ7z1HgmYd95Qa3OHS7z3EowJ7VBXs7bIahAgSDzYbtuKW/M/ToZ/3Aa820ggcOId/IWvn8vLYQbAY1U8UWvxrOYjXLj3WYySUpDpeZgHOelITK+LPoeTKXFgVzMvHsVC0bnbJx9ej8B+KNVPfqzE8E9K+MZs/3xKG2eTzfufhxsAmcO0a/w8oYo3NqlOearB6bu0G9yfctaU2AsSxmkyOyvnH0weD008ffzXnRmpx9BtgynYXxYusShArnQUAs1RvS/LALSixh5u1Uf8vbmPGO2iqbNzPkiSCbtDg2JAJJFPEhKrHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPI9wzLSJDON6ZuMpiPJ+4bStDfQXl6D68MKm+x16NA=;
 b=nzZv9XckKUsFMz+lJCrBppI6E7z7eg153XbAVAlHBYN1CUO6nHrtvg/gD21jVQtv0Z95bSFaXVXBDvoiL7vFCuE8n6YRaePmseEvvsrlbQuwG+F8yUGYPX91234Xqp9RXnCqrJ+RQE4vJmNyJqEfJZmXkb/QBkga64YytB730UY6z1JftNIIMj3tRlekvhlrP3bE1Qqr7Sk/y61KS1tt4bVKD5Wh1VZWydujhK2hB7L+UXHmV9AglDBukRkB/SdM++5dKXPcqOexWbmom3iFOsxWCTeL7zNF4B8JPAsl3pEOuhu9dAHTjX9jRUj2/XOSMK3X8ZsYQ1TsmK4OgrUGCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPI9wzLSJDON6ZuMpiPJ+4bStDfQXl6D68MKm+x16NA=;
 b=eroggrAWNzVPns4gghfyBjVjqqG6ZaK8AdIfYgIg0fOtIFzEm7sXj5qHU98LC7Ga9Q2Bxy8xl1NLOjvjaW/kl+yL4oEQfUyIybA5q5t/UUOeKSaKHfGABd0sbjFwfZxPPBmpuSfWb/oxbqV20ThylAxbM9VlNMYeau29bGW+BPc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 14/20] xen/arm: ffa: support guest
 FFA_PARTITION_INFO_GET
Thread-Topic: [XEN PATCH v7 14/20] xen/arm: ffa: support guest
 FFA_PARTITION_INFO_GET
Thread-Index: AQHZRtMdhtaowAhPaUGSsxv5T0sWbq7o3ZeA
Date: Fri, 3 Mar 2023 09:50:53 +0000
Message-ID: <55C1E9E3-1515-40BD-8C9B-93564A2B4421@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <fc8e8f1d2d8dbefffd28f6ff1dff600094be8182.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <fc8e8f1d2d8dbefffd28f6ff1dff600094be8182.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PA4PR08MB6254:EE_|DBAEUR03FT059:EE_|AS8PR08MB9792:EE_
X-MS-Office365-Filtering-Correlation-Id: e8574b2e-66ac-4306-866d-08db1bccd0e8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2orfKrl1C8dMgHbnAMu8GIzcp0Lx4EexQaxdrJJpchLt4NOt/UDjMu0UOBxGCIIGvWSAwet+eIFsLaCm3Muif6RWg37kVvq/Dnk6nWs4YUDkuHPTC0/6+s2E61diy+z5qHs+EgvoJtXCyshDdLZEd76Tc8Rcv5mSk+b6/3eCo3mMwMQn4x6ojvebAF6GvCy+XyeASwQuQnGCDQoNekFQ1Z/CBJQZuIyWM/cUkELhhcTqfNqyZp9p/x1gPiOqI4sM7c0CC7Uc4uKYBNvXP4gfwg+pVvF1D8eT34lUTf8ALtFjcNTjaTDDQCiCT1kfqXYAy2OLFh1GIq9TBOTFgdJENKxP+MuXFalMEGtCIAKwo4Ip3mLdbAoHK7cdvq1HwJDhWze3c5GcYJx/sNk0OmF1sTW4e+YR7h+n9Q8UX7fINPJEbluFwpQhsNbYK4Nhy6Smr8JdqDlyBvUBnJe2uWlzkArDWxUzA5bNnghU/xZDFiTR4q0EeacaFmt7S/swKG/yWWVGuoeeJpAqNkC7a2MJmF/9jvkNGlHPoOuV1fB8yQyiqdWbheSgkVMbFgM9akn+UxLmx9JhMJWtgW0fG5jDB7yT9LY/uu9jhMsjswCwZaOxLrJ+K/4umRTl7wALsqQ5g78b4hALAYENmHz3eotPk6Qy/KTrXPr0VdP2QXNKSx9cmnoEh17mjXr6Mv8AZNeFpDGohg/tneSJJTyghIFnBSttAhVuhfARVTCSFqSRBGc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199018)(86362001)(316002)(54906003)(33656002)(36756003)(83380400001)(6486002)(66476007)(6512007)(186003)(91956017)(2906002)(5660300002)(76116006)(4326008)(6916009)(8676002)(64756008)(66946007)(41300700001)(66446008)(2616005)(478600001)(53546011)(6506007)(66556008)(71200400001)(26005)(122000001)(8936002)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7A6A4339B25A8F42B8A2A70077C88AE7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6254
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	86c23530-fa5d-491e-4252-08db1bccc762
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cDJfyaSHGzM9Fj3xMPv5QqknrDE9NYdPqSZFtrbLx3WrFNa9ZwudTolsCv0YHjDEf/OiybyNCAutJWgWjIvikS+cbJlu+u5ZLHgM+VGQH2rFpHWfww2t9bZK0BAiF47UZHJW0d2NEPbg/H1GraAsm7ZksfxBX4VbgVaqOYQMn+b4HSmTU7UDuzK+nfj1VWM0meVktxXUa9P8iatpmfiYw/gepFaABzb6kOD+CDpx5M0hRFVxc2iisdXED8yN2baUdsUE4kWzESgtV/UKv8y62LU1QtOGKBXeBJ1FkJwx7A2paC43g/1jCaEucuswMFnLks8w3NFo78NteAPVeOFfV0Pb3cJvAekWE120dX9hWi92OvvCY6iZgrU9WuGJtsJh8tA2bTqTVG274GwM5PRNR/XxKn30AH+JaT/hsdvYWkFEjxAy8/3kUpAJ1eYW0I/8NSBIO5pQ/vwsnUXR1j/s/RV35BLycvIOnEhUwRvnbJUv2G3R/ubvUyB403ZiozCkbl0hU6HbUqt6bd38oIRdRjUmhfh85tMN2oFjel8Ouc1d755iFrwSDZP5sK1//HaUKtibZe2QxwfhUVR9Q6VKNjj2UjY0BA6cPEWvQ0oz9SFHhjvrdvrsr9wk7Qm4vv1BG8RIg36SNouyMzrfJ+DEt6yIYdq+FaEZ3XnJkFQ6pGzMNUATndLPgEzLbjpXVs/S94T3Jcs8Z542wmeUT9bpIw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199018)(40470700004)(36840700001)(46966006)(5660300002)(4326008)(6862004)(8936002)(40480700001)(41300700001)(83380400001)(336012)(40460700003)(70586007)(36756003)(82310400005)(70206006)(2906002)(8676002)(316002)(33656002)(6486002)(82740400003)(47076005)(36860700001)(6512007)(53546011)(6506007)(26005)(186003)(2616005)(54906003)(81166007)(478600001)(86362001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 09:51:09.5078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8574b2e-66ac-4306-866d-08db1bccd0e8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9792

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds support in the mediator to handle FFA_PARTITION_INFO_GET requests
> from a guest. The requests are forwarded to the SPMC and the response is
> translated according to the FF-A version in use by the guest.
>=20
> Using FFA_PARTITION_INFO_GET changes the owner of the RX buffer to the
> caller (the guest in this case), so once it is done with the buffer it
> must be released using FFA_RX_RELEASE before another call can be made.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 126 ++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 124 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 953b6dfd5eca..3571817c0bcd 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -141,6 +141,12 @@
> #define FFA_MSG_POLL                    0x8400006AU
>=20
> /* Partition information descriptor */
> +struct ffa_partition_info_1_0 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +};
> +
> struct ffa_partition_info_1_1 {
>     uint16_t id;
>     uint16_t execution_context;
> @@ -157,9 +163,8 @@ struct ffa_ctx {
>     uint32_t guest_vers;
>     bool tx_is_mine;
>     bool interrupted;
> +    spinlock_t lock;
> };
> -
> -

This is removing 2 empty lines (previous patch was wrongly adding one)
but one empty line is required here.

> /* Negotiated FF-A version to use with the SPMC */
> static uint32_t ffa_version __ro_after_init;
>=20
> @@ -173,10 +178,16 @@ static unsigned int subscr_vm_destroyed_count __rea=
d_mostly;
>  * Our rx/tx buffers shared with the SPMC.
>  *
>  * ffa_page_count is the number of pages used in each of these buffers.
> + *
> + * The RX buffer is protected from concurrent usage with ffa_rx_buffer_l=
ock.
> + * Note that the SPMC is also tracking the ownership of our RX buffer so
> + * for calls which uses our RX buffer to deliver a result we must call
> + * ffa_rx_release() to let the SPMC know that we're done with the buffer=
.
>  */
> static void *ffa_rx __read_mostly;
> static void *ffa_tx __read_mostly;
> static unsigned int ffa_page_count __read_mostly;
> +static DEFINE_SPINLOCK(ffa_rx_buffer_lock);
>=20
> static bool ffa_get_version(uint32_t *vers)
> {
> @@ -463,6 +474,98 @@ static uint32_t handle_rxtx_unmap(void)
>     return FFA_RET_OK;
> }
>=20
> +static uint32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint=
32_t w3,
> +                                          uint32_t w4, uint32_t w5,
> +                                          uint32_t *count)
> +{
> +    bool query_count_only =3D w5 & FFA_PARTITION_INFO_GET_COUNT_FLAG;
> +    uint32_t w5_mask =3D 0;
> +    uint32_t ret =3D FFA_RET_DENIED;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    /*
> +     * FF-A v1.0 has w5 MBZ while v1.1 allows
> +     * FFA_PARTITION_INFO_GET_COUNT_FLAG to be non-zero.
> +     */
> +    if ( ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
> +        w5_mask =3D FFA_PARTITION_INFO_GET_COUNT_FLAG;
> +    if ( w5 & ~w5_mask )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( query_count_only )
> +        return ffa_partition_info_get(w1, w2, w3, w4, w5, count);

This code seems a bit to complex.
I would suggest the following:

if (w5 & FFA_PARTITION_INFO_GET_COUNT_FLAG)
{
     if ( ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
	return ffa_partition_info_get(w1, w2, w3, w4, w5, count);
     else
        return FFA_RET_INVALID_PARAMETERS;
}

> +
> +    if ( !ffa_page_count )
> +        return FFA_RET_DENIED;
> +
> +    spin_lock(&ctx->lock);
> +    spin_lock(&ffa_rx_buffer_lock);
> +    if ( !ctx->page_count || !ctx->tx_is_mine )

If i understand correctly tx_is_mine is protecting the guest rx
buffer until rx_release is called by the guest so that we do not
write in it before the guest has retrieved the data from it.

The name is very misleading, maybe rx_is_writeable or free would be better =
?

Also it would be more optimal to test it before taking ffa_rx_buffer_lock.


> +        goto out;
> +    ret =3D ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> +    if ( ret )
> +        goto out;
> +
> +    if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> +    {
> +        size_t n;
> +        struct ffa_partition_info_1_1 *src =3D ffa_rx;
> +        struct ffa_partition_info_1_0 *dst =3D ctx->rx;
> +
> +        if ( ctx->page_count * FFA_PAGE_SIZE < *count * sizeof(*dst) )
> +        {
> +            ret =3D FFA_RET_NO_MEMORY;
> +            goto out_rx_release;
> +        }
> +
> +        for ( n =3D 0; n < *count; n++ )
> +        {
> +            dst[n].id =3D src[n].id;
> +            dst[n].execution_context =3D src[n].execution_context;
> +            dst[n].partition_properties =3D src[n].partition_properties;
> +        }
> +    }
> +    else
> +    {
> +        size_t sz =3D *count * sizeof(struct ffa_partition_info_1_1);
> +
> +        if ( ctx->page_count * FFA_PAGE_SIZE < sz )
> +        {
> +            ret =3D FFA_RET_NO_MEMORY;
> +            goto out_rx_release;
> +        }
> +
> +
> +        memcpy(ctx->rx, ffa_rx, sz);
> +    }
> +    ctx->tx_is_mine =3D false;

at this point we have no reason to hold ctx->lock

> +out_rx_release:
> +    ffa_rx_release();

There should be no case where do release without unlocking.

It might be cleaner to have 2 functions ffa_rx_get and ffa_rx_release
 handling both the lock and the rx_release message.

> +out:
> +    spin_unlock(&ffa_rx_buffer_lock);

this should stay with ffa_rx_release

Cheers
Bertrand

> +    spin_unlock(&ctx->lock);
> +
> +    return ret;
> +}
> +
> +static uint32_t handle_rx_release(void)
> +{
> +    uint32_t ret =3D FFA_RET_DENIED;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    spin_lock(&ctx->lock);
> +    if ( !ctx->page_count || ctx->tx_is_mine )
> +        goto out;
> +    ret =3D FFA_RET_OK;
> +    ctx->tx_is_mine =3D true;
> +out:
> +    spin_unlock(&ctx->lock);
> +
> +    return ret;
> +}
> +
> static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32=
_t fid)
> {
>     struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> @@ -528,6 +631,7 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>     uint32_t fid =3D get_user_reg(regs, 0);
>     struct domain *d =3D current->domain;
>     struct ffa_ctx *ctx =3D d->arch.tee;
> +    uint32_t count;
>     int e;
>=20
>     if ( !ctx )
> @@ -559,6 +663,24 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>         else
>             set_regs_success(regs, 0, 0);
>         return true;
> +    case FFA_PARTITION_INFO_GET:
> +        e =3D handle_partition_info_get(get_user_reg(regs, 1),
> +                                      get_user_reg(regs, 2),
> +                                      get_user_reg(regs, 3),
> +                                      get_user_reg(regs, 4),
> +                                      get_user_reg(regs, 5), &count);
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, count, 0);
> +        return true;
> +    case FFA_RX_RELEASE:
> +        e =3D handle_rx_release();
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
>     case FFA_MSG_SEND_DIRECT_REQ_32:
> #ifdef CONFIG_ARM_64
>     case FFA_MSG_SEND_DIRECT_REQ_64:
> --=20
> 2.34.1
>=20


