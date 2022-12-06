Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8145E6441DE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 12:10:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454662.712187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Vpm-0003Yv-4S; Tue, 06 Dec 2022 11:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454662.712187; Tue, 06 Dec 2022 11:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Vpm-0003Wv-1f; Tue, 06 Dec 2022 11:09:58 +0000
Received: by outflank-mailman (input) for mailman id 454662;
 Tue, 06 Dec 2022 11:09:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vYNa=4E=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1p2Vpk-0003Wp-8G
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 11:09:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82f8a0b9-7556-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 12:09:54 +0100 (CET)
Received: from AM6PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:20b:92::44)
 by DB9PR08MB6651.eurprd08.prod.outlook.com (2603:10a6:10:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Tue, 6 Dec
 2022 11:09:51 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::25) by AM6PR04CA0031.outlook.office365.com
 (2603:10a6:20b:92::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Tue, 6 Dec 2022 11:09:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14 via Frontend Transport; Tue, 6 Dec 2022 11:09:51 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Tue, 06 Dec 2022 11:09:50 +0000
Received: from 9baa55093dc4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0BAE4B81-A7C9-4B65-B2C2-B0AD077D9847.1; 
 Tue, 06 Dec 2022 11:09:43 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9baa55093dc4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Dec 2022 11:09:43 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAVPR08MB9793.eurprd08.prod.outlook.com (2603:10a6:102:31d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 6 Dec
 2022 11:09:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5880.008; Tue, 6 Dec 2022
 11:09:41 +0000
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
X-Inumbo-ID: 82f8a0b9-7556-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NkYmRwVXu3wBQfoRDjrQrBGKtF/ev1ry2PuycJ+fuU=;
 b=m5ycK4r09zAtgQ/JkuyV2CMF/EZ1/bgvUcSrQ2ytlIELOFKZeGft6B0GFSn2r3nJ1DBFTczh9tdlViqMQLJapUwoKZZ4sP3Ii6josKTOlqHHE9MiuQNZzVflH/1k1v6r7h7XGq1+v1LfvMdEpc68MuOETHjS9bJ/3CgbCd2SUJw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1c73f0fd9571ef6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHUCKD4VP26Y4pc05MpRDzM8mirYSDu59AZai9VXuC509RXP3PkBjgWxaxreKzw+NPoxRrgglU11rFp0b5iYbvtiDCJ0e1cdQW+F2hdznB7UN/1j7/4I/+7OUkeLDT6P8EZp6BWeBk70kdHrz6XlZSlcsCBZspRCzEE0qcZZuyZdYGX5GM1HK+ktsW+fHRXrxD/FW0yOtnKvRl5gVDBQJ6RBv/az561tm1SjrjXl/LNMF/d5DqkUSJcw43h70GWRQiH5Y3XI2sX8kl1u3Qh3yguw5ht2MtUVVZuZS8AeFpoa8SE0AF/QjhStj5+ASvVenJVTwB0HcMMp83sgRrY8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NkYmRwVXu3wBQfoRDjrQrBGKtF/ev1ry2PuycJ+fuU=;
 b=DDFJAhhJ0u3Bo35R1h3TISCLf8Pq49I8aUYdOOZsANsbbeGsW4PHb4qvvlnbgTLLTzKmpRiFi/xiLtrIKScWSOgox/kCy3WS5wt0OQPP34JFcW4p8FE5W9TG8SW5qmEXDJW+nKQfqr9pzanmwzaVCZxOtJCTItdm0OWOZj5tUV+TVGzpTZfZH711gqLtCyC+EUw79AZpS8UyEgytw2UESBb3X3OhmbRACvsnXyhXJ2RFoxzhTuAgU9rQDA38J2R0AwiRLqxK9h1BBvcc6Z6Nvmcayl8u35YrL0znV1sX0bmiqFT8FvRZslaU8Wj1JIl6U/AmiYTf3d7qExwhfECokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NkYmRwVXu3wBQfoRDjrQrBGKtF/ev1ry2PuycJ+fuU=;
 b=m5ycK4r09zAtgQ/JkuyV2CMF/EZ1/bgvUcSrQ2ytlIELOFKZeGft6B0GFSn2r3nJ1DBFTczh9tdlViqMQLJapUwoKZZ4sP3Ii6josKTOlqHHE9MiuQNZzVflH/1k1v6r7h7XGq1+v1LfvMdEpc68MuOETHjS9bJ/3CgbCd2SUJw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: Remove trigraphs from comments
Thread-Topic: [PATCH] xen: Remove trigraphs from comments
Thread-Index: AQHZCWINLKlK6tI5CE6qpK6tmjbd665gs6gA
Date: Tue, 6 Dec 2022 11:09:41 +0000
Message-ID: <0818F0DA-A29A-4C02-9F55-36D0F6F3B78B@arm.com>
References: <20221206105932.11855-1-michal.orzel@amd.com>
In-Reply-To: <20221206105932.11855-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAVPR08MB9793:EE_|AM7EUR03FT017:EE_|DB9PR08MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: bad4d94e-687d-4a7f-9879-08dad77a6559
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pgZmFqnPR2E0tTKSeQ6clHQorRSene+BvM9PmsbJDyFv1E8T4e75sNIlpYiq5SQQjP8/uMf2QF+FVosDZLriIytePo6rQ+4MUg4Npi810Ln1Grj0rNE/do0So7suUth1zUieekxaNbUe26mB86gpeloS/GceNXnsfkfzed3upS1BFUEZ0uX0hTS/VwMqr4pW7yB6K3TYwssjTQylv8X34iUn20QZT0AXH+CLxXN/LE9eqIC3HQf85RCoAmj+0edBcn1oWJmnvHbYo1dUVe4CzIh3l6Ef6yQRODgX7cA5qAekEm2AHufisLzGh4BS9I4L+I4rVumIi3uNGsso513Ho4quZHEIVnhnEyF7YCPXR6VRAFYZn/6+2nvA26G3lP2iOCFM3lgy/KSXZmtARcKgfjBbg8pPDci9b6bvkGW/jWaU+J1mLtBGTOZ/wONuZW5wngBBw6NiCLR1j5lehTIdJ7BQA5OzMgkGygeji/cKWRxlGAdTCVHyA3NJQYVzLczqze2nUUC1wkTP1xIF5Q3yS9h6A8ziZ39WiEhfV51MOZ7mcdQgwMh/K4Y+wqotMiUTFOLy4Cybs8ipuN8jmjeYZitcx70ZBBcveWSD1+UlJEu5dZcl/Y7JipSS7waUWsfAJCxl1v2qf6YaLZ7pUNDSmCKq91jddC/yURjqjlauKpWqEWrLERJpZlt4DqYpmYwm9k/AV/21znldcKJ/ZFUh3jhvtk31XDNDtxHSJC/5l2Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199015)(36756003)(316002)(83380400001)(54906003)(6506007)(6486002)(6916009)(53546011)(6512007)(26005)(186003)(2906002)(33656002)(86362001)(64756008)(76116006)(66446008)(4326008)(122000001)(66556008)(66476007)(71200400001)(38100700002)(8676002)(478600001)(66946007)(2616005)(5660300002)(38070700005)(41300700001)(8936002)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <291B711E36DB7449B1B036C9C952C8E4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9793
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0fdf77b2-3ea5-4d65-9686-08dad77a5f7c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QeaEpfu50sFGQH9NN5Nxw3M97J1aJ2kobeurw8NvBAbQhtBc6s4ueWTvjXo6aBUdqqUlNP6KygtVKntIzZmQsQqNF9oBluDickNmyjSDYrSchdpQyyZbSq3Y77PK44Bw1nddI5SfKzy4hWxUx8m9HVzvGsTJHN7/o2ZW9N0hYRxCWNtzlk2KuSkX16VXIOnHZHvyY8CWxkgZPnh3aSEsHrdUetupS7G2LbnlJPMw2+aoMaUmLrZMyOVNjf9ejAXEt4pdxHmCL2ZqhF1U0ROGboyaPW/sCMfN5dzU9Uxj3k3TyrCEabZIqAADESSyPy9fVRPC78wSt+edY33zEI+hifPfmFfB6QwSWtqQbWnJHsbTthkDBB+wzpU0tAFg8OZ3VisTk+oJbWgfEF/iQlPKg8czm6PW6RK7agqVvfgTRzJaGkjgiv5caKx4tQ6FZU8c0TlwafwRwy0fU6mk3iBulyeCVTl9gAHHOEvKMkM0w/PnYueVfBcnvKwYJAtmm9cuI7rs1HnK1YhfpGzxkAfuCv2W9fCsB9GMWoeLB9wKbHqFDYyVun6oRmmCNy+wWg4DeLJ0S+3ul9wbV9qcq3usLXOYK3syeeCozRITGRbbvYOhyZB7GzX2Kr1VLkZufXZ7Tg1DiSxsLp4i/3KJT4wnVy1io71NQZZ6+gbvjJ/Txf86y3qJf9FinNngQiUAjdpy5tbt3gpf1Eo3iWHn0vknQA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(54906003)(86362001)(316002)(41300700001)(8676002)(4326008)(70206006)(33656002)(70586007)(8936002)(478600001)(36756003)(6862004)(5660300002)(47076005)(83380400001)(82740400003)(81166007)(2616005)(36860700001)(186003)(356005)(336012)(40460700003)(82310400005)(6512007)(40480700001)(26005)(53546011)(6486002)(6506007)(107886003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 11:09:51.2074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bad4d94e-687d-4a7f-9879-08dad77a6559
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6651



> On 6 Dec 2022, at 10:59, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> MISRA C rule 4.2 states that trigraphs (sequences of two question marks
> followed by a specified third character [=3D/'()!<>-]) should not be used=
.
> This applies to both code and comments. Thankfully, we do not use them
> in the code, but still there are some comments where they are
> accidentally used. Fix it.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> xen/arch/x86/x86_emulate/x86_emulate.h |  2 +-
> xen/include/public/arch-x86_64.h       |  2 +-
> xen/include/xen/pci_regs.h             | 12 ++++++------
> 3 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_em=
ulate/x86_emulate.h
> index 4732855c40ed..bb7af967ffee 100644
> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -228,7 +228,7 @@ struct x86_emulate_ops
>      * All functions:
>      *  @ctxt:  [IN ] Emulation context info as passed to the emulator.
>      * All memory-access functions:
> -     *  @seg:   [IN ] Segment being dereferenced (specified as x86_seg_?=
?).
> +     *  @seg:   [IN ] Segment being dereferenced (specified as x86_seg_?=
).
>      *  @offset:[IN ] Offset within segment.
>      *  @p_data:[IN ] Pointer to i/o data buffer (length is @bytes)
>      * Read functions:
> diff --git a/xen/include/public/arch-x86_64.h b/xen/include/public/arch-x=
86_64.h
> index 5db52de69584..1c3567a20217 100644
> --- a/xen/include/public/arch-x86_64.h
> +++ b/xen/include/public/arch-x86_64.h
> @@ -22,5 +22,5 @@
>  * A similar callback occurs if the segment selectors are invalid.
>  * failsafe_address is used as the value of eip.
>  *
> - * On x86_64, event_selector and failsafe_selector are ignored (???).
> + * On x86_64, event_selector and failsafe_selector are ignored (?).
>  */
> diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
> index ee8e82be36b4..a90aff1712ba 100644
> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -246,13 +246,13 @@
> #define  PCI_PM_CTRL_STATE_MASK 0x0003 /* Current power state (D0 to D3) =
*/
> #define  PCI_PM_CTRL_NO_SOFT_RESET 0x0008 /* No reset for D3hot->D0 */
> #define  PCI_PM_CTRL_PME_ENABLE 0x0100 /* PME pin enable */
> -#define  PCI_PM_CTRL_DATA_SEL_MASK 0x1e00 /* Data select (??) */
> -#define  PCI_PM_CTRL_DATA_SCALE_MASK 0x6000 /* Data scale (??) */
> +#define  PCI_PM_CTRL_DATA_SEL_MASK 0x1e00 /* Data select (?) */
> +#define  PCI_PM_CTRL_DATA_SCALE_MASK 0x6000 /* Data scale (?) */
> #define  PCI_PM_CTRL_PME_STATUS 0x8000 /* PME pin status */
> -#define PCI_PM_PPB_EXTENSIONS 6 /* PPB support extensions (??) */
> -#define  PCI_PM_PPB_B2_B3 0x40 /* Stop clock when in D3hot (??) */
> -#define  PCI_PM_BPCC_ENABLE 0x80 /* Bus power/clock control enable (??) =
*/
> -#define PCI_PM_DATA_REGISTER 7 /* (??) */
> +#define PCI_PM_PPB_EXTENSIONS 6 /* PPB support extensions (?) */
> +#define  PCI_PM_PPB_B2_B3 0x40 /* Stop clock when in D3hot (?) */
> +#define  PCI_PM_BPCC_ENABLE 0x80 /* Bus power/clock control enable (?) *=
/
> +#define PCI_PM_DATA_REGISTER 7 /* (?) */
> #define PCI_PM_SIZEOF 8
>=20
> /* AGP registers */
> --=20
> 2.25.1
>=20
>=20


