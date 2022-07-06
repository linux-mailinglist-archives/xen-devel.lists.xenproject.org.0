Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DC656838A
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 11:36:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362062.591932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o91S3-0004bH-OZ; Wed, 06 Jul 2022 09:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362062.591932; Wed, 06 Jul 2022 09:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o91S3-0004ZT-Kf; Wed, 06 Jul 2022 09:36:07 +0000
Received: by outflank-mailman (input) for mailman id 362062;
 Wed, 06 Jul 2022 09:36:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o91S2-0004ZN-9w
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 09:36:06 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10083.outbound.protection.outlook.com [40.107.1.83])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e5190b7-fd0f-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 11:36:05 +0200 (CEST)
Received: from AM6P191CA0045.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::22)
 by AM8PR08MB5650.eurprd08.prod.outlook.com (2603:10a6:20b:1d3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 09:36:02 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::21) by AM6P191CA0045.outlook.office365.com
 (2603:10a6:209:7f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 09:36:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 09:36:01 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Wed, 06 Jul 2022 09:36:01 +0000
Received: from bd47dad8d79b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ECBDA9B6-A812-4D98-8161-1740A2C1C4EC.1; 
 Wed, 06 Jul 2022 09:35:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd47dad8d79b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 09:35:55 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB7251.eurprd08.prod.outlook.com (2603:10a6:20b:342::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 09:35:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 09:35:54 +0000
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
X-Inumbo-ID: 0e5190b7-fd0f-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NEUURPcllllkfJTgehoRXSssmNSkElLAfrCT1MgHGWYAlOz05ylF5nuw1UxGvxxOHKKIRCCm5wezPfHcm9EAWMaLMFZoXGspyMalLTU4KIDQJUxXZJuZpcMoog8pOsRJndS3D02V0JbmLVQUnLq8LrTOcnl3l+FcHP/rKFrxN0cltQ+qAUygFpKLDAhkUQHXk0jA6kGYxYQdDgr7Pqgg7I3eIK0c9s5UtN6SqWQknxG2TgzjF6peV7bxUH6LnwyS6aZwD3Oz+Rg3J1i6T03dNhdgP7Sxdu5MCMxd04A4FtS/pQ5LF/mSCjDncU10teqhGbuZGC/2DYNOnEqutz9CNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P5H9mviKLgVgThjr6sBpWT7u2I0flykxD933JykIOo=;
 b=ACXivyDJF6lYaZXxIzIyEPUMqcsOpc5WH9L6QILB5p64Q70bNtQuGCOes900N21ndkjz2Q/CH0A00IZ2PhWnBmOYo1FRaPanLl8fLkGQBvuYmV8Hr9/eY0ApU/dRDg1HxtYGtdm+aflzEzeNKkW0Zwa0uhIcGbfbjtUzUZYokEegJq3miqW2zvr4SWcVtwbhTlrvXXnDqnJpMzvj+fMOt19VCjpWwOF+7O1MrAMZpTSjJz4sgx1b6LDsTHpEYsSGH9Wm3UprbMf1ZPCtE5MuUJdlrQLGV70240FKu72tDJk5FudJtbidv1aNHOqrMyutpDXBDM+ICI8ZZ3qA79vXbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P5H9mviKLgVgThjr6sBpWT7u2I0flykxD933JykIOo=;
 b=D+5/YCBtguQ/ufSLg0BNzb5oMiwqFVnyyGOpjp+aVFe1gD2CTUErwy0DXSsw2Pcq4lMQj33t7PbUUXrHn1VHysD9JoAUDa6eduzjx8owK+l+IRvLx569fV9bPrD/RYwPRCKWzNyi0TCI4hYlFZMSW6zWVGAZ/xLG9EGtbAzovEE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcjZXJN7uxCPiJ0Hx91nNhtmVFTk8RTVkDCCFUswz+b1kLrto9sGMERITlXMKmLhircrc8xyr2qD0jFxOq6WbKN51seJlea5tL6MwsaB0gtZQYOwxhUN5X/C9FsIbVHLnwmZ50CWkeI27RW8iYHAzSNA0IYFwsR1P8twxjfAEMXCuW2PGPBF6MEFjbI1SLs922Ie0dW682EO3278I8CgEXCt288yaZFYsyU5vHYpd5ZxCbmzzHUTWFh+kUfvOnetc4nwTVS7VNt09A/aobMzb/4DGtmj8JDJe0bJtT3h2VIuXhVcNCF4E6qOc+fPwhme0+oOCIisXCy/mzkEYovkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P5H9mviKLgVgThjr6sBpWT7u2I0flykxD933JykIOo=;
 b=A8HQOlvsg6FhYpAM2AOJSLKk4UU+0wntbMJDigyguiRM/u3rAdqkvZ80mWUcHCS+algueI6PJvMITyEWXWgFehxSmb3VRM+dDips4fUBlC5CfaGIhnFWoJgdPayeOY3hkpVIUkl3jUx4Y1g9IE+n1T1jgSD1lVRH30D8CcHA0mZnQYzk9xUxjrID9aLN+9D2u9NfWDJqKTYFX5DVmcDsXplZt5cokbhZJE0S1vPRKM7S7XcKSzNOKB886WJ5QSeQ/O+93X+mE3B+KBhu5lJscyV/KHneI/U1ZuchudV/FFZgdnup2mcg7AW6YuCBezNewQbUfdBU8fAeCzdQ/cV4dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P5H9mviKLgVgThjr6sBpWT7u2I0flykxD933JykIOo=;
 b=D+5/YCBtguQ/ufSLg0BNzb5oMiwqFVnyyGOpjp+aVFe1gD2CTUErwy0DXSsw2Pcq4lMQj33t7PbUUXrHn1VHysD9JoAUDa6eduzjx8owK+l+IRvLx569fV9bPrD/RYwPRCKWzNyi0TCI4hYlFZMSW6zWVGAZ/xLG9EGtbAzovEE=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "christopher.w.clark@gmail.com"
	<christopher.w.clark@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Dario Faggioli
	<dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 0/9] xen: drop hypercall function tables
Thread-Topic: [PATCH v6 0/9] xen: drop hypercall function tables
Thread-Index: AQHYP4flEN1TZgxxxkSZpjQ9KWhqIa1xiooggAAjX4CAAAmFgA==
Date: Wed, 6 Jul 2022 09:35:53 +0000
Message-ID:
 <AS8PR08MB79918E0AF931C38E5972F30C92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220324140139.5899-1-jgross@suse.com>
 <AS8PR08MB79919E80E3D321527A4BE91F92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <f5a66b05-7f8e-7219-1aa3-fdd704133cad@suse.com>
In-Reply-To: <f5a66b05-7f8e-7219-1aa3-fdd704133cad@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EAE55572CA91B2478B8847F322806A0E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b5e5f64c-d9ce-4a04-2300-08da5f32f0d2
x-ms-traffictypediagnostic:
	AS8PR08MB7251:EE_|AM5EUR03FT007:EE_|AM8PR08MB5650:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GmJOBkbPUj5YNYF90pZ0sxbtFiQJ8BTxHkGlWszPnCfjPXlHZMYbHavt/Pdi11kGNrbFsG0CjgxjQlObIVIRdUTQVdMdt/QSg9HWo2DwTw6mllWvh/bofcq+wiFKV4RNcwx6zIB0xzVcvPLgBNbbJs9XIteQi2qzXldXD3+/uHituQyR3O5kp4B0FqH8eayd3VF9jQqSGFtkR+5Pd0YBoJa/WB2K/q1UPOkjAfPGSowSrrBygEdtqsY4LXgJJ1hEcq1iDe6xyHV4v2QsrLvPzWDJedAf0qvXDg7qvt9hgW609Ctv08dU8LuPLv5FkY66zADQi/r/W16sO+u24+nIjFHIOZJR3ct1hEYNL6QBn7f/A8UBrRHkAeqxSoNLt/X0Xi7ZUS7/wbe+YpeSU7iqZitTeqqtvuD7XHUnV1oF+Mwbsci1zaHY4zklsy11O4IIOsw7PLUR6+CZt1X3BG1r4xxthHP51vYJ8pNf2LeXXDEKKYMJllHA9egYGZVoxN6uVWSePZLhOB1qOw1NsbIfX9gpjgsWc+Un0WTMDaXgsFVVPZd7yIXBmLFWIl6foGyRoNHjEqotKC+tVRYTHV/CEEwyHOzEuoG74xLilp7Ln1fxJgmtM0/0CHm34VHMyXbjzOO5fcJMVmbCuQH1qsHNL7zFV7MeDCetOft50GL0+Kf7HuBGzOQMTlurpHpPi+W/OnMyNoVFcIxMM5ud68ra0yLlFmC/5G5ZkVsVo0wOhuTbS+Ilbunb/n7jNJbMfGFrnJBByI+Q2PyB/epN9Kp7ZPXMOm5DX3C5TtW/nGFopBY7piDVpTBLNlP2/S3LYpUk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(38100700002)(122000001)(2906002)(38070700005)(478600001)(54906003)(186003)(83380400001)(66574015)(7416002)(5660300002)(4744005)(33656002)(52536014)(8936002)(66556008)(66476007)(71200400001)(41300700001)(55016003)(86362001)(53546011)(6506007)(66946007)(8676002)(4326008)(64756008)(7696005)(76116006)(316002)(26005)(66446008)(110136005)(9686003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7251
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	125893ac-436c-468f-bae1-08da5f32ebf6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Xzo9GejShu3PPJmbPrsLkowq+mqFvoeuI5V5Lgk012SP4IJOECjpeuJStAOHrM+DWqa5XHtxqQlij+OOGe6OP0L2dBBdnlc96hNHxH3qlDsS6WzDS1MJ5lnayALtNaq5aRumNsIDwgjF+Cc1xAuaqKuwCEtBA3r35pljy1ssH9iUX1oIJy/HXp7uteJ0tCxckLCN6ET94sDmu/7YzXqDM9xqoDrlK/wAcvBAKfEJiUW1QPXqGi/+8KeHHDj1/4RT5+BNLrEB0+ADkWhGdSDeR7729PPyKK0xfZ8gstIqu3KXPIyPnBz5GbLljPjPS9uTfL/8eFfVD97wSOIrxgqEgBWoLyxs+BMSIan3oZ9U0lVi812LFFi62G/UlQzLyHInIJYYyV0AX1qWc0H9/GeARf+ECoqMiWzM1oQNGaBXanzbm7ckPY+SFESgqQ+ZpnlWh/OJcdYj1l9j9yoGfw/fjNIjEXE0xborTIoeFO4g11xNcW8L1ITNtEoWu3NQf+rEduTEhBC6kjhQKezDpkqAWtmKZrlcsmL20dQ6YUz/JsdJeK5jYURbtESYbkpBPsmU75u1qltUXtopcY5H62ZvC+1UjvIh3SB5jdFk0c/ddIIB3GCUJ87T4SamfzuHbZPaErUOJ8gRlWljuWhCWwyj5MvT6l5xhVT+4AeqvwGc/+VsAB+zByDOyTanLXj8Vjqxmvmf9C6l+rvNFn1OngIQOxx+HcLye3o5PvAt/BTzyz8/28zy6O0eX6wza+ips/m5n5+ZtIabWq6conwRHIhgknlJwR200xJvgTRVU0349s+0FMhszjK1leJxscdYgrXg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(376002)(39860400002)(40470700004)(36840700001)(46966006)(26005)(186003)(82740400003)(6506007)(7696005)(356005)(54906003)(5660300002)(9686003)(4326008)(8676002)(66574015)(47076005)(70206006)(70586007)(8936002)(41300700001)(316002)(33656002)(336012)(52536014)(83380400001)(36860700001)(110136005)(4744005)(40480700001)(81166007)(82310400005)(53546011)(55016003)(2906002)(86362001)(478600001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 09:36:01.9028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e5f64c-d9ce-4a04-2300-08da5f32f0d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5650

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwLzldIHhl
bjogZHJvcCBoeXBlcmNhbGwgZnVuY3Rpb24gdGFibGVzDQo+IA0KPiBPbiAwNi4wNy4yMDIyIDA5
OjMwLCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+IEl0IHNlZW1zIHRoYXQgdGhpcyBzZXJpZXMgaGFz
IGJlZW4gc3RhbGUgZm9yIG1vcmUgdGhhbiAzIG1vbnRocywgd2l0aDoNCj4gPg0KPiA+IFBhdGNo
ICMxIG1lcmdlZC4NCj4gPiBQYXRjaCAjMiBuZWVkIGZlZWRiYWNrIHJlZ2FyZGluZyB0aGUga2V4
ZWMgYW5kIGFyZ28gY2hhbmdlcy4NCj4gPiBQYXRjaCAjMyAjNCAjNSAjNiAjNyAjOCAjOSByZXZp
ZXdlZC9hY2tlZC4NCj4gPg0KPiA+IFNvIHNlbmRpbmcgdGhpcyBhcyBhIGdlbnRsZSByZW1pbmRl
ciBmb3Iga2V4ZWMgYW5kIGFyZ28gbWFpbnRhaW5lcnMuDQo+IA0KPiBQYXRjaCAzIHdhcyBhbHNv
IG1lcmdlZC4gUGF0Y2ggMiBhbmQgNCBpbmRlZWQgb25seSB3YWl0IGZvciBzYWlkIGFja3MuDQo+
IFBhdGNoZXMgNSBhbmQgb253YXJkcyBhcmUgcGVuZGluZyBhIGNsYXJpZmljYXRpb24gYnkgQW5k
cmV3IGFzIHRvDQo+IHBlcmZvcm1hbmNlIGNvbmNlcm5zIGhlIGhhZCB2b2ljZWQuIErDvHJnZW4g
ZGlkIHNlbmQgYSBudW1iZXIgb2YgcGluZ3MsDQo+IHdpdGggbm8gcmVzdWx0IGF0IGFsbC4NCg0K
VGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24sIGxldCBtZSBqdXN0IHB1dCBBbmRyZXcgKGZvciBr
ZXhlYyBhbmQgUGF0Y2ggZnJvbQ0KIzUpIGFuZCBDaHJpc3RvcGhlciAoZm9yIGFyZ28pIGluIHRo
ZSBUTzogbGlzdCB0byBzZWUgaWYgdGhleSBjYW4gcmVjZWl2ZSB0aGUgcGluZy4NCg0KS2luZCBy
ZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSmFuDQo=

