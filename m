Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF554F8A9F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 02:50:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301074.513737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nccpU-0000yk-Gq; Fri, 08 Apr 2022 00:50:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301074.513737; Fri, 08 Apr 2022 00:50:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nccpU-0000wH-Dw; Fri, 08 Apr 2022 00:50:24 +0000
Received: by outflank-mailman (input) for mailman id 301074;
 Fri, 08 Apr 2022 00:50:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9kDr=US=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nccpT-0000wB-4x
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 00:50:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd7ac3f5-b6d5-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 02:50:21 +0200 (CEST)
Received: from FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::17)
 by AM9PR08MB6242.eurprd08.prod.outlook.com (2603:10a6:20b:283::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.25; Fri, 8 Apr
 2022 00:50:18 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1e:cafe::f8) by FR0P281CA0078.outlook.office365.com
 (2603:10a6:d10:1e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.12 via Frontend
 Transport; Fri, 8 Apr 2022 00:50:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Fri, 8 Apr 2022 00:50:17 +0000
Received: ("Tessian outbound ab7864ef57f2:v118");
 Fri, 08 Apr 2022 00:50:16 +0000
Received: from cad39a13cb8c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 816A0150-1EFF-4DB9-BD43-CE0956A4E65A.1; 
 Fri, 08 Apr 2022 00:50:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cad39a13cb8c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Apr 2022 00:50:11 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by HE1PR0801MB1995.eurprd08.prod.outlook.com (2603:10a6:3:52::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Fri, 8 Apr
 2022 00:50:09 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::8cab:4b29:9cb1:580a]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::8cab:4b29:9cb1:580a%4]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 00:50:09 +0000
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
X-Inumbo-ID: dd7ac3f5-b6d5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeAy2b+ry8eus9mR99lysqtlW1p6PP0BsLtk7hOrYbM=;
 b=F0zjxegPFgguSKsBKbtmk5u+tyKUD9kH67fIgqngn3YvL/oWqcxOAZwIkUkqcQjUx9rNGdEr8u+esmy06MPktnvnHS2oR33xudhr7FPgmCrPJrii4c5bzMCxiGsbgKndyoR8mu+VNq5OF+SFVA7iV+9YPPoPt2Nv4ra9/An473s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8lLnpdyA4ep6mBEetXXowbUBFTDMObAzgDqAqwmGDjFP5jiYsDYJ0zkk9hT8mYrBvoaaJNwuI4yWA0WhlE7pAcvtsXSoaH1GN9ipPxtrr52z5Dt0xHCCyusU9m6FBcG1ZU8+WGXs7CJrwrW46bVCZtlnFqXu0oi2bddbRY0/9vOByPZKlA+eQAFJXHdffIIsNiGxbnwQxAmTeRbCz3u1j6uC1DQdyQOyo0bXCFN/UKsVXbaokmTA9juVnCrkUTNCPkYBUtna4LYJQwCFC+HUhC6Ld7QU6hOPqaqV/+51ae62ozxF9gMHzKYDroyhGgxBHJJ9mVNEKFSoOqMgXooag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeAy2b+ry8eus9mR99lysqtlW1p6PP0BsLtk7hOrYbM=;
 b=DT2WAmYVKY41t5HWk02mt1++/2CUW03JaiTiaaNh44s6/36a+UMX0A1cuhyZFRcHOdNUhxR7t19awjwk85IesYvyOWNxUo5AUFUuBJOvH/CKQDRnAOrr/b/V1TiI9BvQZo89gFdvsqSkEu+7IGUHQTXg5dyLaVjE+FGrpHrgewsoyppFfTKhLG6Dcmk9T6MQ15Xsb5WCknqXO5AZrRxIBMug2MDMrjNVb+LgH/SHFnACf9o7eCCHQ2uMXVd6eMTxpix7NqLnXXQWNmdJxMu4rM451PbWaIjUqEhHuRnk+ftVJDIRYZlT7pS/5WOlA7DMWl29Xeke8QmcmtYjxocm2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeAy2b+ry8eus9mR99lysqtlW1p6PP0BsLtk7hOrYbM=;
 b=F0zjxegPFgguSKsBKbtmk5u+tyKUD9kH67fIgqngn3YvL/oWqcxOAZwIkUkqcQjUx9rNGdEr8u+esmy06MPktnvnHS2oR33xudhr7FPgmCrPJrii4c5bzMCxiGsbgKndyoR8mu+VNq5OF+SFVA7iV+9YPPoPt2Nv4ra9/An473s=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "julien@xen.org" <julien@xen.org>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"wl@xen.org" <wl@xen.org>
Subject: RE: [PATCH v3] SUPPORT.md: add Dom0less as Supported
Thread-Topic: [PATCH v3] SUPPORT.md: add Dom0less as Supported
Thread-Index: AQHYSt1CmA0pSQ994kax2RW1hM7xyKzlLkpg
Date: Fri, 8 Apr 2022 00:50:09 +0000
Message-ID:
 <PA4PR08MB6253660FF724000CFCD7A8C192E99@PA4PR08MB6253.eurprd08.prod.outlook.com>
References:
 <alpine.DEB.2.22.394.2204071706470.2910984@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2204071706470.2910984@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6E6DD5A437362D4ABADF617DAE949013.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a09f3da8-ff27-4e97-d1d9-08da18f9c00e
x-ms-traffictypediagnostic:
	HE1PR0801MB1995:EE_|VE1EUR03FT035:EE_|AM9PR08MB6242:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6242129911C58389BD1B07CE92E99@AM9PR08MB6242.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hDzKby7sWY+jCDCd4sqongvXlSWVVKv3tbG0w0CZLWjWvpswqG3WMmXCRLSHyKZ4EidHTJj0NZ6qvnDVuflMh2S86kZ1MSnaZ3R0wnDccKQuVZgsVA5XBVAkdFewsOsOiZLNQzeOkgKygk6DY3Xdet6bS+wydbwhqRSMXaXgVrQ1e5I+7+223rytOJpbESGHb8nHMpc5MHte8tc3eZ/ZtR8DZ6Dx7q0EweXzMXZxp0i8mqXd7N/uywuGix0cc7Rt+pS4si6Dlk9Znwx6stHpVUtBN06zM6Y2oy4u5LWVZDqvTsandcG6uA/ovuH+BKUmZDzGRjiswEiJuBjpRXa9XLP6fqC3nYMY6xLf5pAssRufcfsaGSDBDORUGhmSMSfVsKkSVjm94O9qA+nov29F/doQJEFnMkswWh68C0cGx/Q3IA2A8FRht4KL7BsjioXqXCekAuayP8eDVuEh9/Rnb+VEZ0cHL35jQujOqx7xWU124HIB7+JVXayfIsXXFQRUXnX62MdPeLoeFnV4S2mhmhyoz6mkcPrfmH+7Pty/pd2EEaPlPbVgLU+L2ibMoNm7TbixKBiiz07zNQ5A40A4mDXgQHQO4M6ILJ9YB/RhJeE8aeEFA86q1L5rfQ7UF4nkHsCpDVcHoh82doZI/STxvG23/XH6MCMzjUIrtDjlEce5uCiaIyXLlM4eRhAwu82zOw+yEs39LjUy49R0qg1GqIEujBT+f5WMedB9lez0vhU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(508600001)(66946007)(38070700005)(8676002)(4326008)(71200400001)(8936002)(66446008)(66476007)(33656002)(52536014)(110136005)(54906003)(55016003)(2906002)(186003)(66556008)(64756008)(7696005)(316002)(76116006)(38100700002)(53546011)(6506007)(83380400001)(26005)(86362001)(9686003)(5660300002)(32563001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1995
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	01361518-c69b-4d84-7ec2-08da18f9bb5c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FM4TiSPVH7+AvovfjVSnNxFZ2aAYhF61fty/z3saLIsMDleCzF4Q5wwseu6oBi1gT/rm7YCyPDexQQQ61Ta74dJm0WIxkhUf3yju3RWxyZypBMl3Naya2t5iRX8kujKa9OqMMzEUzxCtNXhN/lS7qtFLxyogw4lzxFFSNv8UA9C3oiQrxU2up9lBsXrqeD47+v6E1NAXg75TSbLY+jVSlRWgw7uS1et7Skfi148vUyvRuDwXibePTiedHxbHBfRQBIlwLYrgMIJEpL3B1+bppVDrs64RxV4Yd9CSh88v5iPDqcwdwqAZn5aAOf+8/H71XzARsKTB7n/beOOH6kaGqLSnP5/QbMckfkiMHDt74vlwxezPyTPQ3oA4hM00wocYsMlMKLi6zPJ0uqaKldckyUGZbnlNuFnMJ0Hb6DQufK/DapJEduaIJ4umqjawZJcsk849DmQfv/MeggaLfWCUyu3YTkQQQq4YvoxizlDkLx4Pk7vghAhyDZTxkpZVZM4DeSbk9w0+P7/HSGJGEWVZT78YSotCfU73kmZUP3KbfoeXZMyF/Is8re0MOBPJ03DkOfI4eUw38ZuTE2aRhHG//3hbGJw9zciwVlW1+Z/FbvRWOO7Vj66OtGu9SQb3wsuAV18Gbq94E/JHylT6DeC8SCxg35N+I+Hh1+EGoH6zivJBZr9j70RjkIiLZ1ZiXZyFl9eomMJu1wCFz+pVDXQf9A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(26005)(54906003)(83380400001)(110136005)(8936002)(2906002)(186003)(82310400005)(316002)(40460700003)(336012)(86362001)(356005)(81166007)(47076005)(9686003)(70206006)(70586007)(36860700001)(5660300002)(508600001)(33656002)(4326008)(6506007)(8676002)(7696005)(52536014)(53546011)(55016003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 00:50:17.3372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a09f3da8-ff27-4e97-d1d9-08da18f9c00e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6242

Hi Stefano,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Stefano Stabellini
> Sent: Friday, April 8, 2022 8:11 AM
> To: xen-devel@lists.xenproject.org
> Cc: sstabellini@kernel.org; julien@xen.org; andrew.cooper3@citrix.com;
> george.dunlap@citrix.com; jbeulich@suse.com; wl@xen.org
> Subject: [PATCH v3] SUPPORT.md: add Dom0less as Supported
>=20
> Add Dom0less to SUPPORT.md to clarify its support status. The feature is
> mature enough and small enough to make it security supported.
>=20
> Clarify that dom0less DomUs memory is not scrubbed at boot when
> bootscrub=3Don or bootscrub=3Doff are passed as Xen command line paramete=
rs,
> and no XSAs will be issued for that.
>=20
> Also see XSA-372: 371347c5b64da and fd5dc41ceaed.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v3:
> - improve commit messahe

For the patch I don't have any comments, but I think here we've got
a typo: s/messahe/message. I think it is ok to fix while committing this
patch so this is just a kind reminder :))

Kind regards,
Henry=20


