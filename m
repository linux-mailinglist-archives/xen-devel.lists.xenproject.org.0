Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D67493ADB
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 14:09:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258845.446251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAAiI-0001Hg-HX; Wed, 19 Jan 2022 13:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258845.446251; Wed, 19 Jan 2022 13:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAAiI-0001F3-EA; Wed, 19 Jan 2022 13:09:22 +0000
Received: by outflank-mailman (input) for mailman id 258845;
 Wed, 19 Jan 2022 13:09:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbi1=SD=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nAAiH-0001EW-Aj
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 13:09:21 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe05::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 022ae907-7929-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 14:09:19 +0100 (CET)
Received: from AS8PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:20b:451::17)
 by PA4PR08MB5888.eurprd08.prod.outlook.com (2603:10a6:102:e8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 19 Jan
 2022 13:09:16 +0000
Received: from VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:451:cafe::8f) by AS8PR07CA0022.outlook.office365.com
 (2603:10a6:20b:451::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Wed, 19 Jan 2022 13:09:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT025.mail.protection.outlook.com (10.152.18.74) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 19 Jan 2022 13:09:15 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Wed, 19 Jan 2022 13:09:15 +0000
Received: from fcf92a7f9406.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 488D478F-0478-4542-A764-AE3F860AF7C8.1; 
 Wed, 19 Jan 2022 13:09:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcf92a7f9406.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Jan 2022 13:09:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by HE1PR08MB2683.eurprd08.prod.outlook.com (2603:10a6:7:2b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 13:09:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4888.013; Wed, 19 Jan 2022
 13:09:06 +0000
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
X-Inumbo-ID: 022ae907-7929-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/715q9jbYoSzpiUtBQ/I08OdDVXTaUfZ8kkEa9ql4c=;
 b=Y0olfXQLt2soFPTx52iUKd+1PjeVZgJj4akKzpQWfevwxyKaVWJW/J3essbwgGI24dIDBxBkt/yZ55pw0eOBLkZMNjsei40zyCMi+5GeUR9nD07gA71X9OuHbUzkKzi6QDkCmIhIxKKolmhbjY5KNXBPUhGrRViUZokcCtMqlbM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 37082d2364c00b75
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuE9EShkIZYuotCZuJ8ZlgBC/UtRHSCmdy+lm9NNeGCPwugOJAdSdF5+wW5XbuobPHQtKSmQShn/RMuxCsi/EFc3r2QQHJEb7zWmUMeEvx4ZGlWnyDaWa9YAp8Zn+IipQTr+whbvBRVUj8oJ8O54rrlTfXkZcSzFQIfDDh6BQduuywtHHJZOHFkcErRyyKgxsCodgszjAn+qonZIs1+YSVX+zTEPnIWg6uQ5vEqvyf5s4Ogf4/iJy+S+IU3TN3HDwmBk8PSYvtlSiN9K4fngvz16LC9B+4JIRgDT07RPH38gx0zYbNS2xRA3ODFSQC4omdqtEwr5x2Hyuo9llTU+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/715q9jbYoSzpiUtBQ/I08OdDVXTaUfZ8kkEa9ql4c=;
 b=oDuYFyG5jUXM/aCTygajhaiOHb3cYCa3L20cO1GAZ+Vw1dd6y/rePHrpBxmMsjonBU5DhZEckprDRp5ww2OZydC740zSkT5hUwECiaRp3GJcik0l5TA1vQFMqtnHvgnF3MHztTawVdgHWxpn/9okLBz9+3HeqdxaWamCn0hw9844M7hP/I/EElj8yQ4s1xwO83Lajwco8m+IDASJrSML9EYmk6wvHQ9zcOwbG+IT4ec6dxn3PxPuMhTSVkWviW9n/DyA2ToI7U+rLRzeOvBP/+W6Zfc/tr/EWNNeJAtOobhHWwbsAVI5YhZrH9i1derhTDKFQ85X4XSG8E6VIaloow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/715q9jbYoSzpiUtBQ/I08OdDVXTaUfZ8kkEa9ql4c=;
 b=Y0olfXQLt2soFPTx52iUKd+1PjeVZgJj4akKzpQWfevwxyKaVWJW/J3essbwgGI24dIDBxBkt/yZ55pw0eOBLkZMNjsei40zyCMi+5GeUR9nD07gA71X9OuHbUzkKzi6QDkCmIhIxKKolmhbjY5KNXBPUhGrRViUZokcCtMqlbM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"samuel.thibault@ens-lyon.org" <samuel.thibault@ens-lyon.org>, "wl@xen.org"
	<wl@xen.org>
Subject: Re: [PATCH] fix wrong function declaration
Thread-Topic: [PATCH] fix wrong function declaration
Thread-Index: AQHYDTViKGGEIvvAiECyA/XXcXARI6xqUQ2A
Date: Wed, 19 Jan 2022 13:09:06 +0000
Message-ID: <5EAA8A4E-BF07-4D13-93F2-B09A4C124528@arm.com>
References: <20220119130600.27579-1-jgross@suse.com>
In-Reply-To: <20220119130600.27579-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 705cfa84-463f-4a6c-0427-08d9db4ce534
x-ms-traffictypediagnostic:
	HE1PR08MB2683:EE_|VE1EUR03FT025:EE_|PA4PR08MB5888:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB588836340716D7A72099F2229D599@PA4PR08MB5888.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:741;OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SJmWlU4AeaKvG1C0OO7fnBnzQVrQxuGjkBbsoVk3b1N++iHWmrTELLyqyqFDw3SBTTsa87wmwWV7FkCpgmiGUiHhkXbxie2E6faJJJV8pAegp01cHiDK23FKUZc+QpwFNpcGw8hcW0AjBvTczJT0Uptvf5o4G6nY5ldXK6ryJrO52Ou2XEjpAfIMPOQ7jMtbMDdOnC0iYXusckVqfwVea5zP06KHHRSY6oKjVkvA5UuW0NkqLxpxuoNec3HFQXrhsjHUybUJ1Llwk90ma9/A8oDxsD+9BnxAKZXuNzHAUyybfvesKjLGTUqfn2FMTsgn41yDGulsiq84+XjRHQf7bjG5K6SreaMYacdJ4Zyov4e1f1QpTgut1sXICs/mWjvSQoL29xaKRdqaZFsfjIqx3fty5QYrQL63byfSBIEfqzYWAzQJUT+jgn/mt9RPxNt7S80sT0QikuHGhOuDHmIeVtoM7OGfX95OfMf9XsLq3PpXvQUS0EiO/CCTPVMR+8d7+zZHHYnKLYMgy+NA/VIwfi2s8EomDZWcXZuw9y1VgcjDlY51QrBUDPBAKtNY6B31v4civYEQa9sffDi/Wm3cvBSypu4UIGfBwLt1Ww+0CmXyvTRn8Fkn0hI+Z+6jw/T+esiHBRUi5rqkqgn02mCNnbbrt1QmSn+or9jQlOLnHoZm4rhx2jPNavQL8ChlfJvo+mCQG/BHpakybJ96ScQYKHQHCgwztLz1nKKcPgPIXUFbh3kpcQAs3wq1b4UFvf83
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6486002)(71200400001)(66946007)(66446008)(66476007)(36756003)(66556008)(64756008)(8936002)(91956017)(2616005)(76116006)(4744005)(4326008)(5660300002)(2906002)(33656002)(186003)(316002)(6512007)(26005)(54906003)(86362001)(38070700005)(6916009)(53546011)(508600001)(122000001)(38100700002)(6506007)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5DB3FF56B895B04BACD80C1C62071D96@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2683
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9b0ea04-9dee-4786-e8cf-08d9db4cdfa2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DLNwQ3qSavbJnlsueCwa3ZvNjvdiI+DJTC/r6J8yYOZx69DY/d+Tdk8Xu002+ubX3tyMVu8Gc0QE+ZSFP1Bqx+CulgRpNAXPUwgX0ZTiM1vsZ8YAyvhdl97cLEiWpUOVSJo1R4OIWqV2Aw9KAYmHY9jIF6AXGZNKtxpfjhl8z39YcCnR0ATxKOoLbzaDQgxEj12RWwoZAPbLkRym+Ceb9eEfcDUR22S5VFE/ca6IkcF4dEz3IYZIILqCuN26B0Qma0qS3pAZaeAEetB5PTkR0he1w9OjXMcCBy05nNRmoRBgeoqpzJsumHPMozWSKffpiTIBudVgvkKmlq2PPCQ6ZI03praBYWVghCoK80qnsLepoSga56dGz0gcnHViGWWm9j8+0AfnS9VN3Rh3Bj454hVQHMCR/tQ/v5UJsK/qCEU+rT09oKMDwtfOc7aX/51eRpI5DKtxv4zRN3iKxoEEcOv00lN1VVOWZNZHyvAa4F+Uhj2eC4A3r722aToQzH2Gu7ueZssxsvLQ6jie+8TN7v6VVH4CNizB4SeTh57aM7zjPLn7UdzK9s/FsjBehYLld6fU8Ie+wrMynjTLezILh+66263ilZDQQsCO9+2b5igAlIqg0GiRyRgXrIdHlsYXsxjEM1tuvmkXKDWrPBoHPtocxA7L93yoPKica1FL47wgcur69//v+ECy8s//5W0+Eb4ebjYR9i04Fr+wYijd4gjeaobkU72TAgj+XuxwQv89rwOiUEnbkHgsFVL6u9OpHVdAf/yK4+JdJXEZkWw3qw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(186003)(508600001)(40460700001)(26005)(4744005)(82310400004)(47076005)(86362001)(36756003)(5660300002)(6506007)(6512007)(6862004)(450100002)(4326008)(53546011)(336012)(6486002)(33656002)(70586007)(70206006)(8936002)(8676002)(81166007)(2616005)(2906002)(316002)(83380400001)(36860700001)(356005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 13:09:15.7149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 705cfa84-463f-4a6c-0427-08d9db4ce534
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5888

Hi Juergen,

> On 19 Jan 2022, at 13:06, Juergen Gross <jgross@suse.com> wrote:
>=20
> Coverity spotted a wrong function declaration, fix it.
>=20
> Coverity-Id: 1497423
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> include/balloon.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/balloon.h b/include/balloon.h
> index 8f7c8bd8..510e475a 100644
> --- a/include/balloon.h
> +++ b/include/balloon.h
> @@ -50,7 +50,7 @@ static inline int chk_free_pages(unsigned long needed)
> {
>     return needed <=3D nr_free_pages;
> }
> -static inline balloon_set_nr_pages(unsigned long pages, unsigned long pf=
n) { }
> +static inline void balloon_set_nr_pages(unsigned long pages, unsigned lo=
ng pfn) { }
>=20
> #endif /* CONFIG_BALLOON */
> #endif /* _BALLOON_H_ */
> --=20
> 2.31.1
>=20
>=20


