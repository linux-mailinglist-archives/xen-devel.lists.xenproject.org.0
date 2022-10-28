Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11E8611018
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 13:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432007.684693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNy6-0003qi-AW; Fri, 28 Oct 2022 11:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432007.684693; Fri, 28 Oct 2022 11:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNy6-0003oM-6R; Fri, 28 Oct 2022 11:56:10 +0000
Received: by outflank-mailman (input) for mailman id 432007;
 Fri, 28 Oct 2022 11:56:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l/aT=25=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ooNy4-0003oG-If
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 11:56:08 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150083.outbound.protection.outlook.com [40.107.15.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f1d2337-56b7-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 13:56:04 +0200 (CEST)
Received: from DB8P191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::34)
 by AM9PR08MB5970.eurprd08.prod.outlook.com (2603:10a6:20b:2df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Fri, 28 Oct
 2022 11:55:56 +0000
Received: from DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::34) by DB8P191CA0024.outlook.office365.com
 (2603:10a6:10:130::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 11:55:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT010.mail.protection.outlook.com (100.127.142.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 11:55:55 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Fri, 28 Oct 2022 11:55:55 +0000
Received: from 7e4ee9490ce8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF40AAEA-37B7-4863-B99F-53A77B3D631E.1; 
 Fri, 28 Oct 2022 11:55:48 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7e4ee9490ce8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 28 Oct 2022 11:55:48 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8447.eurprd08.prod.outlook.com (2603:10a6:10:405::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 28 Oct
 2022 11:55:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 11:55:46 +0000
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
X-Inumbo-ID: 7f1d2337-56b7-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Z2EIMAlzEHtu214+Dyn3LUnKSy5+YK/uW4NK/00GYnRyUPJsW97AWO+1hyek0lcARO7uDN/kUGqzaeL0xKngCce7EJ4LB2XnI9WPYhr5Ihd6CWSlQi65yYsD7cH3YyQ18jfw4msbX6yiLbTszxOpl1mk9qnhjxZWlvka1S/hTL4AVQuAfpy31I5dfsWxh7xW0pifKBBIhEUdGGlN1A4c6vKGZvdcABSrUsYBRHWI7kzQPd2KQH80NtVmTOn8WDRD+K5Cs8+ymHBCp2m/92JrTqRdm3qj2Q6qB/EvxnHvP1/cynFPXF/XYc9vBxt8/d1rWgV3ytyxAcpB9a3+Gbvegw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6/2DQd+DmjhFWR4GvW5JmeTYQEWBBIX1FQTBHmz/AI=;
 b=lNVuEo9jEHFvqSs9Oc8bkzaW03eXOpBXQwYLTxw2JPM1MLyHX2WUP3H5p9enq4OU4fYnHc+9ibJEOWitgMqpTHKAna1BvH7VvCRKx2CXMwqrkd3Dbaop4ia1KOE/Le+s9YTwolDlMJgFFMOAfj05zWSaA8UoxGQfVIB0OOI87yFjoB+F6vPdmtFKM4oR+hpiVfJ+AIxtUbAZDe9c3NEC+dhaGGporC6ZkDmNFkv1uKjSCUmXarOmOu1b7hzoaXGII3GBzc+AqMbQcxXSJTIsMnnyvl4f4lBS7psWel+ZuQRR7UscRgD1CVSwDYLoNGajR520kPeU79vwOwuWzft9rA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6/2DQd+DmjhFWR4GvW5JmeTYQEWBBIX1FQTBHmz/AI=;
 b=jDTApxOHKMg5HYKTXJZKJBjYTuseUeFYUU6ILC5BcfyNV1pfOqWoxzwYFi5STSTmU/0FLVYdhCgpQVMgpC0+aZv7BHbWFaEksc2sMUciE3QkWeSL5qsWxMZ27V6hMr8+6EufAIhDrCXxE+wBlaxxfl0LXwfubGnjTiMVdomRu5Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8b979c5e8a1c298a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6Z4UcOLpwPLDSHPAcJKS5aB3ifBRMTYupPodjCG4/xDUViMTAcZV0HJ6EPWoHw995SIvJrFRsbQjyUjpQdM4/5n0P+DKpVsx/o/cby+7x3ZNB/9eYzJgRICicuTROdX0ogjJeO7lvRf9cRi2pLo9QrXsuZDs4LygfyNiAqNNXR24H2DXNUitPK7AVpEUk7NmfxJ6tEGDmou6c1oGV9hYJ1i4NVHmtBIgQ3h2F3Nvbf6G9cKMZ1bSoAdNueySIurXv9JuaPy0AOP8GaMsKBP+P2es3Y2bb0cBCvslAEMEn9rMvUXferjlwaflS+4BQ2QyhkkhWFKoIihyBLQQ2jAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6/2DQd+DmjhFWR4GvW5JmeTYQEWBBIX1FQTBHmz/AI=;
 b=PwY1clf3+l63HrM9vnaAVFt2Vgu1XVUGI17j9KH99KgjiQzemaCV0Fh7Dt3KIpUz8bpbRzrSdJtbBHg/zgZFJEK4/dH0J+Fl4fZIar3N6+BEoXD91bOQvRy4y5zZw3kcxXlQ/Yxd0IuGF2ZMTimUCC5LNkRq2d9XSS/dhIOqwvwJSsYMzLeYsBtHMeUhkEojwwrNhq5vcUH6LjSpLsS71iStQ02bOJJRCwILyhOOhz7t+GzX5+R8qwaxzITUVK8DImFvv+fd54Rxs7/3YCFkSQS6uQNLAQXo6sd0HIIqTeDo5kb8CrQZFBBZdfKxuNctqVdqXRLV3U4/fBR31ylqSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6/2DQd+DmjhFWR4GvW5JmeTYQEWBBIX1FQTBHmz/AI=;
 b=jDTApxOHKMg5HYKTXJZKJBjYTuseUeFYUU6ILC5BcfyNV1pfOqWoxzwYFi5STSTmU/0FLVYdhCgpQVMgpC0+aZv7BHbWFaEksc2sMUciE3QkWeSL5qsWxMZ27V6hMr8+6EufAIhDrCXxE+wBlaxxfl0LXwfubGnjTiMVdomRu5Y=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 0/3][4.17?] x86/pv-shim: ballooning fixes
Thread-Topic: [PATCH 0/3][4.17?] x86/pv-shim: ballooning fixes
Thread-Index: AQHY6p25/bekYaAjhk+9l2kl41e6864jprOAgAAL158=
Date: Fri, 28 Oct 2022 11:55:46 +0000
Message-ID:
 <AS8PR08MB7991AB7CE4A56EFAB36708D892329@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <2398b0e8-ea5f-dc8e-46d8-2d3994a98b34@suse.com>
 <e8e062ac-5791-2f72-ba35-d8f86e452fa0@citrix.com>
In-Reply-To: <e8e062ac-5791-2f72-ba35-d8f86e452fa0@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8447:EE_|DBAEUR03FT010:EE_|AM9PR08MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e88d0b-eaf7-460f-4549-08dab8db5edd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 T6WGy3WQuX3UNNNdrVKoLNYYbq650kmN6svKPQ1lPQsA78xgGWRBNAz7kIK9iBYUFTs7PLOZrKEZvyuXFZjxC7Ydcw329xMHlKpM+W1BqvuiK4vSQWBFQ9hJEau+PEtOfwzV5hF4pSbXgO2c/WROuL7CXhCr57STNBK7j9NVgnvjoN4c6RwvKH9v+lgEA4NHTH7nKA/XjmL5lrPSaRfK2F1b4SaGsUx364vxT8uEM42LE6d+rzX1ctzyxYda76OQhQN/rQBeayTxKM3/aFOlJVd036Cw24XGBSdTQYAvheZ3BOHU14mOoe1yLJU8qI9MT2NBkgGLMB+6VZkgobAaDxrNl/E4/7vb0cJafigtUoQTYJeV1KWL7JZszkM+UYpNOqLPIMcejeKkRGYCJ2KUjGwspgdG7O/pXbgokxJdSXEYwmFTSDw7KO4+LlFApEcPCdRDrsxVdT1xI57e6jyKXChq1IhM0NlVprz+Q8ifL8bzSOO2AbvnI3c2Y+xpRRDmQMPRDnIPLp4uWWFSAyb19y2swMs3mqxmFe5wGjFFBEIS85dAhqMRmd+/iSht5ZBC92452D2fC33Tvdj1Yxcqzk+gnLCc0w2oN+Yz8/c3eidw4sQ7BcKqlj87UGfzAtwmY+YkTJNby3zIUJU4ysP4wlMtLcu6mdqn6eJHDapMMJg/o7W8tkhBZiKBQ1xiJYZ56u/yvsKYGCGMCySSVTSL1dmEWxLY2vnhH896PN76ieIHU1ByIIaMDF6xnVsCu1wiNkJRPgg5N4FpUIrr9dg275NUMpQSSTX1GgC9uHjgWcM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199015)(33656002)(166002)(38100700002)(86362001)(122000001)(6506007)(5660300002)(4326008)(9686003)(55016003)(186003)(83380400001)(53546011)(7696005)(54906003)(316002)(38070700005)(2906002)(45080400002)(478600001)(8936002)(52536014)(76116006)(66446008)(110136005)(41300700001)(64756008)(66946007)(66556008)(66476007)(71200400001)(91956017)(8676002);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_AS8PR08MB7991AB7CE4A56EFAB36708D892329AS8PR08MB7991eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8447
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ee5db84-3c50-4087-a13b-08dab8db596a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nZ5y7u/t/T0Q00RNuAZzatkSfeOJktmdXvMZZkXjcnGTsFbedSeddW3HAcMrD6skH+sjASrrqVPrbLh1ws9ZYixPR4pxYAYTy0hXQFClD+btwgfMRjuZSpsCX83kS6d2vpjbaOUga7j+VWhaxw577uewKwYpv32pQk8T8mLpGD3pS7ZlJw1N97oVcuOWFDDtv8rFKPHCurUanLZYP7YgdmhUYfM/hKwBbo2ggyONPb50MpJvTNFGdLytnaDGuGmrq8mrtpBNZaB45dCLMFejbLtzl0TGyaFuPP+bl+MTJ3hfsARIxl2jfK2EnIkEfmLYnuSm854QOOMXJGYejTRDvNJ6LecqPZ4DDEvc6u84552+IZjmg/8U6oMB1SoKPi+7GBTXQCq9q7HWeFfOFSmdj7laG/1dhNgt5/Qax7DVksSi32WyFHSJ+zwUK3i3dwcbgecjEXkdTcKmN2HpKdo9HnR2VAdNj32/D9rBSpG2ulvndfq3HH/PE7UreduJh2Gl1zdlOkijzHr179Q+kqJWNNtumVYVh72c7xODNi9vsW3EspaVe1x/ePOL0oE0xcInLhtbLBWLY8jiKVcV0tsuyG0AeY2SYN4LD5Pkx9lPkr3wnnis46Kw9g4BEWGeNmmv9YDrKjYwERhxbUROgvqgHrn3UtbCO4Eow3LES8rESZEt4Y9E8WDEUiIb+GtSRbWFxOBV/fKfie1hoy0u6dIMUppK/eIvdQRE/34gP8K704r8p2SZaXzpPaYY/ihrtVaj2HXwz1i1q67QOgd1ZU3bso3VSLDPmBzGqK4Myb2fEHc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(55016003)(47076005)(54906003)(166002)(356005)(8676002)(41300700001)(9686003)(83380400001)(86362001)(81166007)(36860700001)(33656002)(82740400003)(2906002)(5660300002)(70206006)(52536014)(4326008)(70586007)(82310400005)(107886003)(7696005)(6506007)(53546011)(45080400002)(186003)(336012)(26005)(40460700003)(110136005)(8936002)(316002)(478600001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 11:55:55.5254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e88d0b-eaf7-460f-4549-08dab8db5edd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5970

--_000_AS8PR08MB7991AB7CE4A56EFAB36708D892329AS8PR08MB7991eurp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQW5kcmV3IGFuZCBKYW4sDQoNClNvcnJ5IGZvciB0b3AgcG9zdGluZywgSSBkb24ndCByZWFs
bHkgd2FudCB0byBibG9jayB0aGlzIHNlcmllcyBzbyBJIGFtIGFuc3dlcmluZyB0aGlzIG9uIG15
IHBob25lLg0KDQpJIHNhdyBBbmRyZXcgcHJvdmlkZWQgaGlzIGFjaywgc2luY2UgdGhpcyBzZXJp
ZXMgaXMgcG9ydGVkIGZyb20gWGVuU2VydmVyIGFuZCBzaG91bGQgYmUgaW5jbHVkZWQgaW4gNC4x
Ny4NCg0KUmVsZWFzZS1hY2tlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPg0K
DQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQq78cihIE91dGxvb2sgZm9yIGlPUzxodHRwczovL2Fr
YS5tcy9vMHVrZWY+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBB
bmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPg0Kt6LLzcqxvOQ6INDHxtrO
5Swgyq7UwiAyOCwgMjAyMiAxOToxMQ0KytW8/sjLOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcgPHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZz4NCrOty806IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29t
PjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPg0K1vfM4jogUmU6IFtQ
QVRDSCAwLzNdWzQuMTc/XSB4ODYvcHYtc2hpbTogYmFsbG9vbmluZyBmaXhlcw0KDQpPbiAyOC8x
MC8yMDIyIDA4OjIwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gVGhlc2UgcGF0Y2hlcyBoYXZlIChh
cyBhIHNpbmdsZSwgbW9ub2xpdGhpYyBvbmUpIGJlZW4gbGl2aW5nIGluDQo+IHRoZSBYZW5TZXJ2
ZXIgcGF0Y2ggcXVldWUgZm9yIHF1aXRlIHNvbWUgdGltZS4gV2hpbGUgcHJlcGFyaW5nIGZvcg0K
PiB0aGlzIHVwc3RyZWFtIHN1Ym1pc3Npb24sIEkndmUgbGVmdCB0aGUgY29kZSBsYXJnZWx5IGFz
IGlzIChvbmx5IGENCj4gZmV3IGNvc21ldGljIGFkanVzdG1lbnRzLCBidXQgbm8gZnVuY3Rpb25h
bCBjaGFuZ2VzKSwgc28gdGhlIHNlcmllcw0KPiBjYW4gYmUgYXNzdW1lZCB0byBoYXZlIGJlZW4g
cHJvcGVybHkgdGVzdGVkLiBXaGF0IEkgZGlkIGZ1bGx5IGFsdGVyDQo+IHRob3VnaCBhcmUgdGhl
IGRlc2NyaXB0aW9ucy4NCj4NCj4gMTogY29ycmVjdGx5IGlnbm9yZSBlbXB0eSBvbmxpbmluZyBy
ZXF1ZXN0cw0KPiAyOiBjb3JyZWN0IGJhbGxvb25pbmcgdXAgZm9yIGNvbXBhdCBndWVzdHMNCj4g
MzogY29ycmVjdCBiYWxsb29uaW5nIGRvd24gZm9yIGNvbXBhdCBndWVzdHMNCg0KVGhhbmtzIGZv
ciBkb2luZyB0aGlzLiAgRnJvbSBvdXIgc2lkZSwgdGhleSBhbGwgY2FtZSBmcm9tIHRlc3Rpbmcg
d2hlcmUNCndlIHRvb2sgb3VyIGV4aXN0aW5nIFBWIGd1ZXN0IHRlc3RzIGFuZCByYW4gdGhlIGd1
ZXN0cyBzaGltbWVkLg0KDQpJJ20gcmVhc29uYWJseSBzdXJlIHRoZXJlIGFyZSBtb3JlIGlzc3Vl
cyBsdXJraW5nLCBidXQgdGhpcyBpcw0KZGVmaW5pdGVseSBhbiBpbXByb3ZlbWVudCBvbiBpdHMg
b3duLg0KDQpUaGV5IHdhbnQgYmFja3BvcnRpbmcgKGluIGR1ZSBjb3Vyc2UpLCBzbyBzaG91bGQg
YmUgY29uc2lkZXJlZCBmb3IgNC4xNw0Kc2VlaW5nIGFzIHRoZXkncmUgcmVhZHkgbm93Lg0KDQpB
Y2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0K

--_000_AS8PR08MB7991AB7CE4A56EFAB36708D892329AS8PR08MB7991eurp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
</head>
<body>
<div dir=3D"ltr">
<div></div>
<div>
<div>Hi Andrew and Jan,</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Sorry for top posting, I don't really want to block this s=
eries so I am answering this on my phone.&nbsp;</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">I saw Andrew provided his ack, since this series is ported=
 from XenServer and should be included in 4.17.</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr"><span style=3D"caret-color:rgb(33, 33, 33);color:rgb(33, 3=
3, 33);font-size:14.666667px;display:inline !important">Release-acked-by: H=
enry Wang &lt;</span><span dir=3D"ltr" style=3D"color:rgb(0, 120, 212);font=
-size:14.666667px">Henry.Wang@arm.com</span><span style=3D"caret-color:rgb(=
33, 33, 33);color:rgb(33, 33, 33);font-size:14.666667px;display:inline !imp=
ortant">&gt;</span><br style=3D"caret-color:rgb(33, 33, 33);color:rgb(33, 3=
3, 33);font-size:14.666667px">
<br style=3D"caret-color:rgb(33, 33, 33);color:rgb(33, 33, 33);font-size:14=
.666667px">
<span style=3D"caret-color:rgb(33, 33, 33);color:rgb(33, 33, 33);font-size:=
14.666667px;display:inline !important">Kind regards,</span><br style=3D"car=
et-color:rgb(33, 33, 33);color:rgb(33, 33, 33);font-size:14.666667px">
<span style=3D"caret-color:rgb(33, 33, 33);color:rgb(33, 33, 33);font-size:=
14.666667px;display:inline !important">Henry</span><br>
</div>
<div id=3D"ms-outlook-mobile-signature">
<div><br>
</div>
=BB=F1=C8=A1 <a href=3D"https://aka.ms/o0ukef">Outlook for iOS</a></div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif"><b=
>=B7=A2=BC=FE=C8=CB:</b> Andrew Cooper &lt;Andrew.Cooper3@citrix.com&gt;<br=
>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> =D0=C7=C6=DA=CE=E5, =CA=AE=D4=C2 28, 2022 =
19:11<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Jan Beulich &lt;jbeulich@suse.com&gt;; xen-devel=
@lists.xenproject.org &lt;xen-devel@lists.xenproject.org&gt;<br>
<b>=B3=AD=CB=CD:</b> Wei Liu &lt;wl@xen.org&gt;; Roger Pau Monne &lt;roger.=
pau@citrix.com&gt;; Henry Wang &lt;Henry.Wang@arm.com&gt;; George Dunlap &l=
t;George.Dunlap@citrix.com&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: [PATCH 0/3][4.17?] x86/pv-shim: ballooning fixes
<div>&nbsp;</div>
</font></div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 28/10/2022 08:20, Jan Beulich wrote:<br>
&gt; These patches have (as a single, monolithic one) been living in<br>
&gt; the XenServer patch queue for quite some time. While preparing for<br>
&gt; this upstream submission, I've left the code largely as is (only a<br>
&gt; few cosmetic adjustments, but no functional changes), so the series<br=
>
&gt; can be assumed to have been properly tested. What I did fully alter<br=
>
&gt; though are the descriptions.<br>
&gt;<br>
&gt; 1: correctly ignore empty onlining requests<br>
&gt; 2: correct ballooning up for compat guests<br>
&gt; 3: correct ballooning down for compat guests<br>
<br>
Thanks for doing this.&nbsp; From our side, they all came from testing wher=
e<br>
we took our existing PV guest tests and ran the guests shimmed.<br>
<br>
I'm reasonably sure there are more issues lurking, but this is<br>
definitely an improvement on its own.<br>
<br>
They want backporting (in due course), so should be considered for 4.17<br>
seeing as they're ready now.<br>
<br>
Acked-by: Andrew Cooper &lt;andrew.cooper3@citrix.com&gt;<br>
<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_AS8PR08MB7991AB7CE4A56EFAB36708D892329AS8PR08MB7991eurp_--

