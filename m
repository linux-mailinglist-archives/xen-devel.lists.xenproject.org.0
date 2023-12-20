Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82525819EFE
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 13:28:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657776.1026855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFvfx-0007Ct-AR; Wed, 20 Dec 2023 12:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657776.1026855; Wed, 20 Dec 2023 12:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFvfx-0007AR-7E; Wed, 20 Dec 2023 12:27:49 +0000
Received: by outflank-mailman (input) for mailman id 657776;
 Wed, 20 Dec 2023 12:27:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KgnP=H7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rFvfw-0007AL-Be
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 12:27:48 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20600.outbound.protection.outlook.com
 [2a01:111:f403:260e::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ddd907f-9f33-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 13:27:46 +0100 (CET)
Received: from AM5PR0601CA0073.eurprd06.prod.outlook.com (2603:10a6:206::38)
 by AS4PR08MB7656.eurprd08.prod.outlook.com (2603:10a6:20b:4f2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 12:27:39 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:206:0:cafe::2d) by AM5PR0601CA0073.outlook.office365.com
 (2603:10a6:206::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 12:27:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 12:27:38 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Wed, 20 Dec 2023 12:27:38 +0000
Received: from 827238329250.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 214473D2-7DFA-4654-8CBB-39EDCA127F24.1; 
 Wed, 20 Dec 2023 12:27:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 827238329250.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Dec 2023 12:27:32 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by DB4PR08MB9312.eurprd08.prod.outlook.com (2603:10a6:10:3f4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 12:27:29 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e%3]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 12:27:29 +0000
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
X-Inumbo-ID: 2ddd907f-9f33-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OAiJ7mVfASqbzvXolgHs6G7gmgWuEEnStMVprNXwuvjHrGyUEKdAvSUJOWLvBzRzyXMgKKaowwEtzJMbP1yLT4Nvv8UrcT/6v2eZ4GEQtGOlN/Ob7s7SFDy/Lf1IPnRJjOIYIlYqtrzKmQNTcnDFkh5H8NxMrB+xgv7fei3wkQjlnlmOzT9CryniRkUAtgirUZ/ZH+qwbOrYjEJ+cGtIVfoThb2hPcouXUXlBlUHYDLeGXIMgvPS1h4Sr33nanlSsDlQqJ18cJRHjcuOsqc6j6VXMJm6IiGpR6UhE2uBWLlOQKZ37c8g6IHLDrRJOEz62MtOn1OKq3BX+G7urjCaRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGkhK85WRpALsvbvriQYc0W9/0wp6up+v/Jy1+/wY68=;
 b=dQnyWijAkIaP9957NGuqsJ3uwlGAqqLoY6gWZ6XHVrn692Jta4Hz39i9XE4VTKQxS9S/GeJiBoFOoW49q2MELeWgv5VT4ifLRoG61V8mYa4Ce5LfjJkoJd3qzIikEFsWp5wiPWKZ9gtCUkVJyajJuib4ytvZlKJM1ZBf/sjNgB2h6SUu0+VdB+0+VwqdzRRMQT1fYLVyX7Z1yDIMqPG+lsvjceyJTrNnkyvdcFLmSuQ1zQkso2SNFbcV0UITj96f3GqjvkoLDKM9wGX0b+Umwdhe8eaJZGuVCrX6XhwJBy+nsvl4BZrW24cSK6iPss222hOgAUguyFTIvf7Y1Z4mYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGkhK85WRpALsvbvriQYc0W9/0wp6up+v/Jy1+/wY68=;
 b=Bd0MBOR5waDRNMFJprLwe/rUmGBtfyza4fQwrqh5u86P+keM+vuC6tTE4kJD4e9Fl5GcExUcrZpJ3kmR/pxnkx+R4iFUtE/Q6bPodSTSh1yREIntTqYBKOtlZQ9ymSdCzLXwWYTBsDanfBFjiMI+zPspzmV0g6+Q/Z7zc9Jol6Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d68be37f52610cd0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a1b3nHDClnjL7JUXou+hl4kQ/OTBhEeI6Fr/9aMh1KO9EIY7LbgPFoLWxNBsqD5Xzt0nGbRZTVue14TVmXLzgob0m9RnLdGesAIKLRwn3A9k/R2sb6GpMu1LN0ULb0I18kVz1/CKZeeLXc4cWBjU0RYjed8JHmsa2Z8MJ9eRO6ICfZ3L98vOetHBqVdiXsXZq0R9sgJgG50aFOBWRb5wkXt/CPVHHJdFeDu1vGHeLteaCOesygFl3Rxp1oPGGrLVgy1QW5SonOLGL4mCqtPtjDHbhh9c3k3OGTUe848WXkJplzUTpFSDdNKCxnaUAXuuV8NWgUtfETxzq3gKloZBSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGkhK85WRpALsvbvriQYc0W9/0wp6up+v/Jy1+/wY68=;
 b=Vs1T5hshrbyx/26Fn4SaB5ODjF4hG5WhAbU1yv07RArvRAjAChX7gFbL3sTRR+B5EHHSGLoLlXjMOPS28y1l5YsxLAqqEVUTPz6Yf1X+3o/tSJtyhTgt/+RSeWCRDVqu4//AhI5t9Ta1irXWlROwG1qt+kDd55jo0wyRNaQ9mqGJP+lCcxegcUtbAJGs5rUGC30SSb6WJcenjtONvcXvfU5/ll+9N7OIK7/xj1pUS0K7pZkIebGP9wfW9erF8omNKS+V32Hbb0modz7noodwpoyVECMvTRTR+58SM4AUU1vGPV01ZhsYm1ZAyHLAVYddU7ma4YKdg13RLWKC2v31sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGkhK85WRpALsvbvriQYc0W9/0wp6up+v/Jy1+/wY68=;
 b=Bd0MBOR5waDRNMFJprLwe/rUmGBtfyza4fQwrqh5u86P+keM+vuC6tTE4kJD4e9Fl5GcExUcrZpJ3kmR/pxnkx+R4iFUtE/Q6bPodSTSh1yREIntTqYBKOtlZQ9ymSdCzLXwWYTBsDanfBFjiMI+zPspzmV0g6+Q/Z7zc9Jol6Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "stefano.stabellini@amd.com"
	<stefano.stabellini@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 0/3] xen/arm: Add emulation of Debug Data Transfer
 Registers
Thread-Topic: [PATCH v2 0/3] xen/arm: Add emulation of Debug Data Transfer
 Registers
Thread-Index: AQHaMfEa7o9h58xZgUaSJIw5Lcks+LCx6kEAgAAD4ACAACpXAIAAA2CA
Date: Wed, 20 Dec 2023 12:27:26 +0000
Message-ID: <486E607F-37D1-4D75-864F-533ABEF31ECD@arm.com>
References: <20231218202959.1390114-1-ayan.kumar.halder@amd.com>
 <F1A640BE-0CDC-4026-BBB3-637ABE7D996C@arm.com>
 <5E9E5368-8AD3-490E-8034-78F5BAF23006@arm.com>
 <34f3342a-b86e-4e74-bfba-d55e0de55600@amd.com>
In-Reply-To: <34f3342a-b86e-4e74-bfba-d55e0de55600@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|DB4PR08MB9312:EE_|AM2PEPF0001C70E:EE_|AS4PR08MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b1dfe2d-4d95-4fd2-6509-08dc01570e0c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 swRCw/8d9DvmyKW0rTzC4Pyd7bXVjud49gxLh+MAyc5AUPNBcT7OvITQrlguhHAztzU0V2bQ1zelvtz5FzfiIZs03+wQzsJsoKGiSLgJybGxaw8udrIJBIy4NrPAxK7X2GYRua/m5yN1b52tpyqhTBtb5SXlLhLP3IzJi1n9UkzDsO6tVFj3GWq8Ijbbzfhy6wRpj0yqPGK3+FNngibMmonOcSEB9tFo2pwGdK8p9xOkbyB4tOty2FIjpZi2eCCWhHuWX2PkxEDEL0E6AhOJ7Mdis5xuqJ5IAwjyerz/Cj6UdO9hY/1hWg7z8u9wKpGe/0UdYEeLcqF1UYa7jJ7AJ/7MQeNvEo7OwXEOZc87w6OSsjatQtbsV/xr6tSID1It1KIqdWz0xvwouWF27tOdjAsiIh3cP/x1aUx5bLy6YRlAYaDyhM08Z8Vq7JuiVU/76SaUmWMy9zzTbtA0DurRpu+kul+DCLieneI2LxHW5deSf21L7+g0d1WJlNeBAjq4UdBYBo7sJwBR/p6I5tU20XbjP58VV7APfSe1hEaTHSvQVC0ZT9kT/fGTOaxp+qGcbcHJNK8HW1yNB+pUcu6ihxiNHQtH+lxpYL0hraAjRWKm2K6prmwa4jAghSMxjAqSVmoMQ4brvpru7zIw+TbqVQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(366004)(376002)(136003)(396003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(316002)(2906002)(6916009)(4326008)(8676002)(8936002)(478600001)(26005)(6486002)(54906003)(6666004)(71200400001)(76116006)(66946007)(66446008)(66556008)(66476007)(64756008)(91956017)(6506007)(5660300002)(6512007)(86362001)(38100700002)(122000001)(33656002)(36756003)(2616005)(38070700009)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDC69FBEFE60274C9453D4FC9A3AB34D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9312
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e057879-6a39-4a8c-1887-08dc0157068d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	imSmFTuXJTscqEGEFj2DJn6dI3iZGqGoQH3DkLcPqwV44SmyMDgQz+J/9louZUeL4ps4KsOsQtrhi8xoJl0kMNuw+WGFLNqIwHB4wazIOs9P61oZbpyXGNtk8CpZMlEv9am9P1vm/fh2ny/a9Llw0f+OJBB7OTcTukDiZOILMSovyVpNH+CatW10tMFgNVCIvxoC6KIBxwaDn7LBNAJrJgZmFLeM/v4DC5vkCAlsiZcAv6pWcfNaGMrp25ObqI9Hn438vEy6OJexWmXl+qjdXMBOz40XXOpDKvElcaQl/JFlnk9w4cUCe+2NiuEZqJvOVDFMzDr7C/r3HJFnl4gAca0c9Ng1JtDJVWXiWAPaME2Gr9bkrGsK9bmM8Y/Wn8ybBS28b1/N1nPKfF5djsgzvydX5dD6vgbdBZPWXwOpjpoXjl99R8xU2mM4MtCdNqTkU803DO5gu7wuJYSTnEbdo3cX1tnQVoVU1YvR+9aNGkdVA7sI8B0QJY/Sue4eM5ULmc9rtPBX6WLzyPgxDlpb2jAIJwbkCHbOgid8rosqToiTH0v3Vez6V6fyn02Goi9Qttl7gDYIiuY+r0fAVC6zEoqI8HnYfJfiWA52rKjmijaeJrLLo8a6miBBhnrSdDfUs7V+GWIYKIapoTnP1Z3J4ePwi54A9R1i/LVgPZ+67T5VAJAfK3Mz0N/L5ehT5DcaqUKYf/pkSZCZWh0IS8/CX3BjNM5U5rz5NUz4e+u1Re/ntkUn6BrXq2hnMUCltpO3
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(82310400011)(64100799003)(1800799012)(451199024)(186009)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(36860700001)(82740400003)(336012)(47076005)(81166007)(356005)(8676002)(5660300002)(2906002)(33656002)(36756003)(6666004)(26005)(6506007)(6512007)(2616005)(478600001)(70586007)(6862004)(70206006)(41300700001)(54906003)(6486002)(86362001)(4326008)(316002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 12:27:38.8618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1dfe2d-4d95-4fd2-6509-08dc01570e0c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7656

DQo+IA0KPiBJIHdhbnRlZCB0byBrZWVwIE1pY2hhbCdzIGNoYW5nZSBmb3IgdGhlIGFybTY0IGFz
IGl0IGlzLiBBbmQgaW50cm9kdWNlIEtjb25maWcgYW5kIGNvbW1hbmQgbGluZSBpbiBzZXBhcmF0
ZSBwYXRjaGVzLg0KPiANCj4gQnV0IEkgYWdyZWUsIGl0IGRvZXMgbm90IGxvb2sgY2xlYW4uDQo+
IA0KPiANCj4gSSBhbSBmaW5lIHRvIGZvbGxvdyB5b3VyIHN1Z2dlc3Rpb24gaWUgKE9wdGlvbiAx
KQ0KPiANCj4gUGF0Y2ggMSAtLS0+IGFybTY0IGNoYW5nZXMgKyBLY29uZmlnICsgY21kX2xpbmUg
KGF1dGhvcmVkIGJ5IE1pY2hhbCkNCj4gDQo+IFBhdGNoIDIgLS0tPiBhcm0zMiBjaGFuZ2VzICh3
aGljaCB3aWxsIHVzZSB0aGUgS2NvbmZpZyBhbmQgY21kX2xpbmUgaW50cm9kdWNlZCBiZWZvcmUp
DQo+IA0KPiANCj4gQWx0ZXJuYXRpdmVseSwgSSBhbSB0aGlua2luZyBsaWtlIHRoaXMgKE9wdGlv
biAyKQ0KPiANCj4gUGF0Y2ggMSAtLT4gYXJtNjQgY2hhbmdlcyAoYXV0aG9yZWQgYnkgTWljaGFs
KQ0KPiANCj4gUGF0Y2ggMiAtLT4gYXJtMzIgY2hhbmdlcw0KPiANCj4gUGF0Y2ggMyAtLS0+IEtj
b25maWcgKyBjbWRfbGluZSAod2hpY2ggd2lsbCB0b3VjaCBwYXRjaCAxIGFuZCAyKS4NCj4gDQo+
IExldCBtZSBrbm93IHdoYXQgeW91ICgrIFN0ZWZhbm8sIEp1bGllbiwgQmVydHJhbmQpIHRoaW5r
IGFib3V0IHRoZSBzcGxpdC4NCj4gDQo+IEkgZG9uJ3QgaGF2ZSBhIHN0cm9uZyBwcmVmZXJlbmNl
IG9uIGhvdyB0aGUgc3BsaXQgc2hvdWxkIGJlIGRvbmUuDQoNClRoZSBtYWludGFpbmVycyB3aWxs
IGRlY2lkZSwgYnV0IEkgZmVlbCB0aGF0IHdpdGggb3B0aW9uIDIsIHRoZXJlIHdpbGwgYmUsDQpp
biB0aGUgdHJlZSwgYSBzdGF0ZSB3aGVyZSB0aGUgZGVzaWduIGRlY2lzaW9uIHdvbuKAmXQgYmUg
ZnVsZmlsbGVkLCBzbw0Kd2l0aCBwYXRjaCAxIGFuZCAyIHdlIHdpbGwgaGF2ZSBwYXJ0aWFsIGVt
dWxhdGlvbiB1bmNvbmRpdGlvbmFsbHkuDQoNCkluc3RlYWQgd2l0aCBvcHRpb24gMSB3ZSB3aWxs
IGhhdmUgYWx3YXlzIGEgcHJvcGVyIHN0YXRlLCB3aGljaCB3aWxsDQpiZSBhcm02NCBjb25kaXRp
b25hbCBwYXJ0aWFsIGVtdWxhdGlvbiB3aXRoIHBhdGNoIDEgYW5kIGFybTMyIGNvbmRpdGlvbmFs
DQpwYXJ0aWFsIGVtdWxhdGlvbiB3aXRoIHBhdGNoIDIuDQoNCk1heWJlIG1haW50YWluZXJzIHdp
bGwgZGVjaWRlIGlmIHRoYXQgbWF0dGVycyBvciBub3QuDQoNCkNoZWVycywNCkx1Y2ENCg0K

