Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBIZMqPz3GkvYgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 15:46:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B123ECB33
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 15:46:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281152.1564181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCHbE-0007jg-1d; Mon, 13 Apr 2026 13:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281152.1564181; Mon, 13 Apr 2026 13:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCHbD-0007gd-Uf; Mon, 13 Apr 2026 13:45:11 +0000
Received: by outflank-mailman (input) for mailman id 1281152;
 Mon, 13 Apr 2026 13:45:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCHbC-0007gX-Ry
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 13:45:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCHbC-007me8-7i
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 15:45:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcf362-bab6-0a2a0a5309dd-0a2a450b9672-12
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 15:45:09 +0200
Received: from [52.101.69.22]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcf365-bca8-0a2a450b0019-34654516ff6b-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 15:45:09 +0200
Received: from DUZPR01CA0139.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::14) by FRZPR08MB10901.eurprd08.prod.outlook.com
 (2603:10a6:d10:139::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 13:45:06 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::a2) by DUZPR01CA0139.outlook.office365.com
 (2603:10a6:10:4bd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 13:45:06 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 13:45:05 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB6405.eurprd08.prod.outlook.com (2603:10a6:20b:332::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Mon, 13 Apr
 2026 13:44:03 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 13:44:03 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=E2d5O3UTMPkivMp1q8ugqtnIB8sdTwOwrkr2INf+Fdp1Ta+F0hX4Mm4RiHO3va0+R/6CqAXonqmGRQgPbNGi9UITP1AawHPKpl74UH9hF9oXvVLgZOld88soX4zU4cAc9sS70JHrql2k9jhSTALYM439XoaQyKhVU6Ik92LbjtC8JUyjkge6gSt+Bqi0vvIZf9+GxrfouePOvgJBIYj7iC3K+uQM+PyZ7xoqKMkZ2uB8NC4abWg+r6/vjRmK//paBmss9WqIT7QlZzVD3MbcTgPN1sk0rnU7ndXG4cCQFYrBFFEVW7Ch7MnkOK1kauzoa7+ah9xOVh2SFFefvlFNoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAs/IheV+auxMrH8rqjFGGtBB/B27mD1QFcTXdKHfno=;
 b=eSVTPHfDLFNiP6Yy/tRqup2HqpejxjvwUXHNOhJ+1sacNcE6ToljSg/5euD5qm05oL4+yCu0MHZtNRz24Z8Yk5iIhq85IgrIIUHubhcSLnZla/rfNT9pkPuDbgCBg98auqDiVKzOJ0u1jkMJ9keGWDM1prgJp23A/fBcGo06ONQH9/Mq/73ZstwInGLYWjhiGnkyZ660uPeUJV7sCfw2Y5WO6ussJ4sinwTed2SNzOoK2sKjd8Bi4hEsFVSUJMKSfqN44VcDJY3H5i2Kk85VxVFLxRX0+IeaJgOP/JZ1CSGw0cnPMW+F2yBpmwGhzhtrtj2X6butASM1BZ0YtReVEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAs/IheV+auxMrH8rqjFGGtBB/B27mD1QFcTXdKHfno=;
 b=HJjSpxCG4hLGdJ1zNk7TGCGa3kklfSeYvPXNuDfT//GqFecxTsvMPnLoz6ySzIMOPK4R1wUcQZKwgngsQDw0T/UwMf5A37z4rb+dyMsYRp9ybB61X5PcYC/GtFwDENqkuGVlQXMN+4guWh9IfToVhr+8BV74Ul6gFvbhLm5BjBY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHDnAwXwfuAEuqRE1bOMIro2OaoDDm50LTukWjfJ0UNyUrsHs4kae3GH6fRAmwzbIVFacKttM7m5IqSV39DOjb2qw1RWYpvAicESicGNSMvNcTDu3nbcQCtPBtXaeuymUEOo7e0UuLjGVE84a1+nhTmwLOjmC75oNMWaWbEGJcODM+j9vwj6d/vSaKbOPm6bs2zunnvI0Fr7TWGJM7g7DEN5qb3I2j5p5SL+MV/0YsabtnzCw/oLTCjysngNagMFpQ92boYRxeSuW7SL1QUUdRRgtzueWfhZpiagNE3REqPiEs9YcxojUv3DOYVDrd3cHf4FFZVR3tzXyzFEzr4ovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAs/IheV+auxMrH8rqjFGGtBB/B27mD1QFcTXdKHfno=;
 b=mpXDn3Bj9PRaH2raLccTiQPYVMMuCvOyzYqCJAUCxFsHdaJdtTTG/t1oKoaHK3vziwDmE5b2/QWeFq/3gG8dN8UMdHiAnV6gH8KxMTsbIjqGufK3ADa96BopUtkP41xEjaenokOfg1KxHO/cZoW3Iku67/Gd2AkICijsUlL3PP7sOO+OpBybzl2n88rlkMOLyc5jHQcMgNEpDvS9uZCURlNybSqmLsiipmhdEF90gJOplyDjaUlZiwNhzYf2RTLMqXscp3WmTZvT50TRcOfWQ0N0Cs7a4+LCDk2y0o4pjaMRY7WTLkjvzscxddY43StkJsZQOcH9gDO1BL6Cm100fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAs/IheV+auxMrH8rqjFGGtBB/B27mD1QFcTXdKHfno=;
 b=HJjSpxCG4hLGdJ1zNk7TGCGa3kklfSeYvPXNuDfT//GqFecxTsvMPnLoz6ySzIMOPK4R1wUcQZKwgngsQDw0T/UwMf5A37z4rb+dyMsYRp9ybB61X5PcYC/GtFwDENqkuGVlQXMN+4guWh9IfToVhr+8BV74Ul6gFvbhLm5BjBY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 16/23] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree
 node in libxl
Thread-Topic: [PATCH v3 16/23] arm/libxl: vsmmuv3: Emulated SMMUv3 device tree
 node in libxl
Thread-Index: AQHcy0uWtT0jmyy89kG09VrDZ/FQXg==
Date: Mon, 13 Apr 2026 13:44:02 +0000
Message-ID: <B8A18E5E-387F-4390-8928-AA53E6D23270@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <58c7eb798749c8c78935f5a8fc9e0aeff81760bb.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <58c7eb798749c8c78935f5a8fc9e0aeff81760bb.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB6405:EE_|DB1PEPF000509F5:EE_|FRZPR08MB10901:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff1fe43-62b2-42a1-c83e-08de9962defd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 wHz5zINFGM/QfaiuQEBGCtRucsADZ8cfStHyWfzTpK/T4LURnIs07s6TKhQvD7NRXqRg/gIJOa76IKto3synKbhmtttva5sIwCT2CjNqynEv5mMAc0Fvaic7+tNLhUfT2p5/qQYNbnWDUY6rQRXcqtC6dLU2Z+yuy1JWQefOtnAOoT/PKGKZxmQH1JfJtD7v1xpn9Kn7KGx/OttMAmUiPV1ycHvIgno7fbUsEZCyQfewaYt2AiWqA0dtK+s2WSgcwxkrorOsIo+/T8Jy7V21IR7sd5oHvz6s1ZT+Z6YvBRMDdkfy7+R+7L15Wsx1uE0nBRCJuQTdXWNmvWugd1OrNMvEuLpIzMVdaqfx5MDlfAtcBKxh0eedBVB2k0psOYjrYkdFWCfLJfkzc9TJe7VlpicVkhqzZlAsOCLHXXSCzGuBCk/LQMYpqjRDe5I8eth3Bz5fbLYHI03leSvJ6o1dMehDogafVPtOVjtqJJ1VFM3GuRvT4jVCE+cguCp0qcqPB+Pe94OITypToDAn9j6ceF18ZyIDDF8YhTUw8SszIuB6oOkNG0CY1VNEWK9hdbKM0v/L7X92jYcD81mboB9N31IhPOZi6JYXIg8X68TUWyTLdB1EYEMAE7uEzViWk6RM+5chjttsexFCaOYKbEiyTY2TjIR8giiIhwF0ER4/PGXGj4WygUlLi7F2kvuCUMmsCXhGGMrkTToIwLC2SpY1Ef2zBaOcEjI5qqRB2iln6+MsDSNUycB0Cha8Y7CX7b4J1c5xhutxH+SBo6o0ThSP/OcNkgqsZtVhx9dtlcQ66ic=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C3FCADD1620DC419D941DBA881890E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 mTv+T4SeKw5kaDLXxMp+yyCfcbN1RDKMBLj83Hm3/gk0CETCeN7AWRf38TIXLZw7yNUrIfxyAgKGgGaTj7O+hYYRB7envoDgdnUjYT9RJH2Nw7NHioqhIDfMsVc3UjbqM4NxyFtJVFgTAo9hcJnZQ52kOKCvO62nN37sRGu8oEH7lGpkv8W6I5Mo61FbAlrYuEXpDpgfyjIvfrSD4AisSAx9WrwBINGjn90qNFVdUpwP1BSz049xEA7Y1Z6q8QABQ31JEWstzvaYcCUKo3SGgobYKzbG8Wc4nWK4tbF2Uk6Tr0rT3iUxeIRNjil5FhXJGyxS53yW+o8taixx5YS8Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6405
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	674ff7f8-cb2c-49d7-948a-08de9962b971
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|1800799024|14060799003|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ujK167y112wKppNJeMD46fU3YBGrqUb16YnYWxqYwsqzP6vzcXgybFUx/3B6xcvzjp6qFPkUbM2gwVPJ+q/bIGOavm3AwG4RAEc4bB6pmxf8gXEtg79rSXfK/luID/Na+r9Cv+tns+VPeeHtztvbS3Qz2tuAd6MaKwN82D6nKVkNpRshaF3OT4DHmdIZ4HVuH3QpwACMdg9vhxEMzhh0O73jVVhEO1hZSFLPWKGku3N/tY7eEYW6+mPTeqIPFw0DNqWwVA2TuWSgAwYNg77hP73NedZO6/rqkHFot+/E6saRGe1py06a8mtj6pXUhw+ODr0WgMOqNQw8RAP2yrkDz8lYPJ609a3TRY8TKzJ8JYGVjKHH474MCV1pvt6jbaLpWPK0VXAAZ8D0NrNOhA/7BKLNriBQi+w/jxGbURob3/m538Pr9auryYYsMUuCYfnBRINnTRmmDf8K0AWirE/hPXHwdfRfpTtdohXGhD0mXTeqefofcu9Ih2d49PjbNcCvsYFzIQRYZhuZF7ZDUJb7Mm1pIcMeD8QwFOJCwC+GLd+ULuYry1jIm9pg+iaM3YZRUoxvVigQklu4olBrUm77m6yShQxSiibcXgSxfDRDm8iLkIciSh8QqMoO+72ccqKdDBzj/A0T0BdzKVBJVx4Adh2CGnCMGwguwN4F5vPuT5mahS11xjauv+1PbTnUEAk0K4sriCDOMtTFKMxsikSzBb1I22kx0eyw0AEDZrjciCUoPiUt5uu9sPbQVWbvyZZDyAelyBjorMcqXnJbRQdgDA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(14060799003)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	chzpPKqrwzEARNG2oNh7cg9x2o054nXgr+Eb/rZ1gu4oF5JAVxA9BjTPVd9aVusmQ6US2ipzOGDPENM62m7m73kR/RH5kj/hlpgV96TnfxZ4nT8ARvbGZkaal7zOqzEKc/KnXHjWXawHR1fQoQVBZWXQMCZeuMN6qxo+9PLMcDUVejiJXTRE2I3K1aFlf/yH+dbFU2mgn1nQoRsOmdfeFTPPGEr9IaJoyHzZS6I21x17aJiGVaajg94DZlbTqgtIeyHdGgfq4niTFEo97YvMMUgmDmcScLwTzKzCDcBGzQ4nw0vnTt83sE3GrQe7wTU7/Uk17R3WfdnI1G2Qcm4Mi8k/xTPHBjGy4BQBZ9/3EAclnOgliDASWPb2xSYfhgXYHis1/GumX8SxeaXoWV2Y5mU9bhJNO0BhBwgL4mN25l9MJRaqvADtWkoHYdAoFX8A
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 13:45:05.9191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff1fe43-62b2-42a1-c83e-08de9962defd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10901
X-purgate-ID: tlsNG-42698a/1776087909-F5FC02A1-A167A402/0/0
X-purgate-type: clean
X-purgate-size: 3470
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 16B123ECB33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWlsYW4sDQoNCj4gT24gMzEgTWFyIDIwMjYsIGF0IDAyOjUyLCBNaWxhbiBEam9raWMgPG1p
bGFuX2Rqb2tpY0BlcGFtLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBSYWh1bCBTaW5naCA8cmFo
dWwuc2luZ2hAYXJtLmNvbT4NCj4gDQo+IGxpYnhsIHdpbGwgY3JlYXRlIGFuIEVtdWxhdGVkIFNN
TVV2MyBkZXZpY2UgdHJlZSBub2RlIGluIHRoZSBkZXZpY2UNCj4gdHJlZSB0byBlbmFibGUgdGhl
IGd1ZXN0IE9TIHRvIGRpc2NvdmVyIHRoZSB2aXJ0dWFsIFNNTVV2MyBkdXJpbmcgZ3Vlc3QNCj4g
Ym9vdC4NCj4gDQo+IEVtdWxhdGVkIFNNTVV2MyBkZXZpY2UgdHJlZSBub2RlIHdpbGwgb25seSBi
ZSBjcmVhdGVkIHdoZW4NCj4gInZpb21tdT1zbW11djMiIGlzIHNldCBpbiB4bCBkb21haW4gY29u
ZmlndXJhdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5n
aEBhcm0uY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWxhbiBEam9raWMgPG1pbGFuX2Rqb2tpY0Bl
cGFtLmNvbT4NCj4gLS0tDQo+IHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMgfCAzNyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gMSBmaWxlIGNoYW5nZWQsIDM3IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2Fy
bS5jIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9hcm0uYw0KPiBpbmRleCBhMjQ4NzkzNTg4Li5l
Yjg3OTQ3M2Y1IDEwMDY0NA0KPiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jDQo+
ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMNCj4gQEAgLTkwMSw2ICs5MDEsMzYg
QEAgc3RhdGljIGludCBtYWtlX3ZwbDAxMV91YXJ0X25vZGUobGlieGxfX2djICpnYywgdm9pZCAq
ZmR0LA0KPiAgICAgcmV0dXJuIDA7DQo+IH0NCj4gDQo+ICtzdGF0aWMgaW50IG1ha2VfdnNtbXV2
M19ub2RlKGxpYnhsX19nYyAqZ2MsIHZvaWQgKmZkdCwNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3Qgc3RydWN0IGFyY2hfaW5mbyAqYWluZm8sDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSkNCj4gK3sNCj4gKyAgICBp
bnQgcmVzOw0KPiArICAgIGNvbnN0IGNoYXIgKm5hbWUgPSBHQ1NQUklOVEYoImlvbW11QCVsbHgi
LCBHVUVTVF9WU01NVVYzX0JBU0UpOw0KDQpQUkl4NjQgPw0KDQo+ICsNCj4gKyAgICByZXMgPSBm
ZHRfYmVnaW5fbm9kZShmZHQsIG5hbWUpOw0KPiArICAgIGlmIChyZXMpIHJldHVybiByZXM7DQo+
ICsNCj4gKyAgICByZXMgPSBmZHRfcHJvcGVydHlfY29tcGF0KGdjLCBmZHQsIDEsICJhcm0sc21t
dS12MyIpOw0KPiArICAgIGlmIChyZXMpIHJldHVybiByZXM7DQo+ICsNCj4gKyAgICByZXMgPSBm
ZHRfcHJvcGVydHlfcmVncyhnYywgZmR0LCBHVUVTVF9ST09UX0FERFJFU1NfQ0VMTFMsDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgR1VFU1RfUk9PVF9TSVpFX0NFTExTLCAxLCBHVUVT
VF9WU01NVVYzX0JBU0UsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgR1VFU1RfVlNN
TVVWM19TSVpFKTsNCj4gKyAgICBpZiAocmVzKSByZXR1cm4gcmVzOw0KPiArDQo+ICsgICAgcmVz
ID0gZmR0X3Byb3BlcnR5X2NlbGwoZmR0LCAicGhhbmRsZSIsIEdVRVNUX1BIQU5ETEVfVlNNTVVW
Myk7DQo+ICsgICAgaWYgKHJlcykgcmV0dXJuIHJlczsNCj4gKw0KPiArICAgIHJlcyA9IGZkdF9w
cm9wZXJ0eV9jZWxsKGZkdCwgIiNpb21tdS1jZWxscyIsIDEpOw0KPiArICAgIGlmIChyZXMpIHJl
dHVybiByZXM7DQo+ICsNCj4gKyAgICByZXMgPSBmZHRfZW5kX25vZGUoZmR0KTsNCj4gKyAgICBp
ZiAocmVzKSByZXR1cm4gcmVzOw0KPiArDQo+ICsgICAgcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4g
c3RhdGljIGludCBtYWtlX3ZwY2lfbm9kZShsaWJ4bF9fZ2MgKmdjLCB2b2lkICpmZHQsDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGFyY2hfaW5mbyAqYWluZm8sDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tKQ0KPiBA
QCAtOTQyLDYgKzk3MiwxMCBAQCBzdGF0aWMgaW50IG1ha2VfdnBjaV9ub2RlKGxpYnhsX19nYyAq
Z2MsIHZvaWQgKmZkdCwNCj4gICAgICAgICBHVUVTVF9WUENJX1BSRUZFVENIX01FTV9TSVpFKTsN
Cj4gICAgIGlmIChyZXMpIHJldHVybiByZXM7DQo+IA0KPiArICAgIHJlcyA9IGZkdF9wcm9wZXJ0
eV92YWx1ZXMoZ2MsIGZkdCwgImlvbW11LW1hcCIsIDQsIDAsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBHVUVTVF9QSEFORExFX1ZTTU1VVjMsIDAsIDB4MTAwMDApOw0KPiArICAg
IGlmIChyZXMpIHJldHVybiByZXM7DQoNClNob3VsZG7igJl0IHRoaXMgb25lIGJlIHByb3RlY3Rl
ZCBieSAoaW5mby0+YXJjaF9hcm0udmlvbW11X3R5cGUgPT0gTElCWExfVklPTU1VX1RZUEVfU01N
VVYzKT8NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

