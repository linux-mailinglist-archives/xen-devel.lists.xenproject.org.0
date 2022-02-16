Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3F94B8762
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 13:11:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274077.469417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKJ92-0000wh-Cb; Wed, 16 Feb 2022 12:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274077.469417; Wed, 16 Feb 2022 12:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKJ92-0000th-97; Wed, 16 Feb 2022 12:10:52 +0000
Received: by outflank-mailman (input) for mailman id 274077;
 Wed, 16 Feb 2022 12:10:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbM1=S7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nKJ91-0000tb-6Z
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 12:10:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79abc489-8f21-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 13:10:48 +0100 (CET)
Received: from DU2PR04CA0251.eurprd04.prod.outlook.com (2603:10a6:10:28e::16)
 by DB9PR08MB6796.eurprd08.prod.outlook.com (2603:10a6:10:2ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Wed, 16 Feb
 2022 12:10:45 +0000
Received: from DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::51) by DU2PR04CA0251.outlook.office365.com
 (2603:10a6:10:28e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Wed, 16 Feb 2022 12:10:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT018.mail.protection.outlook.com (10.152.20.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 12:10:45 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Wed, 16 Feb 2022 12:10:45 +0000
Received: from 8c9cde3e61b6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B5263E74-32D3-4C77-91B8-C8C9B66F7414.1; 
 Wed, 16 Feb 2022 12:10:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8c9cde3e61b6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 12:10:33 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by DB8PR08MB5068.eurprd08.prod.outlook.com
 (2603:10a6:10:e9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 12:10:31 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 12:10:31 +0000
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
X-Inumbo-ID: 79abc489-8f21-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtFoFKwO7S2rOjtL5Z3Zt/MozfaqQMWWJi7GW6Shc5c=;
 b=r0JCHg7TLsbMs/oKiWlG8xuiKvicsHpDrPrHPFbSleE3ri5QQRXue5kqy8w2W7zIHlVh7ST/MnhSekqfS2OPJs6AnadYzQloSZbjQ66LTijIGC6hEITQnoATiI57QTINrhb6v9dV91D2bTrv/IWCteAU5C42ncK10XrfiN6idQU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 097a1bce73520e55
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j95a26orvrjv3w5itWIO0PN2zc1DNwbJjZvZ8bMqIAuWYyfIzu29Ib8K23tj8vDmjrgaNV/1tPMVdkV93ApsJfrqoNsVTq82eciSGCmjo5vXXE2lYWSzXDqoti7fwYrKdeLjsrbQoMDYrco2DBLr3bkRqx3PCxGC3xb95T2D80IZiykv6ATgUsivUX/x8Tx9iYUeLg6VtPod+W6X9t+XgcUTFgoLkfdD4Sf+lp43wvY+GWljEiLA+P/RagyvJBUSGmDEUVD8i4FLLvjRLgr43M0+9o6A0+ZBdBV3GdD1fR8TkrxtMhcf/4Hm9tUjpTsT6yfk/k15D1+VZOiroAjjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtFoFKwO7S2rOjtL5Z3Zt/MozfaqQMWWJi7GW6Shc5c=;
 b=IrSEzDr+aGPCutfaV/jdFWYKT997/a+KO1C3EBKpF/sEEme06QRsL73MZrPK5DMXVkOjXt733BuASHsSrjZgu24BGJtqYKNW/nMvNa9r5qlc8snvYBDGCnlzVY88NklIbB9gTWmSHdLGW7qyws5kxbTnFunyY0PWjqWRpFo0tYpAmSqA05X0L1zgmabP8poSercYemER7Hd5JFHwhJ3i2OTJRO7BO2U5Qd7PH/0eP2ctmKJdPTC0SbLnNFbKaKRv+RMudFfOQfodT1QaKBI6Rg0phu75jnV1x9YfN0aa6bhcqkvjR5sUeoQhfQzvsgern7V6gWUDa3qlVXRXa5k25g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtFoFKwO7S2rOjtL5Z3Zt/MozfaqQMWWJi7GW6Shc5c=;
 b=r0JCHg7TLsbMs/oKiWlG8xuiKvicsHpDrPrHPFbSleE3ri5QQRXue5kqy8w2W7zIHlVh7ST/MnhSekqfS2OPJs6AnadYzQloSZbjQ66LTijIGC6hEITQnoATiI57QTINrhb6v9dV91D2bTrv/IWCteAU5C42ncK10XrfiN6idQU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2202151827380.43738@ubuntu-linux-20-04-desktop>
Date: Wed, 16 Feb 2022 12:10:26 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Chen <wei.chen@arm.com>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <53747C8B-681A-4474-B1DF-F08702322AB9@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2202151827380.43738@ubuntu-linux-20-04-desktop>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO4P265CA0062.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::18) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: a633572d-fcc1-4fc0-3cd9-08d9f1455c28
X-MS-TrafficTypeDiagnostic:
	DB8PR08MB5068:EE_|DB5EUR03FT018:EE_|DB9PR08MB6796:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6796CF84A468250C4AC033FAE4359@DB9PR08MB6796.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eruaTOl52CZsRPhkZ7vJg55sGkAAjgX4sVA0Zr93un83qWLwBIX4FRXkZVvnWiS/aYvvRfLkBCBDbnpFxq7M3zCqmt58Dmzac9i8k6KpcaxV6jDhWKuMD/9iC2aX83JVbCT6+M2/2SaDWGeceL/wo670gl4dFviOUu4oYI5+wFNAxJOdzEQS83qHiiMHQxUZ4auhvSUuC4ukrpDQ8C9np14eUk8kUay9lCa8qllgChGvOLAeytSZhygJ+D6T5t+MOF+S4+mPTjwMOv0z0SQGHWfFFHMmMxzDr83kXa+gqphj2wx1Tos0xVob4pl6RE3aQLXfWsYlqNH/riE1zwJ1/S2goQJ/D1Fin1nN1Psx2DGbNTmU0u/k3yh4+sbSO8yNZ3mjtA7qNT6AKk2nakJX+IhL+sbA9Pvhc8KJPdEsIFeXL0V+Shqmoc4qeGbqR4I6nSC76+DH0HLHrkH5NJCd53fjlJCalIDh5leAw5NPKSKfaPEtluzTQlkoRu0qpnU5O01ivbMrocyumrAvrMxqYrcdc0OV5DA/aHT4nWRx0vz0D6jcX37JeTK/CysaXcCTN+NdwYyOZKfE82FZ+Wgiunzljo24Bbubx2b+AgDQtU3S9XvDIo4HhenkA1CbypnI2x8OzvPGKDiqK2vq81EumSQY5ukLopfX7/sS0h47AzavKJLasxPgiZqTcEYlKU80JF5Al3ix6nAhAlUvW8I9JNrfpAUo2lk0wsSsIkM1YPo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(30864003)(6512007)(83380400001)(2616005)(36756003)(7416002)(8936002)(5660300002)(186003)(2906002)(508600001)(54906003)(52116002)(6486002)(26005)(33656002)(53546011)(6666004)(66476007)(66946007)(8676002)(86362001)(4326008)(316002)(66556008)(6506007)(38100700002)(6916009)(44832011)(38350700002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5068
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1522f4d1-26d4-4873-e56c-08d9f14553e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RyzTUrXto0RtJ7hYE7rAHIo1PvmuyodUedQOIuWNhR7O+nelqYsxP8RFDdESIR8VsHDdIYI3mfQy55b/aqDAAIWG3p+nF6HHrH39Qe3yHvJ8hqbCxSGd6XiroVyR776WPJ1kg9lvRNFOYSdNH0iB+JqDJPSNSidgmCUWU3JQ4s36qLA1M7yoxJWankazayw8jS+822qVAwbElKvPDrxAH2TpNwRGQi1Tp3V4ZpuonhT8nvkZ4GTnSzxq6lLZozErrQrquQiGEw3ePr5Bgal6adGTQ4oVmE44v7peauHmyCFFXL3GbvJtRqev46xsnQu3AB1NrnSEe0qr4k1zFCWHDY2O80E3+Jt49kyxkApwMj6SVr/5WEJ1GeUvOKlVH9AMKTUpqEHIUzmVHoMe2VzLT2YibiY3i+I2ui2Dvqk34PZ+vw6tZsoxrUIUGsyfine09hH+5PskQAM5HWqBWM6rOJfA843Fvpk/ZQA0AqhssqE7brJ289oDh9zMDESPEuaACy7qltkNEmuglh0O5RLos8ggj1uyZIAxUimMrRKLG+/JSyFLsYBM1cUrEsDDtWwSC5VWW81t3XQAW0/iBapmTfqcZaK/uD7B96894SxMtE9WRtf+ZBosPY6qAMBEU68RZYi4fwIDyiEXnZf8+ISOl6/A/recPmKwpPdnBt3vgcYFH2E5MNmjt+ZOo1sJKXY+
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(33656002)(316002)(83380400001)(47076005)(40460700003)(6486002)(6666004)(54906003)(2616005)(70586007)(36860700001)(336012)(70206006)(508600001)(186003)(81166007)(6512007)(44832011)(6506007)(53546011)(5660300002)(26005)(6862004)(107886003)(8936002)(30864003)(2906002)(4326008)(8676002)(356005)(36756003)(86362001)(82310400004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 12:10:45.0814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a633572d-fcc1-4fc0-3cd9-08d9f1455c28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6796



> On 16 Feb 2022, at 02:45, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Tue, 15 Feb 2022, Luca Fancellu wrote:
>> Introduce an architecture specific way to create different cpupools
>> at boot time, this is particularly useful on ARM big.LITTLE system
>> where there might be the need to have different cpupools for each type
>> of core, but also systems using NUMA can have different cpu pools for
>> each node.
>>=20
>> The feature on arm relies on a specification of the cpupools from the
>> device tree to build pools and assign cpus to them.
>>=20
>> Documentation is created to explain the feature.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> docs/misc/arm/device-tree/cpupools.txt | 118 +++++++++++++++++++++++++
>> xen/arch/arm/Kconfig                   |   9 ++
>> xen/arch/arm/Makefile                  |   1 +
>> xen/arch/arm/cpupool.c                 | 118 +++++++++++++++++++++++++
>> xen/common/sched/cpupool.c             |   4 +-
>> xen/include/xen/sched.h                |  11 +++
>> 6 files changed, 260 insertions(+), 1 deletion(-)
>> create mode 100644 docs/misc/arm/device-tree/cpupools.txt
>> create mode 100644 xen/arch/arm/cpupool.c
>>=20
>> diff --git a/docs/misc/arm/device-tree/cpupools.txt b/docs/misc/arm/devi=
ce-tree/cpupools.txt
>> new file mode 100644
>> index 000000000000..7298b6394332
>> --- /dev/null
>> +++ b/docs/misc/arm/device-tree/cpupools.txt
>> @@ -0,0 +1,118 @@
>> +Boot time cpupools
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +On arm, when BOOT_TIME_CPUPOOLS is enabled in the Xen configuration, it=
 is
>> +possible to create cpupools during boot phase by specifying them in the=
 device
>> +tree.
>> +
>> +Cpupools specification nodes shall be direct childs of /chosen node.
>> +Each cpupool node contains the following properties:
>> +
>> +- compatible (mandatory)
>> +
>> +    Must always include the compatiblity string: "xen,cpupool".
>> +
>> +- cpupool-id (mandatory)
>> +
>> +    Must be a positive integer number.
>=20

Hi Stefano,

Thank you for your review,

> Why is cpupool-id mandatory? It looks like it could be generated by Xen.
> Or is it actually better to have the user specify it anyway?
>=20

Yes at first I thought to automatically generate that, however I needed a s=
tructure
to map the id to the cpupool DT node. Here my doubt was about the size of t=
he
structure, because the user could even specify a cpupool for each cpu. I co=
uld allocate
It dynamically and free it after domUs creation in setup_xen.
What do you think could be the right way?
Or the dom0less guest could specify the id, but I like it more when using a=
 phandle to the
Xen,cpupool node.

>=20
>> +- cpupool-cpus (mandatory)
>> +
>> +    Must be a list of device tree phandle to nodes describing cpus (e.g=
. having
>> +    device_type =3D "cpu"), it can't be empty.
>> +
>> +- cpupool-sched (optional)
>> +
>> +    Must be a string having the name of a Xen scheduler, it has no effe=
ct when
>> +    used in conjunction of a cpupool-id equal to zero, in that case the
>> +    default Xen scheduler is selected (sched=3D<...> boot argument).
>=20
> I don't get why cpupool-id =3D=3D 0 should trigger a special cpupool-sche=
d
> behavior.

Cpupool with id 0 is embedded in Xen, it has its own special case handling =
in cpupool_create
that is giving it the default scheduler. I thought it was better to leave i=
t as it was, however the
cpupool0 scheduler can be modified using sched=3D boot args as it was befor=
e.

>=20
>=20
>> +Constraints
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The cpupool with id zero is implicitly created even if not specified, t=
hat pool
>> +must have at least one cpu assigned, otherwise Xen will stop.
>> +
>> +Every cpu brought up by Xen will be assigned to the cpupool with id zer=
o if it's
>> +not assigned to any other cpupool.
>> +
>> +If a cpu is assigned to a cpupool, but it's not brought up correctly, X=
en will
>> +stop.
>=20
> Thank you for documenting the constraints, but why do we have them?
> Imagine a user specifying 3 cpu pools and imagine the cpupool-id is
> optional and missing. We could take care of the cpupool-id generation in
> Xen and we could also assign the default scheduler everywhere
> cpupool-sched is not specified. Maybe I am missing something?

Yes we could make the cpupool-id optional, my doubts are in the fist commen=
t above.
Whenever the cpupool-sched is not specified, the current behaviour is to us=
e the default scheduler.

>=20
> Does cpupool0 has to exist? I guess the answer could be yes, but if it
> is specified as id of one of the pools we are fine, otherwise it could
> be automatically generated by Xen.

Yes cpupool0 needs to exists, however it is still generated by Xen regardle=
ss of the DT
specifications. In fact you could not specify in the DT any xen,cpupool com=
patible node
with the cpupool-id =3D=3D 0 and Xen will generate the cpupool0 anyway
(Xen internals are tied with the existence of a cpupool0).

>=20
> In any case, I don't think that cpupool0 has to have the default
> scheduler?

Ok I think I can create a function to assign a scheduler to the cpupool0 af=
ter its creation,
I would need to test it to be sure I don=E2=80=99t find something strange.

>=20
> My suggestion would be:
>=20
> - make cpupool-id optional
> - assign automatically cpupool-ids starting from 0
>    - respect cpupool-ids chosen by the user

Ok, it would start from 1 because cpupool0 always exists

> - if some CPUs are left out (not specified in any pool) add an extra cpup=
ool
>    - the extra cpupool doesn't have to be cpupool-id =3D=3D 0, it could b=
e
>      cpupool-id =3D=3D n
>    - the extra cpupool uses the default scheduler

I gave all the unassigned cpus to cpupool0 to reflect the current behaviour=
, so that
a user that doesn=E2=80=99t specify any xen,cpupool node ends up in a syste=
m reflecting the
current behaviour as the feature is not enabled.
However I can say, if no xen,cpupool nodes are found then assign cpus to cp=
upool0,
else assign them to a new cpupool and...

>=20
> If the user created cpupools in device tree covering all CPUs and also
> specified all cpupool-ids everywhere, and none of them are 0 (no cpupool
> in the system is cpupool0) then panic. (Assuming that cpupool0 is
> required.)

=E2=80=A6 panic if cpupool0 has no cpus.


Cheers,
Luca


>=20
>=20
>> +Examples
>> +=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +A system having two types of core, the following device tree specificat=
ion will
>> +instruct Xen to have two cpupools:
>> +
>> +- The cpupool with id 0 will have 4 cpus assigned.
>> +- The cpupool with id 1 will have 2 cpus assigned.
>> +
>> +As can be seen from the example, cpupool_a has only two cpus assigned, =
but since
>> +there are two cpus unassigned, they are automatically assigned to cpupo=
ol with
>> +id zero. The following example can work only if hmp-unsafe=3D1 is passe=
d to Xen
>> +boot arguments, otherwise not all cores will be brought up by Xen and t=
he
>> +cpupool creation process will stop Xen.
>> +
>> +
>> +a72_1: cpu@0 {
>> +        compatible =3D "arm,cortex-a72";
>> +        reg =3D <0x0 0x0>;
>> +        device_type =3D "cpu";
>> +        [...]
>> +};
>> +
>> +a72_2: cpu@1 {
>> +        compatible =3D "arm,cortex-a72";
>> +        reg =3D <0x0 0x1>;
>> +        device_type =3D "cpu";
>> +        [...]
>> +};
>> +
>> +a53_1: cpu@100 {
>> +        compatible =3D "arm,cortex-a53";
>> +        reg =3D <0x0 0x100>;
>> +        device_type =3D "cpu";
>> +        [...]
>> +};
>> +
>> +a53_2: cpu@101 {
>> +        compatible =3D "arm,cortex-a53";
>> +        reg =3D <0x0 0x101>;
>> +        device_type =3D "cpu";
>> +        [...]
>> +};
>> +
>> +cpu@102 {
>> +        compatible =3D "arm,cortex-a53";
>> +        reg =3D <0x0 0x102>;
>> +        device_type =3D "cpu";
>> +        [...]
>> +};
>> +
>> +cpu@103 {
>> +        compatible =3D "arm,cortex-a53";
>> +        reg =3D <0x0 0x103>;
>> +        device_type =3D "cpu";
>> +        [...]
>> +};
>> +
>> +chosen {
>> +
>> +    cpupool_a {
>> +        compatible =3D "xen,cpupool";
>> +        cpupool-id =3D <0>;
>> +        cpupool-cpus =3D <&a53_1 &a53_2>;
>> +    };
>> +    cpupool_b {
>> +        compatible =3D "xen,cpupool";
>> +        cpupool-id =3D <1>;
>> +        cpupool-cpus =3D <&a72_1 &a72_2>;
>> +        cpupool-sched =3D "credit2";
>> +    };
>=20
> Question above notwithstanding, I like it!
>=20
>=20
>> +    [...]
>> +
>> +};
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index ecfa6822e4d3..64c2879513b7 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -33,6 +33,15 @@ config ACPI
>> 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>> 	  an alternative to device tree on ARM64.
>>=20
>> +config BOOT_TIME_CPUPOOLS
>> +	bool "Create cpupools at boot time"
>> +	depends on ARM
>> +	default n
>> +	help
>> +
>> +	  Creates cpupools during boot time and assigns cpus to them. Cpupools
>> +	  options can be specified in the device tree.
>> +
>> config GICV3
>> 	bool "GICv3 driver"
>> 	depends on ARM_64 && !NEW_VGIC
>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>> index d0dee10102b6..6165da4e77b4 100644
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -13,6 +13,7 @@ obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
>> obj-y +=3D bootfdt.init.o
>> obj-y +=3D cpuerrata.o
>> obj-y +=3D cpufeature.o
>> +obj-$(CONFIG_BOOT_TIME_CPUPOOLS) +=3D cpupool.o
>> obj-y +=3D decode.o
>> obj-y +=3D device.o
>> obj-$(CONFIG_IOREQ_SERVER) +=3D dm.o
>> diff --git a/xen/arch/arm/cpupool.c b/xen/arch/arm/cpupool.c
>> new file mode 100644
>> index 000000000000..a9d5b94635b9
>> --- /dev/null
>> +++ b/xen/arch/arm/cpupool.c
>> @@ -0,0 +1,118 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * xen/arch/arm/cpupool.c
>> + *
>> + * Code to create cpupools at boot time for arm architecture.
>> + *
>> + * Copyright (C) 2022 Arm Ltd.
>> + */
>> +
>> +#include <xen/sched.h>
>> +
>> +static struct cpupool *__initdata pool_cpu_map[NR_CPUS];
>> +
>> +void __init arch_allocate_cpupools(const cpumask_t *cpu_online_map)
>> +{
>> +    const struct dt_device_node *chosen, *node;
>> +    unsigned int cpu_num, cpupool0_cpu_count =3D 0;
>> +    cpumask_t cpus_to_assign;
>> +
>> +    chosen =3D dt_find_node_by_path("/chosen");
>> +    if ( !chosen )
>> +        return;
>> +
>> +    cpumask_copy(&cpus_to_assign, cpu_online_map);
>> +
>> +    dt_for_each_child_node(chosen, node)
>> +    {
>> +        const struct dt_device_node *cpu_node;
>> +        unsigned int pool_id;
>> +        int i =3D 0, sched_id =3D -1;
>> +        const char* scheduler_name;
>> +        struct cpupool *pool =3D cpupool0;
>> +
>> +        if ( !dt_device_is_compatible(node, "xen,cpupool") )
>> +            continue;
>> +
>> +        if ( !dt_property_read_u32(node, "cpupool-id", &pool_id) )
>> +            panic("Missing cpupool-id property!\n");
>> +
>> +        if ( !dt_property_read_string(node, "cpupool-sched", &scheduler=
_name) )
>> +        {
>> +            sched_id =3D sched_get_id_by_name(scheduler_name);
>> +            if ( sched_id < 0 )
>> +                panic("Scheduler %s does not exists!\n", scheduler_name=
);
>> +        }
>> +
>> +        if ( pool_id )
>> +        {
>> +            pool =3D cpupool_create_pool(pool_id, sched_id);
>> +            if ( !pool )
>> +                panic("Error creating pool id %u!\n", pool_id);
>> +        }
>> +
>> +        cpu_node =3D dt_parse_phandle(node, "cpupool-cpus", 0);
>> +        if ( !cpu_node )
>> +            panic("Missing or empty cpupool-cpus property!\n");
>> +
>> +        while ( cpu_node )
>> +        {
>> +            register_t cpu_reg;
>> +            const __be32 *prop;
>> +
>> +            prop =3D dt_get_property(cpu_node, "reg", NULL);
>> +            if ( !prop )
>> +                panic("cpupool-cpus pointed node has no reg property!\n=
");
>> +
>> +            cpu_reg =3D dt_read_number(prop, dt_n_addr_cells(cpu_node))=
;
>> +
>> +            /* Check if the cpu is online and in the set to be assigned=
 */
>> +            for_each_cpu ( cpu_num, &cpus_to_assign )
>> +                if ( cpu_logical_map(cpu_num) =3D=3D cpu_reg )
>> +                    break;
>> +
>> +            if ( cpu_num >=3D nr_cpu_ids )
>> +                panic("Cpu found in %s is not online or it's assigned t=
wice!\n",
>> +                      dt_node_name(node));
>> +
>> +            pool_cpu_map[cpu_num] =3D pool;
>> +            cpumask_clear_cpu(cpu_num, &cpus_to_assign);
>> +
>> +            printk(XENLOG_INFO "CPU with MPIDR %"PRIregister" in Pool-%=
u.\n",
>> +                   cpu_reg, pool_id);
>> +
>> +            /* Keep track of how many cpus are assigned to Pool-0 */
>> +            if ( !pool_id )
>> +                cpupool0_cpu_count++;
>> +
>> +            cpu_node =3D dt_parse_phandle(node, "cpupool-cpus", ++i);
>> +        }
>> +    }
>> +
>> +    /* Assign every non assigned cpu to Pool-0 */
>> +    for_each_cpu ( cpu_num, &cpus_to_assign )
>> +    {
>> +        pool_cpu_map[cpu_num] =3D cpupool0;
>> +        cpupool0_cpu_count++;
>> +        printk(XENLOG_INFO "CPU with MPIDR %"PRIregister" in Pool-0.\n"=
,
>> +               cpu_logical_map(cpu_num));
>> +    }
>> +
>> +    if ( !cpupool0_cpu_count )
>> +        panic("No cpu assigned to cpupool0!\n");
>> +}
>> +
>> +struct cpupool *__init arch_get_cpupool(unsigned int cpu)
>> +{
>> +    return pool_cpu_map[cpu];
>> +}
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
>> index 4da12528d6b9..6013d75e2edd 100644
>> --- a/xen/common/sched/cpupool.c
>> +++ b/xen/common/sched/cpupool.c
>> @@ -1257,12 +1257,14 @@ static int __init cpupool_init(void)
>>     cpupool_put(cpupool0);
>>     register_cpu_notifier(&cpu_nfb);
>>=20
>> +    arch_allocate_cpupools(&cpu_online_map);
>> +
>>     spin_lock(&cpupool_lock);
>>=20
>>     cpumask_copy(&cpupool_free_cpus, &cpu_online_map);
>>=20
>>     for_each_cpu ( cpu, &cpupool_free_cpus )
>> -        cpupool_assign_cpu_locked(cpupool0, cpu);
>> +        cpupool_assign_cpu_locked(arch_get_cpupool(cpu), cpu);
>>=20
>>     spin_unlock(&cpupool_lock);
>>=20
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index a67a9eb2fe9d..dda7db2ba51f 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -1177,6 +1177,17 @@ extern void dump_runq(unsigned char key);
>>=20
>> void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
>>=20
>> +#ifdef CONFIG_BOOT_TIME_CPUPOOLS
>> +void arch_allocate_cpupools(const cpumask_t *cpu_online_map);
>> +struct cpupool *arch_get_cpupool(unsigned int cpu);
>> +#else
>> +static inline void arch_allocate_cpupools(const cpumask_t *cpu_online_m=
ap) {}
>> +static inline struct cpupool *arch_get_cpupool(unsigned int cpu)
>> +{
>> +    return cpupool0;
>> +}
>> +#endif
>> +
>> #endif /* __SCHED_H__ */
>>=20
>> /*
>> --=20
>> 2.17.1


