Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4958FC08
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 14:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384534.619926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM76v-0004J7-5U; Thu, 11 Aug 2022 12:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384534.619926; Thu, 11 Aug 2022 12:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oM76v-0004GE-2L; Thu, 11 Aug 2022 12:16:25 +0000
Received: by outflank-mailman (input) for mailman id 384534;
 Thu, 11 Aug 2022 12:16:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSs6=YP=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oM76t-0004G3-9N
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 12:16:23 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2046.outbound.protection.outlook.com [40.107.104.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68e0881e-196f-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 14:16:21 +0200 (CEST)
Received: from AS9PR04CA0082.eurprd04.prod.outlook.com (2603:10a6:20b:48b::6)
 by AS8PR08MB6792.eurprd08.prod.outlook.com (2603:10a6:20b:39b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Thu, 11 Aug
 2022 12:16:19 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::fd) by AS9PR04CA0082.outlook.office365.com
 (2603:10a6:20b:48b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.12 via Frontend
 Transport; Thu, 11 Aug 2022 12:16:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Thu, 11 Aug 2022 12:16:19 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Thu, 11 Aug 2022 12:16:18 +0000
Received: from 68ff7bcfdab3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 78E9956D-F1B0-4531-B7DF-BFE62C6D2EF3.1; 
 Thu, 11 Aug 2022 12:16:12 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68ff7bcfdab3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Aug 2022 12:16:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by HE1PR0802MB2249.eurprd08.prod.outlook.com (2603:10a6:3:c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 11 Aug
 2022 12:16:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5504.022; Thu, 11 Aug 2022
 12:16:09 +0000
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
X-Inumbo-ID: 68e0881e-196f-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Zry/3MLXG9LYNCngIIRJTyWuuSwLatCRsi9lNKs6N+4Y/JLVw/n8FWDVy1KFyAkCdH0iBBd7Y0hj+1E8Mz62S4n6SQQPVoqqY1MOq+CFCNnP01gxJFg7Ki51WJ9qe4EuWxfSBiVFkCy9Lloofl60nV2MBpR41cYaVHNk2CjqwCmoetYpbQMQWm/2D3FqcN3LFufVE91wZB07tMsz6NMSv9DX7mmabdfRQKGKrMp/c2ELHwGofpqVZHC9TSC8FftpsL9Dt/HZhamnuBQguhEVAfh2sYYTHqyNjHcBd8cuwWx7ctnuJ9PP0Ot8EZivSLc7g01qwyxGDI3aFFUZ9yjeqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntNMEI9RvxZNZvuyFVmvPxT3D8YQZGQ42cm6G796zYU=;
 b=NbGaXG5pE3ITU9bfEPKPXmHoeJFdO4TmTriHp3yHMJAC2gD5YyttlvgHDbLzoD8vwbKhAH03toTF4u/wVT3oEuwE3+m/YQgJi7xnJbUvkcTWss2fHbdaooSMvSVUM6f+r5oMaR8qH75eAVPedxZY8lXmzArDla3VaYVEpOFHBbbDUmEjUafBpd0bQYj3fJdSZP++KKC1YShRgLSHZj+cOt1wzh3Fg4caRWhN7CJaQdgLETX4JN5JGIUTlIMAYGQJp2cM9w9Y4uSxfuKOvd08dyMqKDhcPB8bHr6thm2w1KuF//pe9Lz9niTPDHbPBBahof3xWnMKG6YiLbK8zSB65g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntNMEI9RvxZNZvuyFVmvPxT3D8YQZGQ42cm6G796zYU=;
 b=RzBWQBO2pD8boO3vekhkTWzs8PV9CusaILpZ8XrbwyJxJKWEgotEQGd82KcmDPiDHm+ehU9BAiLbNDrNHvbri9Yng4XG7ThFK15h1Ny810Vlz6Yi6p9G3xqktySGoR3Y+4VNaDMJ1ncC00Npp+i15cRU+yuFJXSHfuHO/JSx2Cg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kb2TjS7XY52kFJdsN4/b15YGE3WLeL5qvztqr+1kbReBIxZUxyzNVvXmNZEm+ZXCeb8GQgbKm3neUmM517ApaoYAi+5IKf9qxDrPLij5CQe2Kul+9BhcwRLeCRC7QhsDung5+vJhaDs6wIIaiSidBpagSHTfPONltocialvj8LhVE/4QmjFCVN0W70O8a3bLprW6z4OCSthmkiATopOGFadTrXQGbfMbUme5G3KpfqgzhI7PcMkM9qF/XF6usjJiicPzvSs/o4xUrjyKsuuAMv/8rVKbQQqQ05Krur6nnS3A5qsyaxNO1O5sMoGGi51M8QzunLPKMxgutJLCHgKoVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ntNMEI9RvxZNZvuyFVmvPxT3D8YQZGQ42cm6G796zYU=;
 b=Am/6zBibA7vPU6dMcoIrlYHqqxlFvkbMyOxc+FGyj7MrQ0YZnoBv0C2ujD/RbOa27c9aMcUeZBsLFWbamfFtBVKaNY3ByMoU3RY7eApKDPniV5HXF0bBo98JUMSRodYvUOvJcDQ4Lak2XTBWRugIrDXIfW+IKsImknXxn3JMC69TExPN5ceDYJn1k5995bkoIW93jSCanKWoQ0xLyK1E4l3hRq4nZRRtHxfpqKfc06ZtQefTTn3+SGWz6AkWtSg2PDaCPNpo/o070aeJYbwIP83rEtRBtwQ5Jp4yMCw7dixB5t5bAdS6jxIwzU+wCnOvKtmT/FcDGNuAX76hJ5b0QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntNMEI9RvxZNZvuyFVmvPxT3D8YQZGQ42cm6G796zYU=;
 b=RzBWQBO2pD8boO3vekhkTWzs8PV9CusaILpZ8XrbwyJxJKWEgotEQGd82KcmDPiDHm+ehU9BAiLbNDrNHvbri9Yng4XG7ThFK15h1Ny810Vlz6Yi6p9G3xqktySGoR3Y+4VNaDMJ1ncC00Npp+i15cRU+yuFJXSHfuHO/JSx2Cg=
From: Henry Wang <Henry.Wang@arm.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Community Manager <community.manager@xenproject.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [PATCH v2 13/13] CHANGELOG: Add Intel HWP entry
Thread-Topic: [PATCH v2 13/13] CHANGELOG: Add Intel HWP entry
Thread-Index: AQHYrO+y52qVsVi890iQZz0G1Doa+62pQ74AgABNzICAAAx+oA==
Date: Thu, 11 Aug 2022 12:16:09 +0000
Message-ID:
 <AS8PR08MB7991A292BAC47CC3C1EB51C992649@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
 <20220810192944.102135-14-jandryuk@gmail.com>
 <dff3fc03-8d94-7ca0-512a-501ed71dcc48@suse.com>
 <CAKf6xpsrTsmUj9+EO31FvY5xB+fnsH8PvQm868s5xO8tcG-OJQ@mail.gmail.com>
In-Reply-To:
 <CAKf6xpsrTsmUj9+EO31FvY5xB+fnsH8PvQm868s5xO8tcG-OJQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CA7EE8F3C1F34745B45FE8C820A77389.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: af2465a2-e7a9-42f0-928c-08da7b934bf8
x-ms-traffictypediagnostic:
	HE1PR0802MB2249:EE_|VE1EUR03FT010:EE_|AS8PR08MB6792:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hYQTSyhE2fZtKrXnWn5qVW7irTJiiG+VTg37FH8hcuonl/eqyDQrpjAzjkRZcOZhpokU60FdavmrKTAdH4YH60dl2ABZ9eGKof1w7G9CGVGWRdWQPqK6zqmwaGprn8Mp0TSP9LhWz1b27kvwRpmARs9+TBny2u6n4qyX7VjI11Bt60oNOLNPAvjVudKptsKEgMslEeYZ1WXwKHr1HMxK8S/SgsmLT/IVFRYT9/IcIRma+vOLmQYcWVON53ecIkIkZETQXol11JowURpZjYg9GdVQ+NYbqhDbYZhgmV7k87FU5MCZ/iML/7M28XS+X1lAAC/Ft+OgkKjDDFXMNsNqd4rQInfw3svWAjOVzShOEcH77vNRXKcNyfKYGzi6SzIp2MIzpoxvNpjkMypcW4HOSqANq6KnRH3rzQ5tZ8cx1DRY8xCEcxXSygpMndH/lNtDoqmnu4zdoyALIMj4pWZEQmQN0zxOz9Mah+MkaO5jsjinRfHU83qSULckxmzGo27PPk+gqC5EP/bZHm+MvvJUPKBy/F/n1VHs6cC9fORfiiNp84TKl0FWep6vYIX/nYN42Why5gCt9SxyeCupg1yooTEVPWOzD63wq1bIHORLOgPIXTZ94pWj/SGIRjxUNjeOnbii3QGMsKD7IuuFHGdAakeVGeJB9DDKgU0QSRsSeCb4ialYpIOc87uWipcDt3BGbukqEFAChCBU6aqKXSCSOkf0pmAZURN5urDzEgcivGB1Hb2JqxTJwW/T+YG9DeYAO6BQhcPMTTMkMoiZ7kbzM7mpHLulNP25EfMh9HTrwqTbgkRvEu53YD5s1adZy3poitMlxWZImmqBx82kr1HTzMzDtZb9XhOlMLRkalGCXTUtCQSn+pjkiOSKTs8kN38m
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(186003)(26005)(8676002)(66476007)(9686003)(66556008)(38070700005)(316002)(64756008)(76116006)(4326008)(66946007)(7696005)(6506007)(55016003)(54906003)(86362001)(66446008)(8936002)(71200400001)(41300700001)(478600001)(83380400001)(6916009)(122000001)(558084003)(52536014)(2906002)(38100700002)(33656002)(5660300002)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2249
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f01a266c-c891-41d7-c2fc-08da7b934671
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fs/tdqIrPnZoSdi0tRXMLB6keDc3Rr97v0zGCq2y3apkGBKHrVuR3ePxtjHCLMNysD+mZe1PvQRbOyqNHBdpxD3beK7JaMuiT48waGnoPFvhlM3iHq+WKc+hM3R15sRzSVXXwbZlSsSwayolazw5DNY10fZ+9l0STxYuKzO6Z8APKM5iujpNF77Ncqd1q9juNQl+OhYBLDRB32TbV9LyQnIbqmb++5lEXHEQaoowTCpdhA8+O9XLkwUSVRuTH42fCN2VbogYqm1xnuB7QJVtXbzILVEBRJ/351t8YtlZefL1aH9dhhhPBvK3Nio+FwflNKxRXCVQoSAC/s1jwmO4MgWs7o2tj079rn6bUbQWdcqsDAJwbjTVi1Z8T7kPpT0N/a25/XQ0y3J9Cr/B6YT0Cv6P2pRLICAVyiR6So98iKo1fpyQehCVAj1y/yinqxdVUp+MH18LSvxSnS0Qp3RZv4rgsVADBvBZ7woEttoAn2waXp+AUPGizU3nuEQXV319lUhoscHi1wLZS+vnwFMGEfY1s6kBeustav2K09mCpB2DxVGq7KckMtJ5TrklP6z8Q8P+Z8sfaQU9fXFpVMFFKws362sfcEzDF4a1WmJXVw+OSHt3522hZId2JpUKLG9TcSrjyUw+QAMMbY311wfkubBYsC+NLjB83x0aek8ZqyTzKuqrY/nZJ52uRULIZ5Z9EIK6oWKfvs+Pz5cbiMLj1QrIDyytMtirbj3X2wUH5yjDaO8ogqBTI5oitnG6Rl6sVlcQzFal+vm9WVct+2vlOPpualqscUv3KBlmj5SfqQrnlChTaT2CHnNCyn/NsVBsa2QxGb+8hL2dvNW21PgXvHIJjV1ko+Vfaq1Qe9LDWKXYGJkwlLpLVP9AtpR89tl4PTmblU8v2FXGrn9E8sevHw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(36840700001)(40470700004)(46966006)(6506007)(26005)(54906003)(86362001)(9686003)(186003)(7696005)(41300700001)(40460700003)(81166007)(83380400001)(107886003)(82740400003)(356005)(47076005)(4326008)(8676002)(36860700001)(82310400005)(33656002)(5660300002)(2906002)(8936002)(52536014)(336012)(6862004)(70206006)(558084003)(55016003)(70586007)(478600001)(40480700001)(316002)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 12:16:19.0243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af2465a2-e7a9-42f0-928c-08da7b934bf8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6792

SGkgSmFzb24sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24g
QW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPg0KPiBGb3IgdjMsIEknbGwgbW92ZSB0byB0aGUg
ZXhpc3Rpbmcgc2VjdGlvbiB3aGlsZSBrZWVwaW5nIEhlbnJ5J3MgQWNrLg0KDQpUaGFuayB5b3Uu
IEtlZXBpbmcgdGhlIEFjayBpcyBvayB0byBtZS4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0K
PiANCj4gUmVnYXJkcywNCj4gSmFzb24NCg==

