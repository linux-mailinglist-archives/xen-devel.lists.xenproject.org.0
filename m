Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AA55A73B6
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 04:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395285.634835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTD2G-0001en-5C; Wed, 31 Aug 2022 02:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395285.634835; Wed, 31 Aug 2022 02:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTD2G-0001bt-2B; Wed, 31 Aug 2022 02:00:56 +0000
Received: by outflank-mailman (input) for mailman id 395285;
 Wed, 31 Aug 2022 02:00:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zBhm=ZD=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oTD2F-0001bn-Bs
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 02:00:55 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bebc060a-28d0-11ed-a60c-1f1ba7de4fb0;
 Wed, 31 Aug 2022 04:00:54 +0200 (CEST)
Received: from DB7PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:10:36::48)
 by PA4PR08MB6014.eurprd08.prod.outlook.com (2603:10a6:102:ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 02:00:52 +0000
Received: from DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::6) by DB7PR05CA0035.outlook.office365.com
 (2603:10a6:10:36::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Wed, 31 Aug 2022 02:00:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT021.mail.protection.outlook.com (100.127.142.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 31 Aug 2022 02:00:51 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Wed, 31 Aug 2022 02:00:51 +0000
Received: from 9cede5dd5a5c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7500A9BE-A008-41F2-819E-EE5C22032693.1; 
 Wed, 31 Aug 2022 02:00:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9cede5dd5a5c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 31 Aug 2022 02:00:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB7936.eurprd08.prod.outlook.com (2603:10a6:10:378::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 02:00:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%5]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 02:00:32 +0000
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
X-Inumbo-ID: bebc060a-28d0-11ed-a60c-1f1ba7de4fb0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=W9j50rPhuuZsZLFEXGantCVV09iR+AWEDHzPVDwV6Yfwn6dEw5v9olOPLdfVajRPT7Z3mA+GMF36nsyDALrnb80lj8bQX1qQjaMaUOz5av5ZSuinrSljbJ+0Gi6n9+nG+HES+DM28+7KcHaFzrmCDyXi/8V7nvWbhIKwT8H50XsNlEe9KVI6IXWkgHQisT/bfeXbVqVRCMM+zoL4D+rmHIoXBgaNA4q39MImHFt2eq5NFG1XSdZpiVwbeYfNKcrHAD+43nPMX1GH9omHHlvH3d0R2YnzA9ctByLgDq7a2PEg2lk80UdR/GWZdO8HB0QWg0vKKQOLLM3g0wGO2GguCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L3gmqOtm4LsI1FDMLWYFHoJArnEY0/h1X70CYYtWdc=;
 b=ggKQ5Qd0PGtUO9iNgWbAlL7VslXvKCF+l8fVf0vRdHjAOgeNSGQ4IPm/ZJJoDOd3IwDktxubWHSdimrqjeVZZzjtOsG9Z2P8PC6gddP+FE1QCNWZFJviRfzgtQuPtLC/OPUHK4GLtQOlupiLocaKXLw3zhv+7qpzvtEu7XqoYCmQrxrdTEiJPQ8/U5H9kMhYse2qiP00dDrvU4vUlRvsu5nXOYSXStLWibgf3zscTiPjpr1/uc0YVcZta1OQe+kPHIecZB/H7PlsvqKEhhR9eRwyBwmQofdtt3CFhWeV+MN+Hyw/2MLOnspHiMuCtCT6XWfIT/E6cgDNdTWsZyusiw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+L3gmqOtm4LsI1FDMLWYFHoJArnEY0/h1X70CYYtWdc=;
 b=DxmjO9idYAzypUqGmDfw1bjdGXxsnLwjxOFC/21GGY1mN0QjaGnLwsW8C4crnwJx0endIhEwm65irQjJZZMBTCXYLczML5fPRKhskUbTW+Q2cXNFA+Mrrrkz9CUAnLFMIiYyJNYB9H91H2UsMouN4pG9W3PQs0yGIwHunYQ6HWs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8yZc+7u3GiXonWHnul5JIQib0t0GqtCyerPtRFK4HV5gsXyLuHyboEl4DuvFdFMDTw34bUiz5XnVSOUf33EchacX5KE05yHs4rieixUOf4vIEb+8ihTzIC7xFdXWjN53gfr1Cwvn0+U6/NFRpPY7GpOR0f/WSFFSE+Y+A/CnuRZYRIDPqRCjfa8KOtQSn/SAQ10nAVYXSl7lHn7Jt1aXp7Edzhzxnq/vpEnXHkEAoaNQC4H0k4x1ReDXIX3x/AAmHihpIvBWwsmKecoar/aNHL4eM/VyW8jb+8GZFtYmT1ANsuZgr0UBNdcZTcqYYdy0xwMvNwURz/WJ/KwV4G5dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+L3gmqOtm4LsI1FDMLWYFHoJArnEY0/h1X70CYYtWdc=;
 b=lh0ODzxGGzvjBc5Ht24wA8QxVp/klD5nI3WVMBiwovGvFDKOenrKMhirVNWPFq0QvCEFMMezlAt/+jM6LJsKd7CNJUK9d2/Ja8R7dHB4XslivEHUCC0ULR0oq3qEIpsMWxrN3ftVz0TCzd+m1I8cdiGR6IRyzcsiekCJbLAxZC8Gjwijx+5yQ22Vqtr4HZernsGhgSFJR/mn+/Unwn483+6mImKzrgZuJZWp8k1IrH7AEDd6PlRtPmufU+i72uAGkR/8RMofrTTT2WEQtuFBX0IcNIiBriA4ftxwNcaaBJb63d4FL26l9Bm8mT/ckk02h1l0bhZgIThv6knHio6tYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+L3gmqOtm4LsI1FDMLWYFHoJArnEY0/h1X70CYYtWdc=;
 b=DxmjO9idYAzypUqGmDfw1bjdGXxsnLwjxOFC/21GGY1mN0QjaGnLwsW8C4crnwJx0endIhEwm65irQjJZZMBTCXYLczML5fPRKhskUbTW+Q2cXNFA+Mrrrkz9CUAnLFMIiYyJNYB9H91H2UsMouN4pG9W3PQs0yGIwHunYQ6HWs=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index: AQHYt4ugTfbCAM/WyEil7pMplK0r3q3GqcQAgABmBoCAAKwSgIAAgPtwgAAOWPA=
Date: Wed, 31 Aug 2022 02:00:32 +0000
Message-ID:
 <AS8PR08MB79915F958028354C4478615A92789@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2208291755450.1134492@ubuntu-linux-20-04-desktop>
 <AS8PR08MB79912EF49AEBA8E5B18B8C7F92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2208301013500.1134492@ubuntu-linux-20-04-desktop>
 <AS8PR08MB7991AA505E621A7B6E8B906192789@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB7991AA505E621A7B6E8B906192789@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6ABDD4FD2F14FF4F9DEA5BEBD942125B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b13ae803-f47e-400a-08cf-08da8af4a1a2
x-ms-traffictypediagnostic:
	DB4PR08MB7936:EE_|DBAEUR03FT021:EE_|PA4PR08MB6014:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jj0JtVUWuLk3uCevAltKDBbQx3/ehnE/ublCWfqDvvQIeud3/PBVN292eBhSj2PiMaRVSzvuiWh7Ut+RlkeXcBqewWTH/0id8LGhxXWzGjOKcTzj/zX+ZWKqz8oZqLv+zbcL6sBbSCiGXS24n0/u+5TC97+UC7BdMyccm34SY2v6VYs/dso0ZwNeOG671X8YbZaGKC68IipJtcvhWnFKu4evMIv7LcchVNkd+NBsiByUAnt/WH/09vHkMgpHhcljFt4TjfVc2NMWyOf5OH9pZTgc88yvG/YRFFcxvQdMTEx0iyTWNq2KPOTRfbeZ3EODEnG3vvgvx/LlManO/92mkaPH7bFM7moa8KTRDHrgt9W9jrT93h9mak8CxruYIwmooTsno5fzxFpxbS2fRJtQU3fWUKi9Qqb0rQOfDAA4wFLifG23Afxvq/KIoOmqxyxhxg2hkkp9IM6VWcikc6Z3q5HP+SsWMHDtsy/ubTPTgy6f0JbmljpQH33EiX6MeL+QqzRssf8YdDEwc5tQRcHmOmZB5dtADUJiBSefrC7OgCvAHe6IuQs8CrCFggQBBGhT8s9c/HeF0VLFJORMIWa4Li4/1o4NCMjzt2r6FR4eN15+88EPv4Z26fVKFz6G635TV7XNFoR4iF5AkxWtiX5SRj8hkdznZP628mwGNwG3mSHVdlMcHGGF7PN1vW9wjzN6P3gmG7cHcTcGi1nqY45+Zuu2phRlC6pJXNmqjOZ9O99hij6bT7LKi3W16Lp14BE0tomjYwd0H0Ih3PZnYvcDJOT3IFw3mE4JakX/NG625fg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(76116006)(7696005)(6506007)(122000001)(66446008)(66476007)(66556008)(64756008)(8676002)(4326008)(316002)(52536014)(8936002)(26005)(71200400001)(38070700005)(55016003)(478600001)(966005)(6916009)(38100700002)(54906003)(86362001)(41300700001)(2906002)(66946007)(9686003)(186003)(4744005)(83380400001)(5660300002)(2940100002)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7936
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	15d9bb0e-72bd-4a72-b212-08da8af49645
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+xvSNVCf1BkEW55xI8rbTqbmSxn/zKI03qVFJ443Q0E4eZCLtpd2UIxB9csQcdxYA9qS9ZiTJZj9E8lNXkfHmRG9IH1DyJ18Dw4RLnLypUc5HtgZ/Ircwcbu4RbRAJZedZTNHM7n29TrK4b/Pdz6w3CImHROu1/3DlvTgTi2IKraETm4mQ5CZhLjow56oTf94x8261WwG0zgTG8g0F17YEUfLXiRGFU7KVSkajwccaNwf1dI8a5oZtOaz4T364U/OZ9d48l43/N2RqzvcllbDoIlreYoMRZgBfyseVurnTsJpo2/fNPBj8tewbujlUn2PrqetZx1ozUf87xJaaHMQzh/52ev74JXMHQkAFcUwvN8vL16UxTHnwNnyk7iuK75iVVyHnev6+/ZDKOuH9e3NZ3ecpPtrhTBl7aNtPA4OVLAaGW3sEo2nohkIyXphYBpG90sJiH35Va13vByr7gTHgIjLxe6v3p4HJhut2PViUtTutJTfn8b3jyhbFPYFrfqS56OfMTIuc/etatE6rGR+RrrMncPiAk5yQ6A5RSDEtyZpRY0UJv+QhvWCH7QUi6dRL6f9P3DZp7tLEejCjBMPLsWQBbajpbwBC4hVCMIpHx9zjpIwWVIlGE8aHdqsYhAlyIjr+410AyHDTfaTw3LMY9qMJ23pkld0dE/DiRZ4QckATIEl1yRACHIGsizgoh43sic2cjhljhFTu9G+VGiOa3KT9ihVW4RhY88yOf9jcpO7YP8Pc6mCeNgUxFUWhTWeMsXMpzBgq66NY6CaSH5J0GvbAWokIUVnTZeowWgBCo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966006)(40470700004)(36840700001)(82740400003)(81166007)(316002)(54906003)(186003)(86362001)(82310400005)(356005)(336012)(36860700001)(83380400001)(2906002)(40480700001)(478600001)(55016003)(40460700003)(70586007)(8676002)(4326008)(6506007)(966005)(33656002)(70206006)(41300700001)(107886003)(8936002)(52536014)(4744005)(9686003)(7696005)(47076005)(6862004)(2940100002)(26005)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 02:00:51.4594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b13ae803-f47e-400a-08cf-08da8af4a1a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6014

Hi Stefano,

> -----Original Message-----
> From: Henry Wang
> I am not sure about that, since we already have
> heap_pages =3D reserved_heap ? reserved_heap_pages : ram_pages;
>=20
> the heap_pages is supposed to contain domheap_pages + xenheap_pages
> based on the reserved heap definition discussed in the RFC.

To add a little bit more about the background, here is the RFC discussion [=
1].
I should have attached this in my previous reply, sorry.

[1] https://lore.kernel.org/xen-devel/316007B7-51BA-4820-8F6F-018BC6D3A077@=
arm.com/

Kind regards,
Henry


