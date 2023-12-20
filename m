Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B0819B6A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:30:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657527.1026425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsuB-0001sU-1I; Wed, 20 Dec 2023 09:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657527.1026425; Wed, 20 Dec 2023 09:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsuA-0001py-Ub; Wed, 20 Dec 2023 09:30:18 +0000
Received: by outflank-mailman (input) for mailman id 657527;
 Wed, 20 Dec 2023 09:30:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KgnP=H7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rFsu9-0001pq-W6
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:30:18 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 619db1fe-9f1a-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 10:30:15 +0100 (CET)
Received: from AS9PR06CA0246.eurprd06.prod.outlook.com (2603:10a6:20b:45f::12)
 by PAWPR08MB10307.eurprd08.prod.outlook.com (2603:10a6:102:366::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 09:30:12 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:20b:45f:cafe::75) by AS9PR06CA0246.outlook.office365.com
 (2603:10a6:20b:45f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Wed, 20 Dec 2023 09:30:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 09:30:11 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Wed, 20 Dec 2023 09:30:11 +0000
Received: from 34d8a92643b6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 934F9109-80C2-4F14-AA8E-87D2891B15BF.1; 
 Wed, 20 Dec 2023 09:30:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34d8a92643b6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Dec 2023 09:30:05 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by DB9PR08MB7819.eurprd08.prod.outlook.com (2603:10a6:10:39b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 09:30:00 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e%3]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 09:30:00 +0000
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
X-Inumbo-ID: 619db1fe-9f1a-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RhuKT13MnyVRvlf/61hbiy0WVDSpGRP7os5GSiAMSK2fxZgEE3rpe4RP2aeEt8wiNJ2doxEJ8s/AvkgcFCMYWbZcym+XmkP28q3sQrMKBw8vfOOqQG3YUiqPq839p4av+cWYWSUk+RGO+XK9pz0ZCNRBejr2gNL51UAd8jgpVPljokM8hDVELbXXvn62QILYnGo/LKZVfOs2piCUo/sY+61Njmr/n+ErThzyu98eNbZfmfXvOhMk/M3jjhT840qpXJzG2rLrfIIeeZg5Syxzh0/eXfSkSdR4eshGKCEzae2QY3IEtswtxjt1O/SElJDBhkpiDsbiiFDSL+tDQmFRKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvV4NR333hxmhIldWvS3gLq5krbNLgCsA1APYtzXxig=;
 b=cwSpyW2Wu6wWXqJF+lNpyCjyE16UiuOQz4zkbCwRy6z4EPCcnf6f39G9kOpgm+m5s1b0pvS/S0w9Ks+bK4GnWK/911jxlQZLkTZTmhLzvhIgPWD0cQEB5Sky3GghtgYrJVXiKS4ceuZ4ljlaL8WbYkAl/T/459wYtvDeg4o8U12cjcFQXJjEY+W000VoY/Wem/qXX+JelVmFTESGNbLZ3RLnkw51u3a2raFZfcWl8XwbmO3AGE1+HGTQwR41Aos+R1pPvq1qyZZhS3+iVt/tDXD9HlOLlUxtSaVxCv3ZECdvFJ4U1jqMPxWOF7iKKCZ13sfNxVkl2kycuvC21StK6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvV4NR333hxmhIldWvS3gLq5krbNLgCsA1APYtzXxig=;
 b=Beu8XpTfXk+GbfB801MHLSsxskz94h198iw81ZpKxzodcxyrCbMBlyk0U2g9xyuT0Waox+t0cCqevarQMZNTVaQIVqu8ELVEstVEr8mn74IkXdbg+DWmDTPVnpDT7LJvrLvFHQm+MUtJkEj/nKrayr+gfM3cWfDXd/AkBo/d5M8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f74e53e72a87c82e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+OXxPoYFtEGIzfl0r49pj/hsc5XMNwy7jLAdCMB/v91+Ta9dnLZUHmas4352AlmQlI8N+aBAUQotxwEni8h6H2LvPMF56kNhkWXYnzOHMroqipn9AZ1VcnxS20MnlyTF2/eKnHAvpgFLgtQlSsr3vzDo6pbLSOm+aYx3MUAKOdxVRuDXnm7iO75NZMQRIcRXxAdLZKUiv9d3NgTD5pxUsOz/cX5fBh6ymzCGG952ctfk1xk4L8fsrZ0PAuQtx76bBcVRFQsgSJ2UiqkMCbiClXG/rTCgfvNdEfSYNu9h6I+S334L3M2guOIpK3TMSWHVmJX/sfweM915d2/R7mn9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvV4NR333hxmhIldWvS3gLq5krbNLgCsA1APYtzXxig=;
 b=EeZyyFypCQiXrDA0QBuU1V5ssCk7VS6WUnts2oW/7N6WLikwC3vf6eYeNA2VTe+Lya7CyMoArCZAYrLbBGsWBsOhaRA5GuEkhEmhiyFJ6ux3ruvi4VdsjKIOgtICiPXpjJrUEsPhxLbZZhSKdfrBIxgD5y3BmHP6TqMhvaOJWp8xFjyVDcBfrhckfZtg1ABRtT4MI44gI9CrbP2DbFo0OCzcmcvoJwBvoqAnubf6hnIfXtuBfuGRpy9LtCH6A4UkYsSzQ49im1qT0+Tv7x0HjMo3m1EJw8FAgxibCiHSM407jLlcjilWRYpjXJFUPcruErPISYHlJV1LlawIewfo2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvV4NR333hxmhIldWvS3gLq5krbNLgCsA1APYtzXxig=;
 b=Beu8XpTfXk+GbfB801MHLSsxskz94h198iw81ZpKxzodcxyrCbMBlyk0U2g9xyuT0Waox+t0cCqevarQMZNTVaQIVqu8ELVEstVEr8mn74IkXdbg+DWmDTPVnpDT7LJvrLvFHQm+MUtJkEj/nKrayr+gfM3cWfDXd/AkBo/d5M8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "stefano.stabellini@amd.com"
	<stefano.stabellini@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 0/3] xen/arm: Add emulation of Debug Data Transfer
 Registers
Thread-Topic: [PATCH v2 0/3] xen/arm: Add emulation of Debug Data Transfer
 Registers
Thread-Index: AQHaMfEa7o9h58xZgUaSJIw5Lcks+LCx6kEA
Date: Wed, 20 Dec 2023 09:29:57 +0000
Message-ID: <F1A640BE-0CDC-4026-BBB3-637ABE7D996C@arm.com>
References: <20231218202959.1390114-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20231218202959.1390114-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|DB9PR08MB7819:EE_|AMS0EPF000001A9:EE_|PAWPR08MB10307:EE_
X-MS-Office365-Filtering-Correlation-Id: d1257269-98fc-4f28-f28d-08dc013e43f4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WhTehkskOCBOoqc80enxlIZIDAdylq36vjUzrzPLXOXTtYnyVa7xTkFYRi+EbB0nABwZy0lwJgMUrGSlHt3uO3O+DCykDWYkOO6lv5NbTeUtG129DNvy0/KG4+3fY0Iu4UFz0qCbHoaTq9Pkmg3qDUddmMcWbSjkx1W0tt083ZE78PyTeU+EC8LHKJp+Cjx2/xaJAIJGKnJrijN1XVQpuzNu+2TehrCJf0k3SA6HVTEblRWVcMlMNugeELgkfJ88w6Cw3pRjiA47LWUWkKt6bFhzt2/Qhiw+90GXn/WHNpwKfmuiIz+UeG4C/Mj+LtJdhkO1Yf62BBKMXrs4YOU9s4pX8ZCSfzuVaCYiQS72dVB69GkZaCQ5F2zWUW7L2KpmxCDBtkiEOW8brhmHQx1VVjfwkwwOJP4fQV/BmG47oBfez4NV3u0C9bgDlCQp+aQ8QTl2uowrEKU7dracJABmvvhFj25hVrLbcQNXmg0oNYOm2/zy4Je5TctZ+NqXwjGyBPGYebFGmhj1JRp1Y5s9ptJ8DgJEPUAG5Em49cxsJztoYy3BcJKW0N75gEu/yiZRNC71h74HVq0Q9QwPF8TltZeWIouQfoqFKJLEgVTttNtmwK4gP5glUZGm2qoYPBBdh62/NXHUhUlg6upU/tpS9Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(376002)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(38070700009)(316002)(83380400001)(91956017)(54906003)(66556008)(66946007)(76116006)(64756008)(66446008)(6916009)(5660300002)(66476007)(2906002)(4326008)(8676002)(8936002)(53546011)(6506007)(6512007)(71200400001)(6666004)(26005)(6486002)(478600001)(966005)(33656002)(86362001)(41300700001)(122000001)(2616005)(38100700002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E30D80FC459384AA4C37EDA892AB4F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7819
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97e72e36-15e5-47a9-0055-08dc013e3b30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PUfSwdF+CA6iLDEUzzRIjW5ctV1PNd9rYXrLkxpgtaTae1VZJSMauLPOiRuOjV0acmiVCNxPgrbaqJOB5Fyk/xTAWkkQ1Iccuq/Wd5eHXH1sMfzIu1Yhl/TITh+gBOs9crn14/Pf/L+waJR+ZYZETZ4QYHzkJDZUCZgP68Bwojs5BixkaRfRfT1FqyEM3OHgnwGAnCyp6zo054rpdvtl0x9ckeAnn77pIQ2kFjI3Cc3IEjDhYDeWnW/KwmLTqfyP8Xez4ur6/X5PHNi1mCJOOdMhRLWah1NC4BoiTPhBWnN29muawfgYyiW3La8klXk7XpjySj/Ey02XesrX3KRxDE6/DgeNUyjbTIuvflhcqUKaSAso4LPjUpTExDQgwyPkm50ax/S6YHMt/ED12Q4XYLKItRgld72SJ6At02XvCMdYgrBdLE512aCoEk1OzKRuk9QNlqnrS12/smxxsJsMFnHGQJ7OGsMrdfRomzuk1WKuWYJS4+Bbpmu7DGt19XuuTnNSI0+2pkpfPonsWWxcOJDlZLV4DOsLzorEX/GMp44IQ2QLtVFl/mlKc1JjIUkFcSZIdMsUlrcLNeKZbOPnaBwTGyOW2iwv+7mCqGyQAVGvJSxgxNvcTA9Er2ToYYx/azZA2eBRCp9vVEkwx7jP3dHOsX6RpraCQHKKUuXGGEWUY6K9ENRmXH/Ws0gCSVEVIdPdoT1svzPKFt7yKKkZnKfT0rTpsxFa34esCCutOrk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(1800799012)(82310400011)(64100799003)(451199024)(186009)(40470700004)(46966006)(36840700001)(2906002)(47076005)(4326008)(8676002)(8936002)(6862004)(36860700001)(6666004)(6512007)(53546011)(6506007)(83380400001)(336012)(5660300002)(40480700001)(33656002)(316002)(54906003)(70206006)(70586007)(40460700003)(81166007)(82740400003)(356005)(478600001)(26005)(41300700001)(966005)(2616005)(6486002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 09:30:11.9025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1257269-98fc-4f28-f28d-08dc013e43f4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10307

SGkgQXlhbiwNCg0KPiBPbiAxOCBEZWMgMjAyMywgYXQgMjA6MjksIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gUmVm
ZXIgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2FscGluZS5ERUIuMi4yMi4zOTQuMjMxMjA3
MTM0MTU0MC4xMjY1OTc2QHVidW50dS1saW51eC0yMC0wNC1kZXNrdG9wL1QvDQo+IGZvciB0aGUg
cHJldmlvdXMgZGlzY3Vzc2lvbiBvbiB0aGlzIGlzc3VlLg0KPiANCj4gQWxzbywgdGhlIGxpbnV4
IGVhcmx5Y29uIGh2YyBkcml2ZXIgaGFzIGJlZW4gZml4ZWQuDQo+IFNlZSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9ncmVna2gvdHR5LmdpdC9jb21taXQv
P2g9dHR5LW5leHQmaWQ9MGVjMDU4ZWNlMmY5MzNhZWQ2NmI3NmJkNWNiOWI1ZTY3NjQ4NTNjMw0K
PiANCj4gQ2hhbmdlcyBmcm9tIHYxOi0NCj4gMS4gU3BsaXQgdGhlIGNoYW5nZSBhY3Jvc3MgMyBw
YXRjaGVzIGFzIHBlciB0aGUgZGVzaWduIGNvbnNlbnN1cy4NCj4gDQo+IEF5YW4gS3VtYXIgSGFs
ZGVyICgzKToNCj4gIHhlbi9hcm06IEFkZCBlbXVsYXRpb24gb2YgRGVidWcgRGF0YSBUcmFuc2Zl
ciBSZWdpc3RlcnMNCj4gIHhlbjogYXJtOiBJbnRyb2R1Y2UgQ09ORklHX1BBUlRJQUxfRU1VTEFU
SU9ODQo+ICB4ZW4vYXJtOiBJbnRyb2R1Y2UgInBhcnRpYWwtZW11bGF0aW9uIiB4ZW4gY29tbWFu
ZCBsaW5lIG9wdGlvbg0KDQpJ4oCZbSBhIGJpdCBwdXp6bGVkIGFib3V0IHRoZSBvcmRlciBvZiB0
aGVzZSBjaGFuZ2VzLCB3b3VsZG7igJl0IGJlIGJldHRlciB0bw0KSW50cm9kdWNlIHRoZSBwYXJ0
aWFsIGVtdWxhdGlvbiBLY29uZmlnIGFuZCBjb21tYW5kIGxpbmUgYXJncyBpbiB0aGUgc2FtZQ0K
cGF0Y2ggdG9nZXRoZXIgd2l0aCBzb21ldGhpbmcgdGhhdCB1c2VzIGl0Pw0KDQpJIHRoaW5rIGhl
cmUgeW91IHdhbnRlZCB0byBrZWVwIE1pY2hhbCBwYXRjaCB1bnRvdWNoZWQsIGJ1dCBJIGZlZWwg
dGhhdCBhDQpjb3JyZWN0IHNwbGl0IGZvciB0aGlzIHNlcmllIHdvdWxkIGJlIG1heWJlIGludHJv
ZHVjaW5nIEtjb25maWcsIGJvb3QgYXJncyBhbmQNCm9uZSBvZiB0aGUgYXJtNjQvYXJtMzIgZW11
bGF0aW9uLCBhbmQgb24gYSBzZWNvbmQgcGF0Y2ggdGhlIG90aGVyIG9uZQ0KKE9yIHZpY2UtdmVy
c2EpPw0KDQpJZiB0aGVyZSBpcyBzb21ldGhpbmcgdGhhdCBJ4oCZbSBtaXNzaW5nIGxldCBtZSBr
bm93Lg0KDQo+IA0KPiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgICAgfCAgNyAr
KysrKw0KPiB4ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgOCArKysrKw0K
PiB4ZW4vYXJjaC9hcm0vYXJtNjQvdnN5c3JlZy5jICAgICAgICAgfCAzMiArKysrKysrKysrKysr
KysrLS0tDQo+IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02NC9oc3IuaCB8ICAzICsrDQo+
IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9jcHJlZ3MuaCAgICB8ICAyICsrDQo+IHhlbi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9yZWdzLmggICAgICB8ICA2ICsrKysNCj4geGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL3RyYXBzLmggICAgIHwgIDQgKysrDQo+IHhlbi9hcmNoL2FybS90cmFwcy5jICAg
ICAgICAgICAgICAgICB8IDIxICsrKysrKysrKysrKysNCj4geGVuL2FyY2gvYXJtL3ZjcHJlZy5j
ICAgICAgICAgICAgICAgIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiA5IGZp
bGVzIGNoYW5nZWQsIDExNyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gDQo+IC0t
IA0KPiAyLjI1LjENCj4gDQo+IA0KDQo=

