Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D463522144
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 18:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325890.548665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSlR-0007oK-PA; Tue, 10 May 2022 16:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325890.548665; Tue, 10 May 2022 16:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSlR-0007kq-Lz; Tue, 10 May 2022 16:31:09 +0000
Received: by outflank-mailman (input) for mailman id 325890;
 Tue, 10 May 2022 16:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6+Ra=VS=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1noSlP-0007kk-1p
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 16:31:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95bb81b3-d07e-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 18:31:04 +0200 (CEST)
Received: from DB6PR1001CA0042.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::28)
 by PAXPR08MB6397.eurprd08.prod.outlook.com (2603:10a6:102:12f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 16:30:55 +0000
Received: from DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::11) by DB6PR1001CA0042.outlook.office365.com
 (2603:10a6:4:55::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Tue, 10 May 2022 16:30:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT011.mail.protection.outlook.com (100.127.142.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 16:30:54 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Tue, 10 May 2022 16:30:54 +0000
Received: from 59ffd3175b40.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9280C3EE-FD7D-4DC4-A976-7AD1C9B79635.1; 
 Tue, 10 May 2022 16:30:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 59ffd3175b40.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 May 2022 16:30:48 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com (2603:10a6:5:1e::14) by
 AM6PR08MB3080.eurprd08.prod.outlook.com (2603:10a6:209:4c::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.20; Tue, 10 May 2022 16:30:45 +0000
Received: from DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac]) by DB7PR08MB2986.eurprd08.prod.outlook.com
 ([fe80::c93a:3b90:5380:ddac%3]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 16:30:45 +0000
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
X-Inumbo-ID: 95bb81b3-d07e-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NphANF8vM5UIPp7upLLqu1z6c5u2tf/xB9re3IvS/yCbGz6jnbhs5w+SZnSCXl1ouhi793Q7U0DVrgN9nkpn4MFsMB7k34Zc7zVQZLMtJjS9kLXXAeIMYSMbgta9IKNUD/6i+oE50T/a7LM39m7FLIHuM/MNQJ0+dmmVLTsPTCEE+gUhXcO4XvvhmlKggd3i6t2rMdzvS3z5BqZGbXsXfHdyNGE3/Ijx9X9GkLolwg+4OjZ5F1+DkHVcJoxq0olP4IyLDcYCex2l53CzTC843iDKab8r28uYGZbJ+NaqJvhwvL4DH0+iXQHBvd7tRb7UrhAZEGJKhqXIi90JiEPWKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnuWlPfkWyArRFxmCIf95KmFmIIooSlgdjjb6uxE4+k=;
 b=gbKJn2BNm/JxZ9fSf9OwpIxcV5OH4Wy15dDJ5mh+4KWxRXJvFQnRQd+W+DTv+RUB66nqbAbeMkxXBzA5GFRAXZUI6LSJYVk6lGQuq1ZnL4fT8Gu+RuG16VMK9/x5f4agNkjyxYs6ZZp4OEyGzgj0pUYyxKKAOZxqkUTgGpB8Z3fnYfAMXU0YoU5SeT6X23MwxS3EQ1ISw9myzUZM1+X2o7hFhlh/4FF8E0kRtDrqRDY8juH2p2A/2XAmg6vDU8UVKXpRFkknBuWs9ckyCmM3PjB/Z7cwLofZCuVjNPjY54MIcKIRZPfXshAF+qymvuY9/f0OCmoxoc6uiVw+qSNECw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnuWlPfkWyArRFxmCIf95KmFmIIooSlgdjjb6uxE4+k=;
 b=e4P1GFg3WK9agqQveH32cE30celWXczlzlB211o0Oze5S3n+hWKz9XcdpmEVx2JKJLRTfPvWbRSoaMeoZYXMa8JeNG/0cbKMmtBHdQdQ+yanZZ+JNS/I0jt7wmx6ZLYGS9LzWRH6d/Y1GUclJdMrERA4RJHVUro24dRIl+mPxrI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 50c8826e3309cba5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWmGEdG88wUe3MsrdYKZIKbUScesf6ML3eHUN1zcB2lbYu8XXKMxZmTAFkXxbk+f1w22EMg3+ELFE7gNoSmHUcrfMSqLofsCEgfZKTsLioEzfpP17bGt1fXegIzc0y0Hj1dCTcQIXstHUm5HcIhm144GpoxvKFBDVdLCsO4X3szrvQUWTw/7Pv5RQ3tqdKhmfNYChtaU7AZvGPL45fpIn89F9ZVOgDpWiYFbtd3LL77whOsE38DCEu56jo4sh+CeAPf20TiNpK/l6Z/Zm2JrUtvo5OAUq6tESC2zRKQ8R9D1AmoU3DH2s21N6K1xIsiX8pxNumNV7TUgYYa/in1Mhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnuWlPfkWyArRFxmCIf95KmFmIIooSlgdjjb6uxE4+k=;
 b=eOLSz9/sFEpiPAiJDwstWf5B+9mCu4l1i7urfZUi/zWaLcS+Tqi0CkaOkRhgxNI5H0rsBFB7lt4ZHl7kzeeUH5dBg29JxrHZ8EyL1WjuqwRXvucNNbZ9OBBGgzYQNCZR1QMQQWY6gesmgXLv4H4Jnwteig1sfAMv12W78Am5fkvAG45u4agEhUcHHbvPPF1yUK0kpIbgyzq3nnoexMrj7unL3ItmeCl6vt162S2hAy8s9hoGbZHCe8pDPpgJz1LyvYa2sGiEoxflIBLy0OcalL07tF7b6ceSmJ1gTu4bxFq014wGzp7FSyv/UgTRmsAqh+gr4OA3vJN9bJXqFcAO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnuWlPfkWyArRFxmCIf95KmFmIIooSlgdjjb6uxE4+k=;
 b=e4P1GFg3WK9agqQveH32cE30celWXczlzlB211o0Oze5S3n+hWKz9XcdpmEVx2JKJLRTfPvWbRSoaMeoZYXMa8JeNG/0cbKMmtBHdQdQ+yanZZ+JNS/I0jt7wmx6ZLYGS9LzWRH6d/Y1GUclJdMrERA4RJHVUro24dRIl+mPxrI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Luca Miccio <lucmiccio@gmail.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Topic: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Thread-Index: AQHYYBWH2ZK8TL5ueU+mSOXui+uVga0YVmwA
Date: Tue, 10 May 2022 16:30:45 +0000
Message-ID: <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com>
References:
 <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-4-sstabellini@kernel.org>
In-Reply-To: <20220505001656.395419-4-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ca486ac3-741e-48ae-dbe8-08da32a27498
x-ms-traffictypediagnostic:
	AM6PR08MB3080:EE_|DBAEUR03FT011:EE_|PAXPR08MB6397:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6397D706220C1D786618C315FCC99@PAXPR08MB6397.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VX7nQtwFxQr6t0DG92NZv4GAjteo9h2kSBMm3XLB0NzQmLdJeDGWLNyHf2OaQcKcL7prY0E7fbNbMcQG3ZEvsIsu292r+7FRYX6x3Has9Gn+yFwdGUoV+5J1tcfNffQ98/0EaoQQ5sMt31oEDYUVV0qEOxT4E/WWMPzaNFY4aYvvyAtc7yRtZ5beZ2l8xnK8W28evihr1lxwpyFuUZB7NoJvAz7qEvqoPLRu83wkAnr5olKpuUwQ1A7usa/mOmiOQ+kEZbDlgcYmM/BQfcpNdEAl/TF7idL2EEQLWhDxhcr60LAdTXyDTm2fQ2kRz53qEa8kd1y/sekrTRg/KJAqYVp3obUYqc4hnqWgEZ/HRqunYHsVQdCNtP4BWrqFpngh0SkZlZXsSoD87a/8oTc4lVnnAbcbfSeoU42Oydtnv7QNSpkUXpVvksXe/rTioH+fR0V+alC5liI0FbWad6Takk04MTt2odJq1wRjyH95FR77CvRvGGIZJfmFRCbrPUXiBAfqQd+RqmQL0ZHep2TTgqQwbCAsCrqeYgwtqIW1j7EBvYhp+ex26TjucfyvS9837sn+We7epxVc9TgYOyxqy8L9WuegMVlj4cuMzdEnXn7OCX66F3xNLBbKYMn/zz665TmNmbWVvzJQgq9Ve5JnQPHEpu+5lLQTyFU6o5cSubxZtlKfNuOTg+0AvGypsFuB+K2kbaj3EiPXTAF6ebPp5icp4Xv1Zfr2a0btCGq0LyXcL074LYri5ULon4446KLwiEEukKhLBmHAIIL812Rjsw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2986.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(86362001)(6512007)(186003)(2616005)(5660300002)(8936002)(122000001)(2906002)(83380400001)(8676002)(4326008)(66446008)(66476007)(66946007)(64756008)(38100700002)(66556008)(38070700005)(91956017)(76116006)(6486002)(71200400001)(6506007)(6916009)(33656002)(54906003)(508600001)(53546011)(316002)(36756003)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A428A1C139C29947A3BBC55E3C85AB7B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3080
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2911d839-fa6d-4e56-46d4-08da32a26edb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eeMKgIDyzC+VVVPnGWI8OCgIbnoy+qdCVynPKCPXfRMS2eh2opksoXCvS/uCQWtcjaxliB+AJbIP+lTNPpjmpX1JQs89y0jSeDvjqpyumdm2skpW+Zknb3h0OuL2CfW2N7gDyJLVRsZ6EtR2Ae0kMgOsOQ09/dAX/skUhR5+QluIOD1LEjzOxmU2FOjnKBzyaZpYTBH63gMDof3dfRrJrAQUODw2njSB2oIhIbOqLa6oPYIziwi9IdxV6a04u1j8IEdUt9s0JOM8mf54dLEt2ZXTednoy6Dcz/MOlJyYnFxXiHMXJgpdIGB0TsvsxJdowww8+gOtccLX6NCASdO4W1unzDyuqDM/AT2me8nIczPe92aG65Bixcs8Pp4qqRtq9xI44GMXtixciEE53WfWbkBwQ3UUfVe95NWtBTFqKtbpr2pDvXcefsMyqagNP6kjikrH+xvWY1zubOIz9uwFwdiOJjjKHRMbspgSYrj0OiflnPQmRPcGbaO1XmoGHAXMTvrYeO0zawrbxIjiIZSeFoB3zvYEjEA7yu1h/a/GFrkUnAa59OJOyDtWJPzqTIqthd+BYlqpXOMZQOrD6bgXa/oOiZjBgHwTs9q/VeYCYSkBMSoX4LvF0SQYApmEbiX7GL6lFReBrdgwJjcVMv1BO4Xcquz7uWsB6PX+n6u4weY0NWSjY7eDcW+1CM4YIBUS+PU6TiJO8Mjeg666OkaTVg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(508600001)(6486002)(316002)(8936002)(54906003)(36860700001)(86362001)(356005)(8676002)(4326008)(70206006)(6862004)(70586007)(81166007)(26005)(6512007)(40460700003)(83380400001)(6506007)(53546011)(186003)(2616005)(107886003)(2906002)(82310400005)(336012)(47076005)(33656002)(36756003)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 16:30:54.8455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca486ac3-741e-48ae-dbe8-08da32a27498
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6397

Hi Stefano,

> On 5 May 2022, at 1:16 am, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> From: Luca Miccio <lucmiccio@gmail.com>
>=20
> Export evtchn_alloc_unbound and make it __must_check.
>=20
> If "xen,enhanced" is enabled, then add to dom0less domains:
>=20
> - the hypervisor node in device tree
> - the xenstore event channel
>=20
> The xenstore event channel is also used for the first notification to
> let the guest know that xenstore has become available.
>=20
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: jbeulich@suse.com
>=20
> ---
> Changes in v5:
> - merge with "xen: export evtchn_alloc_unbound"
> - __must_check
>=20
> Changes in v3:
> - use evtchn_alloc_unbound
>=20
> Changes in v2:
> - set HVM_PARAM_STORE_PFN to ~0ULL at domain creation
> - in alloc_xenstore_evtchn do not call _evtchn_alloc_unbound
>=20
> xen: export evtchn_alloc_unbound
>=20
> It will be used during dom0less domains construction.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> xen/arch/arm/domain_build.c | 37 +++++++++++++++++++++++++++++++++++++
> xen/common/event_channel.c  |  2 +-
> xen/include/xen/event.h     |  3 +++
> 3 files changed, 41 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 016f56a99f..bb430f2189 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -27,6 +27,7 @@
> #include <asm/setup.h>
> #include <asm/cpufeature.h>
> #include <asm/domain_build.h>
> +#include <xen/event.h>
>=20
> #include <xen/irq.h>
> #include <xen/grant_table.h>
> @@ -2810,6 +2811,8 @@ static int __init prepare_dtb_domU(struct domain *d=
, struct kernel_info *kinfo)
>     int ret;
>=20
>     kinfo->phandle_gic =3D GUEST_PHANDLE_GIC;
> +    kinfo->gnttab_start =3D GUEST_GNTTAB_BASE;
> +    kinfo->gnttab_size =3D GUEST_GNTTAB_SIZE;
>=20
>     addrcells =3D GUEST_ROOT_ADDRESS_CELLS;
>     sizecells =3D GUEST_ROOT_SIZE_CELLS;
> @@ -2884,6 +2887,13 @@ static int __init prepare_dtb_domU(struct domain *=
d, struct kernel_info *kinfo)
>             goto err;
>     }
>=20
> +    if ( kinfo->dom0less_enhanced )
> +    {
> +        ret =3D make_hypervisor_node(d, kinfo, addrcells, sizecells);
> +        if ( ret )
> +            goto err;
> +    }
> +
>     ret =3D fdt_end_node(kinfo->fdt);
>     if ( ret < 0 )
>         goto err;
> @@ -3150,6 +3160,25 @@ static int __init construct_domain(struct domain *=
d, struct kernel_info *kinfo)
>     return 0;
> }
>=20
> +static int __init alloc_xenstore_evtchn(struct domain *d)
> +{
> +    evtchn_alloc_unbound_t alloc;
> +    int rc;
> +
> +    alloc.dom =3D d->domain_id;
> +    alloc.remote_dom =3D hardware_domain->domain_id;

I tried to test the patch series with two dom0less domUs without dom0 and o=
berved the below error.
This error is because there is no hardware_domain in that case.

(XEN) Data Abort Trap. Syndrome=3D0x6
(XEN) Walking Hypervisor VA 0x0 on CPU0 via TTBR 0x00000000f91f5000
(XEN) 0TH[0x0] =3D 0x00000000f91f4f7f
(XEN) 1ST[0x0] =3D 0x00000000f91f1f7f
(XEN) 2ND[0x0] =3D 0x0000000000000000
(XEN) CPU0: Unexpected Trap: Data Abort
(XEN) ----[ Xen-4.17-unstable  arm64  debug=3Dy  Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     00000000002e4180 domain_build.c#construct_domU+0xc90/0xd0c
(XEN) LR:     00000000002e4178
(XEN) SP:     000000000031e450
(XEN) CPSR:   0000000060000249 MODE:64-bit EL2h (Hypervisor, handler)
(XEN)      X0: 0000000000000000  X1: 0000000000000000  X2: 0000000000000000
(XEN)      X3: 0000000000000005  X4: 0000000000000000  X5: 0000000000000028
(XEN)      X6: 0000000000000080  X7: fefefefefefeff09  X8: 7f7f7f7f7f7f7f7f
(XEN)      X9: ff6f606c2c68726c X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101
(XEN)     X12: 0000000000000008 X13: 00000000002ca000 X14: 00000000002cb000
(XEN)     X15: 6db6db6db6db6db7 X16: fffffff800000000 X17: 0000000000000001
(XEN)     X18: 0180000000000000 X19: 0000800763a34000 X20: 0000000000000000
(XEN)     X21: 000000000031e4c0 X22: 000000000031e4d0 X23: 0000000000000003
(XEN)     X24: 000000000031fdfc X25: 0000008400000000 X26: 0000000000000021
(XEN)     X27: 0000000000300d08 X28: 00000000003fe97f  FP: 000000000031e450
(XEN)=20
(XEN)   VTCR_EL2: 00000000800d3590
(XEN)  VTTBR_EL2: 00000083e3a67000
(XEN)=20
(XEN)  SCTLR_EL2: 0000000030cd183d
(XEN)    HCR_EL2: 0000000080000039
(XEN)  TTBR0_EL2: 00000000f91f5000
(XEN)=20
(XEN)    ESR_EL2: 0000000096000006
(XEN)  HPFAR_EL2: 0000000000000000
(XEN)    FAR_EL2: 0000000000000000
(XEN)=20
(XEN) Xen stack trace from sp=3D000000000031e450:
(XEN)    000000000031fda0 00000000002e5484 0000800763ff2390 00000000002f1ae=
0
(XEN)    00000000002c98c8 000000000031fde0 0000000000000003 000000000031fdf=
c
(XEN)    0000008400000000 0000000000000021 0000000000300d08 00000000003fe97=
f
(XEN)    00c2010000000000 000000000031e4e0 0000000000000000 00000000040f000=
0
(XEN)    0000002200000001 0010000000000000 0000020300000000 000000010000000=
0
(XEN)    00000000000c0000 0000000000000000 0000000000000001 0000800763a3400=
0
(XEN)    0000800763a0c000 0000000000000000 0000000000000001 00000000a000000=
0
(XEN)    0000000030000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN)    0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
(XEN) Xen call trace:
(XEN)    [<00000000002e4180>] domain_build.c#construct_domU+0xc90/0xd0c (PC=
)
(XEN)    [<00000000002e4178>] domain_build.c#construct_domU+0xc88/0xd0c (LR=
)
(XEN)    [<00000000002e5484>] create_domUs+0xb4/0x1e8
(XEN)    [<00000000002e999c>] start_xen+0xaf0/0xbe8
(XEN)    [<00000000002001a0>] arm64/head.o#primary_switched+0xc/0x1c
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) CPU0: Unexpected Trap: Data Abort
(XEN) ****************************************

=20
> +    rc =3D evtchn_alloc_unbound(&alloc);
> +    if ( rc )
> +    {
> +        printk("Failed allocating event channel for domain\n");
> +        return rc;
> +    }
> +
> +    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] =3D alloc.port;
> +
> +    return 0;
> +}
> +
> static int __init construct_domU(struct domain *d,
>                                  const struct dt_device_node *node)
> {
> @@ -3214,6 +3243,14 @@ static int __init construct_domU(struct domain *d,
>     if ( rc < 0 )
>         return rc;
>=20
> +    if ( kinfo.dom0less_enhanced )

I think we need to do something like this to fix the error.
 if ( hardware_domain && kinfo.dom0less_enhanced )
{

}


> +    {
> +        rc =3D alloc_xenstore_evtchn(d);
> +        if ( rc < 0 )
> +            return rc;
> +        d->arch.hvm.params[HVM_PARAM_STORE_PFN] =3D ~0ULL;
> +    }
> +
>     return rc;
> }
=20
Regards,
Rahul=

