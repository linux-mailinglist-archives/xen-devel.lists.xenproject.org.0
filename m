Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A6561913
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 13:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358419.587617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6sIy-0004ol-JI; Thu, 30 Jun 2022 11:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358419.587617; Thu, 30 Jun 2022 11:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6sIy-0004m6-FE; Thu, 30 Jun 2022 11:25:52 +0000
Received: by outflank-mailman (input) for mailman id 358419;
 Thu, 30 Jun 2022 11:25:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Dt9=XF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o6sIw-0004m0-Rv
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 11:25:51 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10076.outbound.protection.outlook.com [40.107.1.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64359e21-f867-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 13:25:49 +0200 (CEST)
Received: from AS9PR04CA0164.eurprd04.prod.outlook.com (2603:10a6:20b:530::16)
 by AM4PR0802MB2274.eurprd08.prod.outlook.com (2603:10a6:200:64::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 11:25:39 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:530:cafe::1c) by AS9PR04CA0164.outlook.office365.com
 (2603:10a6:20b:530::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 30 Jun 2022 11:25:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 11:25:38 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Thu, 30 Jun 2022 11:25:38 +0000
Received: from 656c5815b905.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 765F273E-F4CD-48F0-9FE9-2041FFCB02A0.1; 
 Thu, 30 Jun 2022 11:25:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 656c5815b905.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Jun 2022 11:25:28 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB8PR08MB5049.eurprd08.prod.outlook.com (2603:10a6:10:ee::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 11:25:25 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%7]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 11:25:25 +0000
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
X-Inumbo-ID: 64359e21-f867-11ec-bdce-3d151da133c5
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fV+RD0mTyidwY0KNyEZ/5gIWwIOp37XXx9L9DhDqjicYAunW0/+7GEJdFZJypjNl6Nfe4z8fPjGefxyVYxgTVTt4GecVdg3CNyhoNOT1Mrz0WjTq90ctdUuMguI7hirr1lp7wLd2K101R8Y4O/TPNudbL6Lg1wsVnBgEmot8tgUNTxVbkf+kLEwzgiYmyFWYVedfeauuM97ep5G071+2z2Fdhrpjk/4Itiuffef5jqi1tMUQ7vgIQP/amnbwHYIyaWAJrdd1+jsV+4KsZ/BBQUU/j3/6l+QJL3vDwL0WVkU83FdXFCQgtYq4qB0Tr0xz/75a3RrofX2a3mBAAUMjbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7sulLYxdbe2qy8THT+F2713o+VbmhO9hgGZDbFgaso=;
 b=aaCbPLIQsHT1QV92kZuIcbpjmfIg30fzVp4HNj+4VQCB664ZojASZKxZNs7sBsIKXDiQs6zX++xxeftiXZiNp4tzQcSss0n6eUFQeSBV+r3CY+fVPtdD+25mWTkJtia8hlKhe6P1P0S4nZuPbdNcgO8+nFQha9kdQ5PaGr99SDxEOZSMNtal78UNvCtqhIn9IfzOwmiJA2lAnBPBV4trpC772ez5/nxeRzCQXVdI+VNC7l9DVKm3FJzPSOHBEJsjuyRdzU4By2X3b89QuAUey39uwzxpCA24RnX2Z5JAV0sZK0BC4Rx3KDzn43VxrChCJoozY5NzfvvQIcmUfa+1LQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7sulLYxdbe2qy8THT+F2713o+VbmhO9hgGZDbFgaso=;
 b=XduvIBaZPd214gUcuMI3TGQUgMPK1BPgdUyltewdm9DWwIPdd8sxpqzsX3PKopAZU2PH6M8nTWmyuXJXdf2WOaIsZDKuP9JbVuhueu3wdmK9QJJyTci+eoHlk5+scKJEOXLjbZJ0N9Pk3iQTeUcxAmm33tDWlFcj8OXThXG3+NA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOwwvLC1H5MkrTq/CXxjnt/mIKmYpSGE3au8c/1Tr6HkrN8E3wu60RFazVCFQ8ska/8/ekwpYmCviA0R+2Q1ssOW/4SLlMF18MOgAOdqz9b4szGd2T5nE+hoJkmk+aZRlz033kPhvKOLf5OpUXIkcyUUzuKz4HjnGhEuyzXyTMb72UmV/QmvX5+WRraXcBEzBfXv0Kjz4g9i0Wi8wNtsA/EQNbpE00FTylX/aFcMXN4CK1OXZ4F9STrFDGyk2li7ZdsParr/Mlw6KrFRgKAcR3iHgcyoxeNKFlC5/3YR7pJQpDdQS75Khi2B5Yd2jcSbHpeUk3/RMwh2qi3r0Xg1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7sulLYxdbe2qy8THT+F2713o+VbmhO9hgGZDbFgaso=;
 b=jlr0ltmVZ3UccUpYJDnupMqP6xzbMhL+S1n+znaKuVqDKioFFdERHdB7ryEDmpWxbAAKw4+NAa4Rv5UhxWq4dA3AoSI7j9sqQuwpKJH+6I57/hRGf2en2L6CacJdiRSpyXm6xO6DUAOjGJHTTgXIyPTaXrfw+2lgIoafEmumfg6ksv7SK2qkRCU2GMuVORB9rpQb8EdIZg+JePORzrchP6ZYjk5Dezp5zJpBZUTgFBHPdvu2n8x0JUw4yaOcdWDUSk+e1uhvDI/+40k+St1uWLD3KPaxYhYBnrcCzRDFvDsl/kQTMdm0CK3E3CPimCCCApxkbLXQEU/505VXUgZfzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7sulLYxdbe2qy8THT+F2713o+VbmhO9hgGZDbFgaso=;
 b=XduvIBaZPd214gUcuMI3TGQUgMPK1BPgdUyltewdm9DWwIPdd8sxpqzsX3PKopAZU2PH6M8nTWmyuXJXdf2WOaIsZDKuP9JbVuhueu3wdmK9QJJyTci+eoHlk5+scKJEOXLjbZJ0N9Pk3iQTeUcxAmm33tDWlFcj8OXThXG3+NA=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Topic: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Index:
 AQHYfI531SRNO5A+8Ei3iOFoJrK02K1dB3iAgAE0OjCAABXrgIAAECwAgAAEoICAAARlgIAAAO0AgAmAA0A=
Date: Thu, 30 Jun 2022 11:25:25 +0000
Message-ID:
 <PAXPR08MB7420AD8092F0FBA43C359DD19EBA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
 <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
 <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
 <6e91d7d0-78d2-2eec-3b14-9aea00b2a028@suse.com>
 <bad83568-94c6-6d90-308b-ae9965f54754@suse.com>
In-Reply-To: <bad83568-94c6-6d90-308b-ae9965f54754@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0A3B52357D6C6345BCAA9EF61D942FFA.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e52ff7b6-484d-4795-2382-08da5a8b4267
x-ms-traffictypediagnostic:
	DB8PR08MB5049:EE_|AM5EUR03FT004:EE_|AM4PR0802MB2274:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tataLh8S8tMOnnIfJLgmdWw4ncJRkBt5X6u5Bw+ltztkUPVhRe67WZsz/0KhJusVVD0qjaK0nE3/gY0eOyPV37ze616gGwk86VlKpz130CUA3VdaSMLH5tzWrG5eaKQ62i1qA9k4PSmZwUdZq9pzaJti8RGeYNi9Ji+Y/Cv8SL7BkKN1GnTkFF2tgXOdqQQEmF9/hLV4iDsrki9eXL56tIs25HCjASNWGqXVnSpaoQbhJPUMMcOs0JtYyruaa31s0gTUb0FMIYMLEehUTB6qpZreel61kmVSk6SLjPNHo6K4ehx2YfQOTJw5vbjvRDl4ittR1sg9aVA9WIFzZxZt4dRhY7NkkEfQ25pWX+uEDdn4aQBOHF8oJH3bCzGny1MMoZgn5N0cnnzQ4/n+yUhzXQ7tKpJZIQvD4hTdk8o4E6UhGjCIRcN5D9Bn23wAGRg32nqLwUyG+aYn/UV1KGQAHHj3vz1Lc6NJm9j00+UMMOb5+DrNUubi8FslsYla+l3465Yy6W5X5ZG4gcmL/pfY5FT1v5VeUww8FYc6pzxpWrqf4F1v1ZgbRrYvz+ndumt9AKJMetySkG0NLtsfNQWI8HHLfy+MPC2fKDLDAYoQlvolKdyo3rwwY5BoBSzro3Qvbb5LNf+0bagyQz0VN3xTL603yB55kVB7PHQEOjVqdZmcOIBLrq+wF8myci6DbSS2KtEBeegw2SmKDikuP60kTIAJAMpqWvJx0/g5YhVGXj84Vs1UmQTaslp9T6L/ntDfuPEJALpdfusOHTCzDM/AoPPWCqhRcXWzqeKt63UJ+L4BsrjaMdixbqaL1vGIx0Ii
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(6506007)(41300700001)(478600001)(4326008)(186003)(26005)(9686003)(7696005)(38070700005)(53546011)(38100700002)(83380400001)(122000001)(66446008)(33656002)(55016003)(54906003)(316002)(5660300002)(86362001)(66946007)(8676002)(2906002)(110136005)(71200400001)(66476007)(66556008)(64756008)(76116006)(8936002)(52536014);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5049
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4473a348-4aab-453d-30bc-08da5a8b3a50
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s0qi+Mf7KhsdCrpNEXQkSZ56bspzZFzvjoO3s5S9yiGOxScMXZ4duhmREzmRMD3t3C5GSOYOg6kjJYGzUwHwY0LVRKCgfFoO9WfHruU7uBqUSjkFTyfk6IrwQmP9Qm0sVUYoWomBH2xyJE2gx/OQ+9+l8ucQXf8e6YyVGO280s1pB8yUY8janz4hnueZECBvAANz8nhHRWb8Haykj2PrPsnRaZuMOZVDn4FgSwJ6u7gF9xC6odtDqeKhh9JqtrqyT0kp4V5cOkIoD5A2Vt27bXJCpGk2esczGIFNPjd34TPke/BBOYskUDaxQHWYCXjGkEPhNfGo6oTADmQrulZJ0Tr3pF1PyTtsMFvCr/wR7UNjU3gHwiNSTq//EDAHQU3erkD2Z56JSOSzLiX3J5qPFesHpzctKPuGFPv3bbTCaWSKaUxr8TDU2GsIWzzLIHhHoQ5C2lgGzAkQ1NwoZX6Tem5Coc8mJZKL0PtAK4C6wQ9gdbeEomd9vmsb5xKQFQmtJIoMy2gN8X+Lk50qexCwGSH0xGMb69FrIBYgKQ/OFzDqMJynTnHhy8p3oTWWGchCSEyIQ3fswG8jW65dNn8aOZ3xQA4raP3l/2OoD2DTrtCorlB4uLIKvfjyT71AYWnNvF3AipG+ltP2KEOI+zCf/+NURVQVrURCMKAxNmS3VlN2/wBkQ8mKX6hu0M1OzRgLLeEWJboE8wt+u90qvhWG/UQ3wjMneuPxG8MoN6JVox0mb8FPbkISvSw5QxlKl5XXyNVi9b+sLgb/inS+s9gQkh0Irn6Q2gneCdZlBGQPAwmHC+Ycn6hYt5zLvPCeHVCK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966006)(36840700001)(40470700004)(40460700003)(478600001)(41300700001)(86362001)(82310400005)(70206006)(33656002)(82740400003)(356005)(26005)(70586007)(316002)(110136005)(4326008)(54906003)(81166007)(55016003)(8676002)(36860700001)(7696005)(47076005)(336012)(186003)(53546011)(5660300002)(2906002)(52536014)(6506007)(40480700001)(8936002)(83380400001)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 11:25:38.6574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e52ff7b6-484d-4795-2382-08da5a8b4267
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2274

SGkgSnVsaWVuIGFuZCBKYW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiAyMDIy5bm0NuaciDI0
5pelIDE4OjA5DQo+IFRvOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBDYzogbmQg
PG5kQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyBCZXJ0cmFuZA0KPiBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlt
eXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsNCj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmlhbWVpIFhpZQ0KPiA8Smlh
bWVpLlhpZUBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBXZWkgQ2hl
bg0KPiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAxLzhdIHhl
bjogcmV1c2UgeDg2IEVGSSBzdHViIGZ1bmN0aW9ucyBmb3IgQXJtDQo+IA0KPiBPbiAyNC4wNi4y
MDIyIDEyOjA1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiBPbiAyNC4wNi4yMDIyIDExOjQ5LCBK
dWxpZW4gR3JhbGwgd3JvdGU6DQo+ID4+IEhpIEphbiwNCj4gPj4NCj4NCj4gPj4+Pj4+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vZWZpL01ha2VmaWxlDQo+ID4+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJt
L2VmaS9NYWtlZmlsZQ0KPiA+Pj4+Pj4+IEBAIC0xLDQgKzEsMTIgQEANCj4gPj4+Pj4+PiAgICBp
bmNsdWRlICQoc3JjdHJlZSkvY29tbW9uL2VmaS9lZmktY29tbW9uLm1rDQo+ID4+Pj4+Pj4NCj4g
Pj4+Pj4+PiAraWZlcSAoJChDT05GSUdfQVJNX0VGSSkseSkNCj4gPj4+Pj4+PiAgICBvYmoteSAr
PSAkKEVGSU9CSi15KQ0KPiA+Pj4+Pj4+ICAgIG9iai0kKENPTkZJR19BQ1BJKSArPSAgZWZpLWRv
bTAuaW5pdC5vDQo+ID4+Pj4+Pj4gK2Vsc2UNCj4gPj4+Pj4+PiArIyBBZGQgc3R1Yi5vIHRvIEVG
SU9CSi15IHRvIHJlLXVzZSB0aGUgY2xlYW4tZmlsZXMgaW4NCj4gPj4+Pj4+PiArIyBlZmktY29t
bW9uLm1rLiBPdGhlcndpc2UgdGhlIGxpbmsgb2Ygc3R1Yi5jIGluIGFybS9lZmkNCj4gPj4+Pj4+
PiArIyB3aWxsIG5vdCBiZSBjbGVhbmVkIGluICJtYWtlIGNsZWFuIi4NCj4gPj4+Pj4+PiArRUZJ
T0JKLXkgKz0gc3R1Yi5vDQo+ID4+Pj4+Pj4gK29iai15ICs9IHN0dWIubw0KPiA+Pj4+Pj4+ICtl
bmRpZg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IFRoaXMgaGFzIGNhdXNlZA0KPiA+Pj4+Pj4NCj4gPj4+
Pj4+IGxkOiB3YXJuaW5nOiBhcmNoL2FybS9lZmkvYnVpbHRfaW4ubyB1c2VzIDItYnl0ZSB3Y2hh
cl90IHlldCB0aGUNCj4gb3V0cHV0IGlzDQo+ID4+Pj4+PiB0byB1c2UgNC1ieXRlIHdjaGFyX3Q7
IHVzZSBvZiB3Y2hhcl90IHZhbHVlcyBhY3Jvc3Mgb2JqZWN0cyBtYXkNCj4gZmFpbA0KPiA+Pj4+
Pj4NCj4gPj4+Pj4+IGZvciB0aGUgMzItYml0IEFybSBidWlsZCB0aGF0IEkga2VlcCBkb2luZyBl
dmVyeSBvbmNlIGluIGEgd2hpbGUsDQo+IHdpdGgNCj4gPj4+Pj4+IChpZiBpdCBtYXR0ZXJzKSBH
TlUgbGQgMi4zOC4gSSBndWVzcyB5b3Ugd2lsbCB3YW50IHRvIGNvbnNpZGVyDQo+IGJ1aWxkaW5n
DQo+ID4+Pj4+PiBhbGwgb2YgWGVuIHdpdGggLWZzaG9ydC13Y2hhciwgb3IgdG8gYXZvaWQgYnVp
bGRpbmcgc3R1Yi5jIHdpdGgNCj4gdGhhdA0KPiA+Pj4+Pj4gb3B0aW9uLg0KPiA+Pj4+Pj4NCj4g
Pj4+Pj4NCj4gPj4+Pj4gVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dC4gSSB3aWxsIHRyeSB0
byB1c2UgLWZzaG9ydC13Y2hhciBmb3INCj4gQXJtMzIsDQo+ID4+Pj4+IGlmIEFybSBtYWludGFp
bmVycyBhZ3JlZS4NCj4gPj4+Pg0KPiA+Pj4+IExvb2tpbmcgYXQgdGhlIGNvZGUgd2UgZG9uJ3Qg
c2VlbSB0byBidWlsZCBYZW4gYXJtNjQgd2l0aCAtZnNob3J0LQ0KPiB3Y2hhcg0KPiA+Pj4+IChh
c2lkZSB0aGUgRUZJIGZpbGVzKS4gU28gaXQgaXMgbm90IGVudGlyZWx5IGNsZWFyIHdoeSB3ZSB3
b3VsZCB3YW50DQo+IHRvDQo+ID4+Pj4gdXNlIC1mc2hvcnQtd2NoYXIgZm9yIGFybTMyLg0KPiA+
Pj4NCj4gPj4+IFdlIGRvbid0IHVzZSB3Y2hhcl90IG91dHNpZGUgb2YgRUZJIGNvZGUgYWZhaWN0
LiBIZW5jZSB0byBhbGwgb3RoZXINCj4gY29kZQ0KPiA+Pj4gaXQgc2hvdWxkIGJlIGJlbmlnbiB3
aGV0aGVyIC1mc2hvcnQtd2NoYXIgaXMgaW4gdXNlLiBTbyB0aGUgc3VnZ2VzdGlvbg0KPiA+Pj4g
dG8gdXNlIHRoZSBmbGFnIHVuaWxhdGVyYWxseSBvbiBBcm0zMiBpcyByZWFsbHkganVzdCB0byBz
aWxlbmNlIHRoZSBsZA0KPiA+Pj4gd2FybmluZzsNCj4gPj4NCj4gPj4gT2suIFRoaXMgaXMgb2Rk
LiBXaHkgd291bGQgbGQgd2FybiBvbiBhcm0zMiBidXQgbm90IG90aGVyIGFyY2g/DQo+ID4NCj4g
PiBBcm0zMiBlbWJlZHMgQUJJIGluZm9ybWF0aW9uIGluIGEgbm90ZSBzZWN0aW9uIGluIGVhY2gg
b2JqZWN0IGZpbGUuDQo+IA0KPiBPciBhIG5vdGUtbGlrZSBvbmUgKGp1c3QgdG8gYXZvaWQgcG9z
c2libGUgY29uZnVzaW9uKTsgSSB0aGluayBpdCdzDQo+ICIuQVJNLmF0dHJpYnV0ZXMiLg0KPiAN
Cj4gSmFuDQo+IA0KPiA+IFRoZSBtaXNtYXRjaCBvZiB0aGUgd2NoYXJfdCBwYXJ0IG9mIHRoaXMg
aW5mb3JtYXRpb24gaXMgd2hhdCBjYXVzZXMNCj4gPiBsZCB0byBlbWl0IHRoZSB3YXJuaW5nLg0K
PiA+DQo+ID4+PiBvZmYgdGhlIHRvcCBvZiBteSBoZWFkIEkgY2FuJ3Qgc2VlIGFueXRoaW5nIHdy
b25nIHdpdGggdXNpbmcNCj4gPj4+IHRoZSBvcHRpb24gYWxzbyBmb3IgQXJtNjQgb3IgZXZlbiBn
bG9iYWxseS4gWWV0IG90b2ggd2UgdHlwaWNhbGx5IHRyeQ0KPiB0bw0KPiA+Pj4gbm90IG1ha2Ug
Y2hhbmdlcyBmb3IgZW52aXJvbm1lbnRzIHdoZXJlIHRoZXkgYXJlbid0IHJlYWxseSBuZWVkZWQu
DQo+ID4+DQo+ID4+IEkgYWdyZWUuIElmIHdlIG5lZWQgYSB3b3JrYXJvdW5kLCB0aGVuIG15IHBy
ZWZlcmVuY2Ugd291bGQgYmUgdG8gbm90DQo+ID4+IGJ1aWxkIHN0dWIuYyB3aXRoIC1mc2hvcnQt
d2NoYXIuDQo+ID4NCj4gPiBUaGlzIHdvdWxkIG5lZWQgdG8gYmUgYW4gQXJtLXNwZWNpYWwgdGhl
biwgYXMgb24geDg2IGl0IG5lZWRzIHRvIGJlDQo+IGJ1aWx0DQo+ID4gdGhpcyB3YXkuDQoNCkkg
aGF2ZSB0YWtlbiBhIGxvb2sgaW50byB0aGlzIHdhcm5pbmc6DQpUaGlzIGlzIGJlY2F1c2UgdGhl
ICItZnNob3J0LXdjaGFyIiBmbGFnIGNhdXNlcyBHQ0MgdG8gZ2VuZXJhdGUNCmNvZGUgdGhhdCBp
cyBub3QgYmluYXJ5IGNvbXBhdGlibGUgd2l0aCBjb2RlIGdlbmVyYXRlZCB3aXRob3V0DQp0aGF0
IGZsYWcuIFdoeSB0aGlzIHdhcm5pbmcgaGFzbid0IGJlZW4gdHJpZ2dlcmVkIGluIEFybTY0IGlz
DQpiZWNhdXNlIHdlIGRvbid0IHVzZSBhbnkgd2NoYXIgaW4gQXJtNjQgY29kZXMuIFdlIGFyZSBh
bHNvIG5vdA0KdXNpbmcgd2NoYXIgaW4gQXJtMzIgY29kZXMsIGJ1dCBBcm0zMiB3aWxsIGVtYmVk
IEFCSSBpbmZvcm1hdGlvbg0KaW4gIi5BUk0uYXR0cmlidXRlcyIgc2VjdGlvbi4gVGhpcyBzZWN0
aW9uIHN0b3JlcyBzb21lIG9iamVjdA0KZmlsZSBhdHRyaWJ1dGVzLCBsaWtlIEFCSSB2ZXJzaW9u
LCBDUFUgYXJjaCBhbmQgZXRjLiBBbmQgd2NoYXINCnNpemUgaXMgZGVzY3JpYmVkIGluIHRoaXMg
c2VjdGlvbiBieSAiVGFnX0FCSV9QQ1Nfd2NoYXJfdCIgdG9vLg0KVGFnX0FCSV9QQ1Nfd2NoYXJf
dCBpcyAyIGZvciBvYmplY3QgZmlsZXMgd2l0aCAiLWZzaG9ydC13Y2hhciIsDQpidXQgZm9yIG9i
amVjdCBmaWxlcyB3aXRob3V0ICItZnNob3J0LXdjaGFyIiBpcyA0LiBBcm0zMiBHQ0MNCmxkIHdp
bGwgY2hlY2sgdGhpcyB0YWcsIGFuZCB0aHJvdyBhYm92ZSB3YXJuaW5nIHdoZW4gaXQgZmluZHMN
CnRoZSBvYmplY3QgZmlsZXMgaGF2ZSBkaWZmZXJlbnQgVGFnX0FCSV9QQ1Nfd2NoYXJfdCB2YWx1
ZXMuDQoNCkFzIGdudS1lZmktMy4wIHVzZSB0aGUgR0NDIG9wdGlvbiAiLWZzaG9ydC13Y2hhciIg
dG8gZm9yY2Ugd2NoYXINCnRvIHVzZSBzaG9ydCBpbnRlZ2VycyAoMiBieXRlcykgaW5zdGVhZCBv
ZiBpbnRlZ2VycyAoNCBieXRlcykuDQpXZSBjYW4ndCByZW1vdmUgdGhpcyBvcHRpb24gZnJvbSB4
ODYgYW5kIEFybTY0LCBiZWNhdXNlIHRoZXkgbmVlZA0KdG8gaW50ZXJhY3Qgd2l0aCBFRkkgZmly
bXdhcmUuIFNvIEkgaGF2ZSB0byBvcHRpb25zOg0KMS4gUmVtb3ZlICItZnNob3J0LXdjaGFyIiBm
cm9tIGVmaS1jb21tb24ubWsgYW5kIGFkZCBpdCBiYWNrIGJ5DQogICB4ODYgYW5kIGFybTY0J3Mg
RUZJIE1ha2VmaWxlDQoyLiBBZGQgIi1uby13Y2hhci1zaXplLXdhcm5pbmciIHRvIEFybTMyJ3Mg
bGlua2VyIGZsYWdzDQoNCkkgcGVyc29uYWxseSBwcmVmZXIgb3B0aW9uIzEsIGJlY2F1c2UgQXJt
MzIgZG9lc24ndCBuZWVkIHRvIGludGVyYWN0DQp3aXRoIEVGSSBmaXJtd2FyZSwgYWxsIGl0IHJl
cXVpcmVzIGFyZSBzb21lIHN0dWIgZnVuY3Rpb25zLiBBbmQNCiItbm8td2NoYXItc2l6ZS13YXJu
aW5nIiBtYXkgaGlkZSBzb21lIHdhcm5pbmdzIHdlIHNob3VsZCBhd2FyZSBpbg0KZnV0dXJlLg0K
DQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQo+ID4NCj4gPiBKYW4NCj4gPg0KDQo=

