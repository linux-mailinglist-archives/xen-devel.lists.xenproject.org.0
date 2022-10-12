Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F045FC8D1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 18:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421293.666531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oieAF-0002kP-Ef; Wed, 12 Oct 2022 16:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421293.666531; Wed, 12 Oct 2022 16:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oieAF-0002hS-BX; Wed, 12 Oct 2022 16:00:59 +0000
Received: by outflank-mailman (input) for mailman id 421293;
 Wed, 12 Oct 2022 16:00:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5J4o=2N=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oieAD-0002hK-ON
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 16:00:57 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2051.outbound.protection.outlook.com [40.107.247.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d773edc-4a47-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 18:00:55 +0200 (CEST)
Received: from AS9PR06CA0251.eurprd06.prod.outlook.com (2603:10a6:20b:45f::28)
 by DB9PR08MB6395.eurprd08.prod.outlook.com (2603:10a6:10:254::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Wed, 12 Oct
 2022 16:00:53 +0000
Received: from AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::73) by AS9PR06CA0251.outlook.office365.com
 (2603:10a6:20b:45f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Wed, 12 Oct 2022 16:00:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT008.mail.protection.outlook.com (100.127.141.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 12 Oct 2022 16:00:52 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Wed, 12 Oct 2022 16:00:52 +0000
Received: from c90ab0f8abfe.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5638B540-F85C-4277-B113-BB91BBFDE712.1; 
 Wed, 12 Oct 2022 16:00:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c90ab0f8abfe.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Oct 2022 16:00:45 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DU0PR08MB8833.eurprd08.prod.outlook.com (2603:10a6:10:478::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 16:00:43 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5709.019; Wed, 12 Oct 2022
 16:00:42 +0000
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
X-Inumbo-ID: 0d773edc-4a47-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MdPvL+kpX2h/+ryoEJg9UnIqRWkf2Bz+kTuMSMYZwcwTnK75TIBYtFoKUAk2k5F3/JpQ77dv8+iCYQLToRLO3DTfBGB7fjnSOP5d7dqsOXUOQdnt1ltJrmsoDmaCLFFMEPij63gDa55c/ck7dKoK2hgBcI5sS2yjrmsn+CEI9e6GkWGVLfCcQpWVQwsDyyOIWBSa1sFDw18qpOFcFVBfTmrUrXFuYKdelxl06k7R2hq+dtFEy8Bsn4ANIXQp+htiudx8oJuxcDeGtQUAsqUbiO/OJIN3CsKDUN+oOwaH1l+orhwn1/zy8iTWJYFZZ45F4/6FUt+lP8fKlCeSTJtyVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSswIpNmi9PEvZthD1AbpwbfzH8zN6F0xboMfvxc098=;
 b=SRFwN0CklAhFo1qMRzz1/eVl+Hbq05g3BaP9eYUK3kQQaup9Buc6x6QzK9WC2rOE55OcOeC9gNhl4p6EXdIsUTrQ1QXBhvXlbMtLgMlnm32VioMq+8/VFld+SHkJDMLFyvaxTqUD/CgOEQeyHO4GYRIA7xqIF9MBWCvUHSNoCEQtJ5IddEw54HsQRrzXuFLN6iTT4IrFNkR/fUtS30LNN1dXe8ifZdFM8wR3UaAmryLWVj4Ym5SXcAmYPnxCDozEjGQluV8K0fgactNyLUDlPjLvefQSKEQv81KteEF6mxODaWivFwRISolR7XU5b0Z1/r5LVOcI7b2JLrNXxBqCxQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSswIpNmi9PEvZthD1AbpwbfzH8zN6F0xboMfvxc098=;
 b=5x0qoZjZewrgPRX3VyO7OsQ7h2zJf+pOQSeDxeovkRxfFMfVkyGruzqqarYusqEOIWXHmHQwLm7rLHlztlC8bfjAboOo3jrVY6BmXb30NAtYXoQWc6BYViPQPZzODAbocQgyyRobV5f/6xTdLzDiDxsO3drTac0VVMJz/48ynHA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e50c923e1d06f4e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWaffIKvsJ8zEdl1PzyukLSkAdGa3iEz1TmD9hPIXBdJ98BNM6bIhjPfr+JX3b85u1pgQZZZGYIKXZtg72M8wgdOCgiWqzuSx06zDeIP7b+iRMYI5H4l6L2fyfzNl5Q1VhTRAR6k0unXekkCkDLCOFQMY3xyYQR/BGeZUkup7gTI4RQo+8EL4bIHTOWe+LCw/Ph1tFCxAjy/qctB5JZ1Rwm0rpeaEP8ji40B/FyutCkGVgIUBXw+qHdpJx5Lbxnfknm1DGvqF8vZAHunDZ8CnCcuZweIWeXiLx0UpY5aWYgZaAzFmkBzeTWgAvxwmTSw13Z2Rc4Q6NA/k7D5Mn6BNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSswIpNmi9PEvZthD1AbpwbfzH8zN6F0xboMfvxc098=;
 b=lHW+Q7rnmimhHbQf1hZ4dtmkBdYIauhTzsleDXW5GNuVhr73bhQrcBvibUMVABDphjRYwZwbMvJIkYPSJyA2PH+7oDE+piH8m1cOUwWv6x7i1seAjnIYO88PyoZ2PuilEBvhcHPV/XWfKWSJBnT8aGDvoKY3fclVk6lTN+S0jSvjjzDdFLMABdoRL+/2or9hTVtHG6/sSH+RQfU8SOe4rK7p/OCAXo1rjxSNmiqGrbPkHlRpWKv9aoqOYLbSkjrHmN3B4mAO0/FL+cDa7YQtiXrV8ehO3cM9ra3y9gA6AU470yJVVL34PCO3n0Ds9E1YVm/dt4ypA3Yko5lEAE6WLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSswIpNmi9PEvZthD1AbpwbfzH8zN6F0xboMfvxc098=;
 b=5x0qoZjZewrgPRX3VyO7OsQ7h2zJf+pOQSeDxeovkRxfFMfVkyGruzqqarYusqEOIWXHmHQwLm7rLHlztlC8bfjAboOo3jrVY6BmXb30NAtYXoQWc6BYViPQPZzODAbocQgyyRobV5f/6xTdLzDiDxsO3drTac0VVMJz/48ynHA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Proposal for deviations in static analyser findings
Thread-Topic: Proposal for deviations in static analyser findings
Thread-Index: AQHY3lPHM2Tyba3hCkeKMW07GDOb2Q==
Date: Wed, 12 Oct 2022 16:00:41 +0000
Message-ID: <EBCDE6CE-A84A-48C7-B3C2-7856E5D2392B@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|DU0PR08MB8833:EE_|AM7EUR03FT008:EE_|DB9PR08MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: 84592cca-dc7a-4d48-88fc-08daac6af08d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZQ7m181cyyhG41gOIyWx1Nx4FRueFXqyZYSmtdDey8H3cStIlGz8OKcw2CM5nrQawFO0+6FDRmkXbijuD3AkQKPOStlgDzXMBo5hfMKwh3s4NZ5xTCDwc08amYc722qQnJhJdG/K921e90y7goVAoB72kad8DPymhNfe5a6pEsMBdJsZS127HZBZ8mY51cxDRBLHEWvnk3bHG8NHPcvM+opEm3WBIS68ioB1FR9nv4br8w4IqUNS0t77w3QZfY3ZETRyMEwZDNfffUVnkBoLXbV/8Hbr2rnbN7VXf/dLmBv+yb2x5ezQopJwBPZZ0zfha1YEyYw7FvC5vEmthkqV+7vsQTpwIDfL0jIIsbKOyB4s1jBaQ/+++wlVaPUNxT5RynGKWNy4ByHp+GNcWgk9u9PjJneNU8ExiD7+MlZCZDFEmSBuSkTm8VoK2L7EoQIGBCKMHG8p4WE6Opau5WCRrJqJVXp2cAPFWl6L+Ps1L0pmNfYG0YQc9mZJ6s6n31cMNpWohGdY8LGVwppd9Kbupl0g2p+J2sqM/p9lh3bQFcTGLGExW9F5/D8IzPM+gkIZNG9myNSVyUmo7bykaL6UZ6Rz9Ml/xaQCEMMLgn4wU3a9MY2dGiIFE5dhKtLoJiZqqf1wHb185SaK7QoIhFa1YRXxV/SmVF/x6sXFCWnFkYi02UAEXt9y29UWTDhXOPqB9tpPD1zp8Pomc9VwhkCUmF5/jIWQxp452hi6LeTNVyuRUjlkuN3byhcwAgB7BAP4Geb5pjAR4AD6e89V/VYsxs7sNNmhwt2feVDVPs2b/Io=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199015)(6506007)(6512007)(2616005)(478600001)(71200400001)(83380400001)(6486002)(26005)(38100700002)(86362001)(33656002)(186003)(38070700005)(36756003)(4326008)(66476007)(66446008)(8676002)(122000001)(6916009)(66556008)(54906003)(41300700001)(316002)(76116006)(91956017)(8936002)(5660300002)(64756008)(2906002)(66946007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C9806828DF30A47BC1A8C15B3940819@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8833
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7289db95-a23b-4fd1-37ba-08daac6ae9d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JhjYRIOMmRLZtIjpTu6Yr7ubn8Mr4h/XLsZuJ9nR/y/BqwcEtHKLaLOj2+doQ1Zk5qmEzZHo+6QuGCLQskz8bkzInEfOKA9yaSZcvNp3h2VaWKBjpCr2aK4OqXgkTpROwikYTN/YAxgfaq8/xsv+OtPWI5NhZoV3crMJhgRXPDmCamTLoCPH5OW23yHYnvO4eh8B17obs2mbYcF07GD7Yr6zmAHKMcdTthA9f3gzICVrmC3ZxeGYdEMW6qgSGEjD5LhRk8DqXWorKPEctKkTHrA5cAdZBolmKGgMKVm2DlqPrWT4UOPej6x1gU8lrh5R1XHkd46miiPgFWEo6cs8HIWSqQND3PPszUDm9mVq4K39is1RDXpr+UrVXRM+O9rQjwpVqcoxh/NnAt1lLR0S0f4yYKufLpsWcAk0jGF5b6K+qbWQS9UVPkszbbXFETSN94K0KoQflGLb7+8XzEXIErCYYPnc229fCocv5rBt8CjDfZx6ili+i5iSZ9o0++eq5SifmHuGHTsT9vVl/fGDqBb9EXqH3NdL5x5tugfWeXtUUU1LBTB9ehgg2RZyHY6rSQjnQP6ShdV6c82H9nbJzQmm1EIMumFBS00Kzlf3Gtk9AKhlmZ12NWlQbPWQr0ksB0Z/1W1UVVipFToskHpvNMpycHs2VNBWUzFi7As7OXZ3pfYqC4CvXmVYcxomRFEbh75/PnfQD07Vit/rjpJBk+IK3x1aL9N6Ya94xM5AzkH65MdY4IBLPTwMmgr/y7rC0L2HATnR0oMgOczEILn4wQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(33656002)(36756003)(82310400005)(41300700001)(2616005)(6486002)(26005)(6506007)(6512007)(70586007)(70206006)(8676002)(478600001)(4326008)(82740400003)(356005)(81166007)(40460700003)(86362001)(336012)(186003)(5660300002)(8936002)(83380400001)(47076005)(6916009)(54906003)(2906002)(316002)(107886003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 16:00:52.7883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84592cca-dc7a-4d48-88fc-08daac6af08d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6395

SGkgYWxsLA0KDQpIZXJlIGlzIGEgcHJvcG9zYWwgdG8gY3JlYXRlIGEgZGV2aWF0aW9uIHN5c3Rl
bSBmb3IgYWxsIHRoZSBzdGF0aWMgYW5hbHlzZXIgZmluZGluZyBmcm9tDQpib3RoIGdlbmVyaWMg
c3RhdGljIGNvZGUgY2hlY2tlcnMgYW5kIE1JU1JBIGNvbXBsaWFuY2UsIGFzIHNhaWQgYmVmb3Jl
LCB0aGVyZSBtaWdodA0KYmUgc29tZSBjYXNlIHdoZXJlIHdlIHdvbuKAmXQgZml4IGEgcGFydCBv
ZiB0aGUgY29kZSBiZWNhdXNlIHRoZSB3YXkgaXQgaXMgd3JpdHRlbiBpcw0Kc2FmZXIgdGhhbiB0
aGUgcHJvcG9zZWQgZml4IGZyb20gdGhlIHRvb2wgb3IgY29kaW5nIGd1aWRhbmNlLg0KDQpUaGUg
cHJvcG9zZWQgdGFncyB3aWxsIGJlIHRyYW5zbGF0ZWQgYnkgYSB0b29sIGR1cmluZyB0aGUgYW5h
bHlzaXMsIHVzaW5nIHRoZSBkYXRhYmFzZSAoSlNPTiBmaWxlKSByZXBvcnRlZCBiZWxvdywNCnRo
ZSBhbmFseXNpcyBzdGVwcyB3aWxsIGJlOg0KMSkgdHJhbnNsYXRlIHRoZSDigJxYZW4gY29kZWJh
c2UgaW4tY29kZSBjb21tZW50IHRhZ3PigJ0gdG8gdGhlIHByb3ByaWV0YXJ5IHN5bnRheCBvZiB0
aGUgY2hvc2VuIHRvb2wgaW4gdGhlIHNvdXJjZSBjb2RlLg0KMikgcGVyZm9ybSB0aGUgYW5hbHlz
aXMgYW5kIHByb2R1Y2UgYSByZXBvcnQNCjMpIHJldmVydCBiYWNrIHRoZSBzb3VyY2UgY29kZSB0
byB0aGUgb3JpZ2luYWwuDQoNClRoZSBwcm9wb3NhbCBpbmNsdWRlcyBhbHNvIGZlZWRiYWNrcyBm
cm9tIHRoZSBkZXNpZ24gc2Vzc2lvbiBhYm91dCBGdVNhIGhlbGQgYXQgdGhlIFhlbiBTdW1taXQg
MjAyMi4NCg0KDQpEb2N1bWVudGluZyB2aW9sYXRpb25zDQo9PT09PT09PT09PT09PT09PT09PT09
DQoNClN0YXRpYyBhbmFseXNlcnMgYXJlIHVzZWQgb24gdGhlIFhlbiBjb2RlYmFzZSBmb3IgYm90
aCBzdGF0aWMgYW5hbHlzaXMgYW5kIE1JU1JBDQpjb21wbGlhbmNlLg0KVGhlcmUgbWlnaHQgYmUg
dGhlIG5lZWQgdG8gc3VwcHJlc3Mgc29tZSBmaW5kaW5ncyBpbnN0ZWFkIG9mIGZpeGluZyB0aGVt
IGFuZA0KbWFueSB0b29scyBwZXJtaXQgdGhlIHVzYWdlIG9mIGluLWNvZGUgY29tbWVudHMgdGhh
dCBzdXBwcmVzcyBmaW5kaW5ncyBzbyB0aGF0DQp0aGV5IGFyZSBub3Qgc2hvd24gaW4gdGhlIGZp
bmFsIHJlcG9ydC4NCg0KWGVuIGluY2x1ZGVzIGEgdG9vbCBjYXBhYmxlIG9mIHRyYW5zbGF0aW5n
IGEgc3BlY2lmaWMgY29tbWVudCB1c2VkIGluIGl0cw0KY29kZWJhc2UgdG8gdGhlIHJpZ2h0IHBy
b3ByaWV0YXJ5IGluLWNvZGUgY29tbWVudCB1bmRlcnN0YW5kYWJsZSBieSB0aGUgc2VsZWN0ZWQN
CmFuYWx5c2VyIHRoYXQgc3VwcHJlc3MgaXRzIGZpbmRpbmcuDQoNCkluIHRoZSBYZW4gY29kZWJh
c2UsIHRoZXNlIHRhZ3Mgd2lsbCBiZSB1c2VkIHRvIGRvY3VtZW50IGFuZCBzdXBwcmVzcyBmaW5k
aW5nczoNCg0KLSBTQUYtWC1zYWZlOiBUaGlzIHRhZyBtZWFucyB0aGF0IHRoZSBuZXh0IGxpbmUg
b2YgY29kZSBjb250YWlucyBhIGZpbmRpbmcsIGJ1dA0KICB0aGUgbm9uIGNvbXBsaWFuY2UgdG8g
dGhlIGNoZWNrZXIgaXMgYW5hbHlzZWQgYW5kIGRlbW9uc3RyYXRlZCB0byBiZSBzYWZlLg0KLSBT
QUYtWC1mYWxzZS1wb3NpdGl2ZTogVGhpcyB0YWcgbWVhbnMgdGhhdCB0aGUgbmV4dCBsaW5lIG9m
IGNvZGUgY29udGFpbnMgYQ0KICBmaW5kaW5nLCBidXQgdGhlIGZpbmRpbmcgaXMgYSBidWcgb2Yg
dGhlIHRvb2wuDQoNClNBRiBzdGFuZHMgZm9yIFN0YXRpYyBBbmFseXNlciBGaW5kaW5nLCB0aGUg
WCBpcyBhIHBsYWNlaG9sZGVyIGZvciBhIHBvc2l0aXZlDQpudW1iZXIgdGhhdCBzdGFydHMgZnJv
bSB6ZXJvLCB0aGUgbnVtYmVyIGFmdGVyIFNBRi0gc2hhbGwgYmUgaW5jcmVtZW50YWwgYW5kDQp1
bmlxdWUuDQoNCkVudHJpZXMgaW4gdGhlIGRhdGFiYXNlIHNob3VsZCBuZXZlciBiZSByZW1vdmVk
LCBldmVuIGlmIHRoZXkgYXJlIG5vdCB1c2VkDQphbnltb3JlIGluIHRoZSBjb2RlIChpZiBhIHBh
dGNoIGlzIHJlbW92aW5nIG9yIG1vZGlmeWluZyB0aGUgZmF1bHR5IGxpbmUpLg0KVGhpcyBpcyB0
byBtYWtlIHN1cmUgdGhhdCBudW1iZXJzIGFyZSBub3QgcmV1c2VkIHdoaWNoIGNvdWxkIGxlYWQg
dG8gY29uZmxpY3RzDQp3aXRoIG9sZCBicmFuY2hlcyBvciBtaXNsZWFkaW5nIGp1c3RpZmljYXRp
b25zLg0KDQpUaGUgZmlsZXMgd2hlcmUgdG8gc3RvcmUgYWxsIHRoZSBqdXN0aWZpY2F0aW9ucyBh
cmUgaW4geGVuL2RvY3MvbWlzcmEvIGFuZCBhcmUNCm5hbWVkIGFzIHNhZmUuanNvbiBhbmQgZmFs
c2UtcG9zaXRpdmUuanNvbiwgdGhleSBoYXZlIEpTT04gZm9ybWF0Lg0KDQpIZXJlIGlzIGFuIGV4
YW1wbGUgdG8gYWRkIGEgbmV3IGp1c3RpZmljYXRpb246Og0KDQp8ew0KfCAgICAidmVyc2lvbiI6
ICIxLjAiLA0KfCAgICAiY29udGVudCI6IFsNCnwgICAgICAgIHsNCnwgICAgICAgICAgICAiaWQi
OiJTQUYtMC1zYWZlIiwNCnwgICAgICAgICAgICAiYW5hbHlzZXIiOiB7DQp8ICAgICAgICAgICAg
ICAgICJjcHBjaGVjayI6ICJtaXNyYS1jMjAxMi0yMC43IiwNCnwgICAgICAgICAgICAgICAgImNv
dmVyaXR5IjogIm1pc3JhX2NfMjAxMl9ydWxlXzIwXzdfdmlvbGF0aW9uIiwNCnwgICAgICAgICAg
ICAgICAgImVjbGFpciI6ICJNQzNSMS5SMjAuNyINCnwgICAgICAgICAgICB9LA0KfCAgICAgICAg
ICAgICJuYW1lIjog4oCcUjIwLjcgQyBtYWNybyBwYXJhbWV0ZXJzIG5vdCB1c2VkIGFzIGV4cHJl
c3Npb24iLA0KfCAgICAgICAgICAgICJ0ZXh0IjogIlRoZSBtYWNybyBwYXJhbWV0ZXJzIHVzZWQg
aW4gdGhpcyBb4oCmXSINCnwgICAgICAgIH0sDQp8ICAgICAgICB7DQp8ICAgICAgICAgICAgImlk
IjrigJ1TQUYtMS1zYWZlIiwNCnwgICAgICAgICAgICAiYW5hbHlzZXIiOiB7DQp8ICAgICAgICAg
ICAgICAgICJjcHBjaGVjayI6ICJ1bnJlYWRWYXJpYWJsZSIsDQp8ICAgICAgICAgICAgICAgICJj
b3Zlcml0eSI6ICJVTlVTRURfVkFMVUUiDQp8ICAgICAgICAgICAgfSwNCnwgICAgICAgICAgICAi
bmFtZSI6IOKAnFZhcmlhYmxlIHNldCBidXQgbm90IHVzZWQiLA0KfCAgICAgICAgICAgICJ0ZXh0
Ijog4oCcSXQgaXMgc2FmZSBiZWNhdXNlIFvigKZdIg0KfCAgICAgICAgfSwNCnwgICAgICAgIHsN
CnwgICAgICAgICAgICAiaWQiOuKAnVNBRi0yLXNhZmUiLA0KfCAgICAgICAgICAgICJhbmFseXNl
ciI6IHt9LA0KfCAgICAgICAgICAgICJuYW1lIjogIlNlbnRpbmVsIiwNCnwgICAgICAgICAgICAi
dGV4dCI6ICIiDQp8ICAgICAgICB9DQp8ICAgIF0NCnx9DQoNClRvIGRvY3VtZW50IGEgZmluZGlu
ZywganVzdCBhZGQgYW5vdGhlciBibG9jayB7Wy4uLl19IGJlZm9yZSB0aGUgc2VudGluZWwgYmxv
Y2ssDQp1c2luZyB0aGUgaWQgY29udGFpbmVkIGluIHRoZSBzZW50aW5lbCBibG9jayBhbmQgaW5j
cmVtZW50IGJ5IG9uZSB0aGUgbnVtYmVyDQpjb250YWluZWQgaW4gdGhlIGlkIG9mIHRoZSBzZW50
aW5lbCBibG9jay4NCg0KSGVyZSBhIGJyaWVmIGV4cGxhbmF0aW9uIG9mIHRoZSBmaWVsZCBpbnNp
ZGUgYW4gb2JqZWN0IG9mIHRoZSAiY29udGVudCIgYXJyYXk6DQotIGlkOiBpdCBpcyBhIHVuaXF1
ZSBzdHJpbmcgdGhhdCBpcyB1c2VkIHRvIHJlZmVyIHRvIHRoZSBmaW5kaW5nLCBtYW55IGZpbmRp
bmcNCiAgY2FuIGJlIHRhZ2dlZCB3aXRoIHRoZSBzYW1lIGlkLCBpZiB0aGUganVzdGlmaWNhdGlv
biBob2xkcyBmb3IgYW55IGFwcGxpZWQNCiAgY2FzZS4NCiAgSXQgdGVsbHMgdGhlIHRvb2wgdG8g
c3Vic3RpdHV0ZSBhIFhlbiBpbi1jb2RlIGNvbW1lbnQgaGF2aW5nIHRoaXMgc3RydWN0dXJlOg0K
ICAvKiBTQUYtMC1zYWZlIFsuLi5dIFwqLw0KLSBhbmFseXNlcjogaXQgaXMgYW4gb2JqZWN0IGNv
bnRhaW5pbmcgcGFpciBvZiBrZXktdmFsdWUgc3RyaW5ncywgdGhlIGtleSBpcw0KICB0aGUgYW5h
bHlzZXIsIHNvIGl0IGNhbiBiZSBjcHBjaGVjaywgY292ZXJpdHkgb3IgZWNsYWlyLiBUaGUgdmFs
dWUgaXMgdGhlDQogIHByb3ByaWV0YXJ5IGlkIGNvcnJlc3BvbmRpbmcgb24gdGhlIGZpbmRpbmcs
IGZvciBleGFtcGxlIHdoZW4gY292ZXJpdHkgaXMNCiAgdXNlZCBhcyBhbmFseXNlciwgdGhlIHRv
b2wgd2lsbCB0cmFuc2xhdGUgdGhlIFhlbiBpbi1jb2RlIGNvbWVudCBpbiB0aGlzIHdheToNCiAg
LyogU0FGLTAtc2FmZSBbLi4uXSBcKi8gLT4gLyogY292ZXJpdHlbY292ZXJpdHktaWRdIFwqLw0K
ICBpZiB0aGUgb2JqZWN0IGRvZXNuJ3QgaGF2ZSBhIGtleS12YWx1ZSwgdGhlbiB0aGUgY29ycmVz
cG9uZGluZyBpbi1jb2RlDQogIGNvbW1lbnQgd29uJ3QgYmUgdHJhbnNsYXRlZC4NCi0gbmFtZTog
YSBzaW1wbGUgbmFtZSBmb3IgdGhlIGZpbmRpbmcNCi0gdGV4dDogYSBwcm9wZXIganVzdGlmaWNh
dGlvbiB0byB0dXJuIG9mZiB0aGUgZmluZGluZy4NCg0KDQoNCkhlcmUgYW4gZXhhbXBsZSBvZiB0
aGUgdXNhZ2Ugb2YgdGhlIGluLWNvZGUgY29tbWVudCB0YWdzOg0KDQovKiBTQUYtMC1zYWZlIFtl
dmVudHVhbCBkZXZlbG9wZXIgbWVzc2FnZSB0aGF0IHNoYWxsIG5vdCBleGNlZWRzIGxpbmUgY2hh
ciBtYXggY291bnQsIGRvbuKAmXQgYnJlYWsgdGhlIGxpbmUhXSAqLw0KI2RlZmluZSBzdHJpbmdf
cGFyYW0oX25hbWUsIF92YXIpIFwNCiAgICBfX3NldHVwX3N0ciBfX3NldHVwX3N0cl8jI192YXJb
XSA9IF9uYW1lOyBcDQogICAgX19rcGFyYW0gX19zZXR1cF8jI192YXIgPSBcDQogICAgICAgIHsg
Lm5hbWUgPSBfX3NldHVwX3N0cl8jI192YXIsIFwNCiAgICAgICAgICAudHlwZSA9IE9QVF9TVFIs
IFwNCiAgICAgICAgICAubGVuID0gc2l6ZW9mKF92YXIpLCBcDQogICAgICAgICAgLnBhci52YXIg
PSAmX3ZhciB9DQoNCkluIHRoZSBleGFtcGxlIGFib3ZlLCB0aGUgdG9vbCBmaW5kaW5nIGZvciB0
aGlzIG1hY3JvIGlzIHN1cHByZXNzZWQuIFdoZW4gdGhlcmUgYXJlIG11bHRpcGxlIGZpbmRpbmdz
IGZvcg0KdGhlIHNhbWUgbGluZSwgbXVsdGlwbGUgaW4tY29kZSBjb21tZW50cyBuZWVkcyB0byBi
ZSBpbnNlcnRlZCwgZXZlcnkgb25lIG9uIGEgZGlmZmVyZW50IGxpbmUuDQoNCkNoZWVycywNCkx1
Y2E=

