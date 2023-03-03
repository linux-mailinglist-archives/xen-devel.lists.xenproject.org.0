Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AF96A98B9
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 14:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506019.779038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY5cc-0001vo-CR; Fri, 03 Mar 2023 13:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506019.779038; Fri, 03 Mar 2023 13:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY5cc-0001sw-9b; Fri, 03 Mar 2023 13:38:54 +0000
Received: by outflank-mailman (input) for mailman id 506019;
 Fri, 03 Mar 2023 13:38:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/yG=63=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pY5ca-0001sq-UC
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 13:38:53 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe13::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbb98edc-b9c8-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 14:38:51 +0100 (CET)
Received: from AS8P250CA0028.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::33)
 by DU2PR08MB10201.eurprd08.prod.outlook.com (2603:10a6:10:496::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 13:38:48 +0000
Received: from VI1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::a2) by AS8P250CA0028.outlook.office365.com
 (2603:10a6:20b:330::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22 via Frontend
 Transport; Fri, 3 Mar 2023 13:38:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT031.mail.protection.outlook.com (100.127.144.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 13:38:47 +0000
Received: ("Tessian outbound b29c0599cbc9:v135");
 Fri, 03 Mar 2023 13:38:47 +0000
Received: from dceb22f905fa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 530DB9D6-164D-4419-B40E-AFF18C25C0BA.1; 
 Fri, 03 Mar 2023 13:38:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dceb22f905fa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Mar 2023 13:38:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB9497.eurprd08.prod.outlook.com (2603:10a6:20b:60f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Fri, 3 Mar
 2023 13:38:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::806c:fd65:92cf:7b7a%6]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 13:38:32 +0000
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
X-Inumbo-ID: bbb98edc-b9c8-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sLZae6rBM1yJa5kgabXJid0eFIdA/+aUUZ1P8rCzlg=;
 b=593r4iMt9fzGL2belF+hmtcNrHRSqPc+RP5PF0yI/BxXZ5DE49e4WBWlWalpAX5XxdzDJkhJS1unG/LPnndk2ReyaEl3r+e4jgD8so8atcBCjqVy11CD/MSS6PrIL3UMQrUuJV1+QFnY6p+p2WiIB/AUsKTTel/RoaDauAjyvdM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 144b156e870d43a4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FboIPagbiqfBc7ZqaYpIHNN75NLXhQiAGs1bcz0swddLpSnzOdN55j0XCO970to/BNuATswZgZPSDotLlY2KoObhinASLdiUtC2A5RXFDJJ3p6tpxeC8PkF4/wGsfKR7qzupiSGO6IyPv1aJbGQXZaNKHu25naRBjx2AuIum5B8C9VbEbov6PZFwcqzSNrWRf/paL5yMFaUw4vCgjDazG4uuqBW2NVah7Mks03oRPm+DYZsjbY5mVZMeqq2es2eLceF7aXzRxOc0oCKTofD+RpMXnQ6FEU/UBmRuhPiHWhXQjupZmN0wBRkCzBqyocrg1N4wKvAKFXJsxGEL+XoedA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sLZae6rBM1yJa5kgabXJid0eFIdA/+aUUZ1P8rCzlg=;
 b=lYGyZMmtX4vG9FwM6kcfacHxkBA250XizK8Eugo/KMA50U11sCDu/DA36NRZvz30ggAYNBc4UAFll0WOMfPOuET3iPBn+TAAv1qGStFfJsoHKoMrVwx6Uda4Wtf6dggSaJfi+z0qvJwpTYU4ZxliOWFRscQmfA9YaQUQ5HWC5/YYwUbVeVU2WRtiWx6dRWSOaBxsCuaH/IJEfI+3df1QJ5ShQ2kGC8V3wDFrl8ql5CMacm+7gm66OO0GQ+8yXTNGUYtjjkpehRGQgl2vhRqtaWYQlY1iehbCY6UmaVkxeY/jj2jKhZCzHk14QlCJuBY3GHUTXmO7hel+jjI2FnPKuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sLZae6rBM1yJa5kgabXJid0eFIdA/+aUUZ1P8rCzlg=;
 b=593r4iMt9fzGL2belF+hmtcNrHRSqPc+RP5PF0yI/BxXZ5DE49e4WBWlWalpAX5XxdzDJkhJS1unG/LPnndk2ReyaEl3r+e4jgD8so8atcBCjqVy11CD/MSS6PrIL3UMQrUuJV1+QFnY6p+p2WiIB/AUsKTTel/RoaDauAjyvdM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v7 16/20] xen/arm: ffa: add defines for sharing memory
Thread-Topic: [XEN PATCH v7 16/20] xen/arm: ffa: add defines for sharing
 memory
Thread-Index: AQHZRtMfBUlqc46l5k6uigelB3xA/q7pHTCA
Date: Fri, 3 Mar 2023 13:38:32 +0000
Message-ID: <C57A3E71-138B-40EB-8B0C-13603EB145AF@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <ad85591c42f4db3c3001ae4b5572c1096c159593.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <ad85591c42f4db3c3001ae4b5572c1096c159593.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB9497:EE_|VI1EUR03FT031:EE_|DU2PR08MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: ace5d162-fc4a-41fb-5e05-08db1bec9df9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 38Hx+Nah8qMn7HYyFWn+QBRSOtbtudS9BFcBV8nfsmEf9SbkF8zbBLzUyTKWapYk5lHSbmwHjIxXV8ReLRx8CSNo/WVqX6JND5yBbEDZFT/5QDD3YYayltjdnc0lKRZ+aQKVV5rDA8YV7toAPKjkpn0Rzxc4XNzBYhuTkstybcqNKhmADYpDadr7XAhsgkrjQLMba3OVF2REkWevcHQ9TrDLsgftY7ZzQM8aNCG3y7QjVi0BtB24OuvDFGNhgp8F41Sj8VtGnlR1Oj+bgNDU0/brSOn/9GY0qOFh97bDn7w9nkpV/dfCDoFHqLUgLpPwnrJJgoqbgew5niFqJL8LTqE/oF54N9ANhxbl+iwR8nPKBZglTsSV2WxLi6SICd/d+ruDty4WnZA8jw4Iyq9LpApkWoat5ZNF8t7C4CKbjH+ne5SmnE+mz/5sh90c75+ET2pWLCbFAF/miIwvDtrq7Pg+pMzrSQvZjoyhkFgSoN7l5S5hGZqxbK3dYIvI/OlfzCejYTHapZf9q9i8ugNcXSIScS1CqX4k6YOA1rxNziFS1ugR3q8DXWWapzE22MgAgBgszSiaeZEjQm8BlrK29APwDniBiNmAzJ1EPbW9jmcxr68tzpqzVCA9fz3JUDv2bcuXXv6Dso8TyYSAeaodi6P26CFgyk4YlDy+YzZf13+APDQ6EbEBWumFk6AK3Vrf+V62dcfIaYWggZ1LP2mKZNjatTEMqmFkf6Co46C9TdMjSRPopzpqsP1C/6QdexKE
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199018)(33656002)(86362001)(66946007)(36756003)(8936002)(6486002)(66446008)(41300700001)(76116006)(53546011)(66556008)(4326008)(8676002)(6916009)(2616005)(54906003)(64756008)(66476007)(966005)(478600001)(122000001)(71200400001)(91956017)(5660300002)(316002)(26005)(6506007)(38100700002)(186003)(38070700005)(6512007)(2906002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D38E77F655980E4F93FE099E1BE2075F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9497
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	47cd50da-41e6-48b6-9a04-08db1bec94ca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	py4TIC+C9olRo28c+K1eDA1XIivyq1Ap49lw5zrOF/9OtJIvIw/p80eBcnckFyGf+i6NbNmu1hULyzZX5aop50ev+l1dalmE3ar2LhW/vXHJVVOSjuNJrznsW+g90Zi8cOzaRjfYIEbybR1b9n22xJCp/79PQyBv0On9wdH+SKRD2eTiD5hvo3QUqXOPSNPOcLiOtfn4pZ/MB/9AY0cWKNRfSYyEvxEoQtVqQFf2gGyAB2QYHV6+n5hmYWDUwN+ZMfVHg20ojRhRGIEHAUysNUz3bE0oikvOsjbxfITfUuNWwSx7e1O0bGD9W75xmJijwjpLsviu/vWdm040i7fCTbMubNcJ/r2WTSyZjWQ5n6qYLIHRZFngJiz+/d2eB1mDy+WvLat42WlRPP9ljjg0CgmCxHsIwnuVuy0kRpgFtU92sqZNdZqgMPq++6bu9mSjMkRSQsR0j/lVy8SYOAnLADNU3X5irpy+OMi0Wl3yK739covXQuYJkdscN6W3tNBbQ0hxuAle6U/n1QJBZqSGHW2nt+eiUbEfKL1Tqr/z8+9LWVjnwMsr763r7JFHF3pOIfwAJUGhpM1mqHUGvdCHmQEhCOboiEHiUQ6v25LCs/nPclAt1NTlVP/7KSGoRz41nuB42WXDvkd0JPwb5MTrTec0SvP/tCKyFZf9upYAy/sZdOcuFP04B20+FB4v7smBEbnwYiBEIox4NiUNWDzxqOW23ZMBxeCWs2yW/IUHkGA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199018)(40470700004)(36840700001)(46966006)(5660300002)(4326008)(6862004)(40480700001)(8936002)(83380400001)(41300700001)(336012)(40460700003)(70586007)(36756003)(82310400005)(2906002)(70206006)(8676002)(316002)(33656002)(6486002)(82740400003)(47076005)(36860700001)(6512007)(53546011)(6506007)(26005)(966005)(186003)(2616005)(54906003)(81166007)(478600001)(86362001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 13:38:47.8717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ace5d162-fc4a-41fb-5e05-08db1bec9df9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10201

Hi Jens,

> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds defines needed for sharing using the function FFA_MEM_SHARE and
> friends.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/tee/ffa.c | 57 ++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 57 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 3571817c0bcd..bfd378f7fcd7 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -22,6 +22,14 @@
> #include <asm/tee/ffa.h>
> #include <asm/regs.h>
>=20
> +/*
> + * References:
> + * FF-A-1.0-REL: FF-A specification version 1.0 available at
> + *               https://developer.arm.com/documentation/den0077/a
> + * FF-A-1.1-REL0: FF-A specification version 1.1 available at
> + *                https://developer.arm.com/documentation/den0077/e
> + */

This could actually be directly in the file header.

> +
> /* Error codes */
> #define FFA_RET_OK                      0
> #define FFA_RET_NOT_SUPPORTED           -1
> @@ -66,6 +74,55 @@
>  */
> #define FFA_PAGE_SIZE                   SZ_4K
>=20
> +/*
> + * Limit for shared buffer size. Please note that this define limits
> + * number of pages. But user buffer can be not aligned to a page
> + * boundary. So it is possible that user would not be able to share
> + * exactly FFA_MAX_SHM_BUFFER_PG * FFA_PAGE_SIZE bytes.
> + *
> + * FF-A doesn't have any direct requirments on GlobalPlatform or vice
> + * versa, but an implementation can very well use FF-A in order to provi=
de
> + * a GlobalPlatform interface on top.
> + *
> + * Global Platform specification for TEE requires that any TEE
> + * implementation should allow to share buffers with size of at least
> + * 512KB. Due to align issue mentioned above, we need to increase this
> + * value with one.

Could you give a bit more details here: what spec version, where in the spe=
c ?

I did download one version of it and at a first glance could not find this =
value.

> + */
> +#define FFA_MAX_SHM_PAGE_COUNT          (SZ_512K / FFA_PAGE_SIZE + 1)
> +
> +/*
> + * Limits the number of shared buffers that guest can have at once. This
> + * is to prevent case, when guests tricks XEN into exhausting its own
> + * memory by allocating many small buffers. This value has been chosen
> + * arbitrary.
> + */
> +#define FFA_MAX_SHM_COUNT               32

For those 2 limits, I am a bit wondering which should be defined in the cod=
e or maybe
configurable in kconfig or through xen command line or per guest.

I do not think we can answer that now but if one of these limits is reached=
 we should
have a clear error message so that we could easily say what to modify and d=
ecide
if/how to solve it.


> +
> +/* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
> +#define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
> +#define FFA_HANDLE_INVALID              0xffffffffffffffffULL
> +
> +/*
> + * The bits for FFA_NORMAL_MEM_REG_ATTR FFA_MEM_ACC_RW below are
> + * defined in FF-A-1.1-REL0 Table 10.18 at page 175.
> + */
> + /* Memory attributes: Normal memory, Write-Back cacheable, Inner sharea=
ble */
> +#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
> +/* Memory access permissions: Read-write */
> +#define FFA_MEM_ACC_RW                  0x2U

RW bits are defined in table 10.15 at page 168 if i am not mistaking

> +
> +/* FF-A-1.1-REL0 section 10.11.4 Flags usage, page 184-187 */
> +/* Clear memory before mapping in receiver */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR            BIT(0, U)
> +/* Relayer may time slice this operation */
> +#define FFA_MEMORY_REGION_FLAG_TIME_SLICE       BIT(1, U)
> +/* Clear memory after receiver relinquishes it */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH BIT(2, U)
> +/* Share memory transaction */
> +#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (1U << 3)
> +
> +
Please only add one empty line here.

I checked the definitions and they are all coherent with the spec.

Cheers
Bertrand

> /* Framework direct request/response */
> #define FFA_MSG_FLAG_FRAMEWORK          BIT(31, U)
> #define FFA_MSG_TYPE_MASK               0xFFU;
> --=20
> 2.34.1
>=20


