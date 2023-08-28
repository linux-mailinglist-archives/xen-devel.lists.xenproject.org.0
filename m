Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAC078A402
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 03:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591327.923716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaRGe-0001Pa-Ph; Mon, 28 Aug 2023 01:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591327.923716; Mon, 28 Aug 2023 01:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaRGe-0001Nj-Mi; Mon, 28 Aug 2023 01:42:12 +0000
Received: by outflank-mailman (input) for mailman id 591327;
 Mon, 28 Aug 2023 01:42:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwb3=EN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qaRGc-0001NV-To
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 01:42:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 196c303f-4544-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 03:42:08 +0200 (CEST)
Received: from AS4P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::10)
 by AS2PR08MB8877.eurprd08.prod.outlook.com (2603:10a6:20b:5e6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 01:41:38 +0000
Received: from AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d3:cafe::1d) by AS4P251CA0018.outlook.office365.com
 (2603:10a6:20b:5d3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Mon, 28 Aug 2023 01:41:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT014.mail.protection.outlook.com (100.127.140.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.16 via Frontend Transport; Mon, 28 Aug 2023 01:41:37 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Mon, 28 Aug 2023 01:41:37 +0000
Received: from c689a1365448.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B97EF7C6-B3EA-40F0-8783-8FAED376098C.1; 
 Mon, 28 Aug 2023 01:41:30 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c689a1365448.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 28 Aug 2023 01:41:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR3PR08MB5690.eurprd08.prod.outlook.com (2603:10a6:102:86::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 01:41:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 01:41:26 +0000
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
X-Inumbo-ID: 196c303f-4544-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLJY3olYfWAY6tt4zqYNMc6TzrYNvT071l4Erdt57E4=;
 b=4Dk2B21jCYBT/DhqVdPxxdRt/GAJNOOzpOq4rXOtiM7elgzPfXizmiwQQ6fZWskmP7/uctu6RdUlZAL0t07OJVepwxClL8DyNv1nWaj2FrLOFePvWMt85DmRXyFnOcgLpDC324BE4NgCcAkMfImVPDyY9tVDzQ/HZ5S+dly/Dd8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 827e39f69538a498
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oky/Wdk232tIwmTmf0mmYDU1FNmW9JvVWdZDipRchNn4pLaTPeHxORYuEW8ZqBy1xFVxT36Vf0TxU6EDYSoi+ua4ONCjVLs6BF9R9q+Bqj2/aHIlkpilgeFfNTVUn9HdAoENoIfFFZgS5tZRQ2xdi7KBdLjSlUo0FzGGRa3JF9PyDKIR209Cn8+AZpJ+KunyDghycrcoJ2x25L0wqBpidX63V3yUohaspfDmo4uq8JA/YROyXfUUN2J5ZZdSSJqUBDq9om2UTIKtfI4MdCtCrolBu09aRNEArnnkxmA/zdHhLylh7EbWfLWu5rzepai8hQvTK8ROJp1ZFS0U7TFB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nLJY3olYfWAY6tt4zqYNMc6TzrYNvT071l4Erdt57E4=;
 b=NW8gzRy0UnMr7DtYF9m77Qu3yZ8CFbkBt5m0emwNnOjsv9KY13JY9bQ2PR0av2fNgN3iaotQ3IZ/9jNBBP48IULr+wM+fA8Ltc9vjxB+DEAFQT7CGZsSuU8eBG/o9J+gorxyYgaQRpiVHdZeIjhmSwFRH9UAszYXjPBC4zfO7JVKpFblzcrKpK2L4fakJ9I1jb/jVLBa0OlamDHrOqqd2BnX2YItO1bUI46dTA42/uA9ZN9+aR4hNZrdHDCSWD86MytKD5bJEqIenBVq/Bp/cdG/Kd+fUC5jvsW7JolFxLHEgzbX/sUMoEFwswHIi+ezAmFMubyVlOafd3TlzWnUjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nLJY3olYfWAY6tt4zqYNMc6TzrYNvT071l4Erdt57E4=;
 b=4Dk2B21jCYBT/DhqVdPxxdRt/GAJNOOzpOq4rXOtiM7elgzPfXizmiwQQ6fZWskmP7/uctu6RdUlZAL0t07OJVepwxClL8DyNv1nWaj2FrLOFePvWMt85DmRXyFnOcgLpDC324BE4NgCcAkMfImVPDyY9tVDzQ/HZ5S+dly/Dd8=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"julien@xen.org" <julien@xen.org>
Subject: Re: [XEN][PATCH v10 02/20] common/device_tree.c:
 unflatten_device_tree() propagate errors
Thread-Topic: [XEN][PATCH v10 02/20] common/device_tree.c:
 unflatten_device_tree() propagate errors
Thread-Index: AQHZ1yqecFdm3LtAMES0VxF9nFCQDq/+8yGA
Date: Mon, 28 Aug 2023 01:41:25 +0000
Message-ID: <923BD582-FD5A-46B7-AE0A-CE86F146C394@arm.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-3-vikram.garhwal@amd.com>
In-Reply-To: <20230825080222.14247-3-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PR3PR08MB5690:EE_|AM7EUR03FT014:EE_|AS2PR08MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: ddec81a8-a8f3-4001-6d58-08dba767eb7e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zK/2qWXioFwco80y98OZgfYZSUFIx8uukgDUBBppLl/AI9S6SdEQHUXe3jX74JFS4oUt02L7V8c+7BNPzG3A9uouJs2hrsaPN8EkuMO0+WFkug0L4BPYdDkvVXZXT+xhfHVdDfOCqOhV+MNhN0jnP3imHRO+PX8f0Z5io6uMnox5kg3lytSJispfT0PrV+1qZW0yvf3lO2c03Iimimim6lcftLVmqdiavKsIfk0s11i4+j6KWKVLNucsA0ZHA3uSIGl/mZ3lQGaZJpChPpH5KbbpDWqZRTBEirVZBIen+T6WeSSHo9Clbffx06jJ6EetezFfUFtLZMbUwDuYJ41iCi79INIubLYjp3a/y66YVI9liM1yy64Psi6zr8HUm31D8ATnN2gwsXwUpUlNxvlO3k14ohZZ+mHgKHd0dpt4uN2JjGnGdh2SmYFIMuQrLarMexVvOx4guOzF+WNTWDvfDQr/AqK69quhyaSa5nx72ovcmoOMTkMTxPThyZ+QZlmP7rPNR5EL0tbePsFK30JbqqHaPraaHU+/YdLu4zcLtk0HHm8/ezmIHYa7XD243bzrzr901CrvrYOPW416+y+Aka1gGaTftmjBcyojru7iKOAKenVoeRPdH7Eg69tMJVAplg2DO6tQSejSFF/1pRxnkw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(39860400002)(346002)(396003)(186009)(1800799009)(451199024)(71200400001)(6506007)(6486002)(53546011)(2616005)(4744005)(26005)(2906002)(478600001)(6916009)(6512007)(66556008)(316002)(64756008)(54906003)(66446008)(8676002)(76116006)(66946007)(5660300002)(66476007)(8936002)(91956017)(4326008)(33656002)(86362001)(36756003)(41300700001)(38100700002)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C39B7C0CC6E8C04E8EC2630AB5C7D176@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5690
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	819f871f-f7aa-48f5-0849-08dba767e452
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EL+J1rzKD7imj9UR1U56VmDvT0MkvUioLVGJvgXs8KekT5Rq0XDPkpD3DUH3kHM+X00u2bziqT0L7yBugzNs2X3SwaXNdh6EQFPlP9U9KUc7comYp8iGz/bQ7eBFwaXucuJg/j9MBQB030C6QjgsoiNkLcA8SR3AlBSWjLy3tu8dGdsAImY+CRy+kAJGhNzxUn5IkwMJm8qOf2SO31cNVhikVHwzlRxkqod0ekge83v9SrcPF6XTFKN2jlQWtv8xjfnvstwj7JbxR9uMHAciSRcpxC7vc6frbF+4cLyukH+/KGSyI85bWZggZCb7+/nFAdkKavO8NjLQAYNZqYYXarkOe7c2xqqerYrgfuAUMWjIc6VUDOJcDOv7BPPuF3+S9ivuq571Rf/yGJXyKwoECVHqVvtlH8gTZE1NvRsnF2hC+Lg2En/7aHPgHXQ5USt2zj+mdVMBttagfJlYpafpzT55N0dwwEmQ69vmtqxBjMqtQ1rY9uZ7A4oX8V5Pdqv47xOMZ1p9tUqHcEkypk0zlxUwFuqlvjlotWPWVLyk7dUmmz2wOWaOFc4mGO0Ib1HfUzsNjr3fN7afmeKLKWwvARGz1F/AkqzryJXMGzAdgdk2a/q6DpCur3zYoc/O6GAZiPZyAs0/nQ5nwEqr8aAh8oeAbOFJnQZgYZvBgqj2YVut2Y5eNQNPprxl5+MGzRtZt0BXO+bNdsZ7kxS1ott4qg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199024)(1800799009)(82310400011)(186009)(36840700001)(46966006)(8676002)(6862004)(8936002)(4326008)(2906002)(36756003)(316002)(54906003)(33656002)(70206006)(70586007)(5660300002)(336012)(41300700001)(36860700001)(6506007)(6486002)(53546011)(2616005)(26005)(6512007)(40480700001)(4744005)(81166007)(82740400003)(356005)(478600001)(86362001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 01:41:37.6833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddec81a8-a8f3-4001-6d58-08dba767eb7e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8877

Hi Vikram,

> On Aug 25, 2023, at 16:02, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>=20
> This will be useful in dynamic node programming when new dt nodes are unf=
lattend
> during runtime. Invalid device tree node related errors should be propaga=
ted
> back to the caller.
>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry=

