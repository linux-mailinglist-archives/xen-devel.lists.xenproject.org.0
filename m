Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B697592B01
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 10:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387189.623325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVbr-0000VR-7g; Mon, 15 Aug 2022 08:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387189.623325; Mon, 15 Aug 2022 08:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVbr-0000Td-2o; Mon, 15 Aug 2022 08:38:07 +0000
Received: by outflank-mailman (input) for mailman id 387189;
 Mon, 15 Aug 2022 08:38:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=krio=YT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oNVbq-0000TX-3y
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 08:38:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9425a29e-1c75-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 10:38:04 +0200 (CEST)
Received: from AM6PR05CA0014.eurprd05.prod.outlook.com (2603:10a6:20b:2e::27)
 by AS4PR08MB7480.eurprd08.prod.outlook.com (2603:10a6:20b:4e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 08:38:02 +0000
Received: from AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::67) by AM6PR05CA0014.outlook.office365.com
 (2603:10a6:20b:2e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19 via Frontend
 Transport; Mon, 15 Aug 2022 08:38:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT062.mail.protection.outlook.com (100.127.140.99) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 08:38:01 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Mon, 15 Aug 2022 08:38:01 +0000
Received: from 24467dae2bda.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 458EE97A-424A-4935-88A8-70B073B05036.1; 
 Mon, 15 Aug 2022 08:37:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 24467dae2bda.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 08:37:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB4130.eurprd08.prod.outlook.com (2603:10a6:208:132::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19; Mon, 15 Aug
 2022 08:37:49 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::240a:5b52:7540:5772%3]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 08:37:49 +0000
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
X-Inumbo-ID: 9425a29e-1c75-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CZIky9fyuL2d7ksfnpAkecw7YQf/axOfasjCLH3OVn58AgiLuczyL5mbXZviGDHK1AXN6gflUZjg7/mgZLZLF2IkNTkVHgsgSvJSV9RGHaA5Q8twNE7KMfAjZIFm1AOVf4gEGB373L94qxXcaUZaebfMNuRsPpNVoQ5t6VRjDUbQ9e2uTUWtMGtHi4X/dSS+3eVQYKhMkkXch27gZ6Ku1caVhtYWYz9jxPHTcmmYwpDu26FUza2WGa1OY2zS6vk4EoJTsJnTwf8XicDuoKUROl34wDY4ccpNpcOSVv/lA+WKNuw32P776oTCV/9zbHIhpZW+k9d0gi27JUpbOxyvwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/ky6xNTMZsPtJqs+G0FPbUpPEJSIwt+KtSTelzYcDU=;
 b=WQgcXm0INDg6bcLIJvuvynLt92w2JJYzmp5mxSROUPjv5P/vAbz1TSYEnXFqIMkUq3XcTPBbSVEpGRyELGIVuIc5r5/aJ4BcepaGjYu6joZzf4K/gTJ77hz9t0LqE6qp0VaOAPabF59aszbkaq3GWwKVmjj1tL+IZ5Jmjxdf7Ak3iEjyhS0FwLoK7p1trGy2+FK7LvtzI51jMufO3lETYirvJkYfr8bX+k3b6HzxcoHy8jzx3tbcpAFEjie6fqHtkOqKNGFSz/I0gxQQrCBl3K9xTUpxtR+gu9627K4dRtlnmNYGmuEbmUwbD8hC2eEA1YGIxl6OplBvLTNGn2LT2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/ky6xNTMZsPtJqs+G0FPbUpPEJSIwt+KtSTelzYcDU=;
 b=4GZnYr6jBDxfET3CO1pQ2JbmLiv1Q0fw5eAUMqYmKNB+/y86OIuWO7FtdUnBtHWAkJ4tSMp7D6gEIN3a2/dDT04jzZE6tte3DilCi4nP5bvVJYGKRhQVwmitZkFG9vhG2Lr1Pe7izSrgneIvufcmHlUrRWbuFaTMGQaWbxaxyP4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iV/s1yhs7KI4xJDubJxwkhtiVMTMjGm8oauHuMu9pwXzyTyoUbeMA9i8hSWTXDUK5i9iCI5XcPAknaSouSmVJRBIAMuEjnZrN6yJ/Ov6lrAdO4wnrssEhOBuvM1wUjHRkK/E+c3K3lSXHjPHHnDBpPNQV0KHyHEPZFhzYV0iP9ielBH/CFnuUF8Okf3bWKsY4XiPgxTdd2HrarZocM3+97r4VabTbkt742HSalS+mlV8EnGw796py3lEk4FQZVpenJf+Vyx4Palq4T21Z+7zAhkvuDcGpmSno1V0GYRSu38MKTUPn8xPhS8PBGFXjCmbJyIvG6cPaOB09JZOfCYp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/ky6xNTMZsPtJqs+G0FPbUpPEJSIwt+KtSTelzYcDU=;
 b=Xnfy7pryMnprOqzp/zKv1XTStaYwJej7a5LSZ6cfBZ1cRvPftYCHdMyrPlY8VtUu5SODUO1KQRpZoTS8riaC1TARiJoUIHH43VpWV4WbDdC58ufQkZe5F7ojEmUPBltnSsqE9Mh6oZe3F97Cn7CEkYk9mJIg06PmZnMoLuTRmweR9D5y48g4TRtoV9BIb6px5usjNx87MeQTD502RFAeEFP69NP7WzqI3kqnnYFyfriwcOy1oLa0z3f4oqAnSpwT77C1lqKKWlToYVWUutH9doCAPNSNOkSUhoUoVwVcwyurwJLTyK/OMaQR4JE/hSCHKRm/iWsdV6om8UeS68Zb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/ky6xNTMZsPtJqs+G0FPbUpPEJSIwt+KtSTelzYcDU=;
 b=4GZnYr6jBDxfET3CO1pQ2JbmLiv1Q0fw5eAUMqYmKNB+/y86OIuWO7FtdUnBtHWAkJ4tSMp7D6gEIN3a2/dDT04jzZE6tte3DilCi4nP5bvVJYGKRhQVwmitZkFG9vhG2Lr1Pe7izSrgneIvufcmHlUrRWbuFaTMGQaWbxaxyP4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jgross@suse.com" <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, "Wei Liu (LSG)"
	<liuwe@microsoft.com>
Subject: RE: Xen 4.17: Current status of series floating in ML
Thread-Topic: Xen 4.17: Current status of series floating in ML
Thread-Index: AdiwaSAsLXrq8BcIQ6OGhWLWfPbjFwAFdOeAAAAtkIAAAGC/AAAAERrA
Date: Mon, 15 Aug 2022 08:37:48 +0000
Message-ID:
 <AS8PR08MB7991FA25A9CFFC62BA3D992E92689@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <AS8PR08MB7991375F9A36B36AE5ADF3E092689@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c8d7de5e-0d0b-43cb-2b89-d253a2b0b490@xen.org>
 <AS8PR08MB7991B735C93D67084E946D4992689@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <12c564db-84dc-0b04-1b87-8151e1ac1b8a@xen.org>
In-Reply-To: <12c564db-84dc-0b04-1b87-8151e1ac1b8a@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F406DA9CF4A73E43B4F6325BC9704FD0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: aa373681-edc6-483b-9060-08da7e99771d
x-ms-traffictypediagnostic:
	AM0PR08MB4130:EE_|AM7EUR03FT062:EE_|AS4PR08MB7480:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iuOF/9Lf//Vsyug7+iBTsfTMmAfIUZcbgCV7L2OWVdpLW4wgw1IavE7KWnBSwreYZoKp8ye1W1KBrcyVeD9EiJZyZdMTLjyTfGsQBzAGfknojemWA65jZXuiKte2wmZGhlKk5iQOrMOIWTcDWl23SbahGCcSkcssdClk5U2mLPrCLLB4eR1QNxCR1ZAMNvrLmaAV2mRNTSzmWRO3MFZDNCxEzg83Qvvs/BuDEmM9FZdkjarY6DO8AGRKMVZGpPM/s49vnLfBqAFoLMpI7mjV3iTi/3J/WUq3lqLeMCh3Hq6E96lemFSel85UomIL5UFW778nOXmDpwzT0JwvsZe7aWX1ArJ5jJ351IbETr6c2+cQAPd/HlhCPBM6/a3KuHqHN5LfeXXjbIA7agE8R9uMdz39/wcdypMNF8NNQwHDVbYx/RRSquIjWEnEO7V4u/wsbNCBqlY9BEaujfMiILdwqZQn6RHZZGfQcxb3UPYD2sXfN5Q4fQUuo5XwVzeTlJSptec9y5QgetbgMzDT+EiXsOQnLG3KpNhh8qnu8XXtoBeBBWQwgHa6qJMB/lJF3vfrylSkFsyNA/6c2H4Y0tXS0fdimEHy18X3kf0UD6LUiDHUQpX0xlgESgRwnnMLrB+hFyafO/Jzw91XpAv7E9oJ5o0rJaSdTQGdq1OXmpQb+GE2PGPQ/yl+UiT8J9X2HSd6FAeBLAus2Igc4B3/dBa8U2eZFfzKbL7oKwDPhgNXJHKEax935JMtGdI1ZDOdB7cq1qWsIFuPZh52X3yLFmHebasGSdZhtpXduL/pvJmZT5EWcwqL7erNKKEKOuTzJA8YPRGYaNMrjU3PbJA7WuWg7A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(478600001)(38070700005)(6506007)(7696005)(26005)(9686003)(71200400001)(86362001)(186003)(966005)(41300700001)(83380400001)(110136005)(55016003)(66556008)(4326008)(64756008)(66446008)(66946007)(76116006)(5660300002)(8676002)(316002)(54906003)(66476007)(122000001)(52536014)(2906002)(8936002)(7416002)(33656002)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4130
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d4b42619-1c49-4a83-1223-08da7e996f69
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ug8B9J1om2BCN2AGs/eH+ITbIkI9alRhJx6vN8wfMKS7qPEhtXqbKN7etP96WqRn+BfnpkNgX3Q+Ca5nwbY5kPIO/3glbNdV451Vnxr113PVj1F2FRm836zvq77zTArDk2MgGKnRaBooMzUPnOCP6MedZjhjJM1pxbpj79YkShIM6LwIb7IfnGmdXbGrWSqoPhqAOn8EeW7+nkXZxL2ncKvOeNUs0KeiMXudGSFTf5WaLxNwaCMGgRwsbsiIgu+eGF2z5v8FsD9sH0mZZHTVSylbb3FWqguPmeqPmSeYHM8RhVn1L/XzEf15nH/204WaUxyTR5e3j9Sg549SXxCDQIeczpS+G0Py3E8iujrXToQa1TLDFPNhJGmQGJS57UNbdO+y1d1fDm7EpLHm3Tbq/nNu5wnBPnP7/+9NLzEBI/JOy9gancRA0+sWyU2qT1elRdIe+I2manqTUTFj9wiOWvKan670hUzkewpy+NSPag89bAM0/JgpaA8gRYyKxA4sC5tyo/AwxDE1de/WKmftdonU2RH5tnz9y2FuFt/7tEYM1+CdDoW/acrVg1RlxgYmdiGRK80IB26lAVOfkKPKa5f1n7XOWzxTThJYqbYx7HP+QxidqZ6IemUBwdNKPlBmWqxaF1oUESerRMovHB0gleDD3ie3IuvWPGbiPTiVtQzZN96McbhtKP/i+HcqHp/tGvBFylykW67T5tR6rahAXLO+VoWowGiX3H95zYmAzuk8/K6Vn9paHEf89Mi6/ITCwJhHMN2ALhOd8ORdzf9fbDgzZ6P92ytLHsV94SRGsdmcgUJ6KZP6HbXJc4vAp7QIYnHb4Iv7NBR7h5nXbJCMrQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(40470700004)(46966006)(36840700001)(86362001)(186003)(107886003)(36860700001)(82740400003)(47076005)(9686003)(83380400001)(55016003)(7696005)(33656002)(356005)(6506007)(336012)(81166007)(26005)(316002)(54906003)(478600001)(966005)(41300700001)(8936002)(110136005)(8676002)(52536014)(2906002)(40460700003)(5660300002)(40480700001)(4326008)(82310400005)(70206006)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 08:38:01.9243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa373681-edc6-483b-9060-08da7e99771d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7480

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBYZW4gNC4xNzogQ3VycmVu
dCBzdGF0dXMgb2Ygc2VyaWVzIGZsb2F0aW5nIGluIE1MDQo+ID4+PiAqKiBCbG9ja2VyIExpc3Qg
Kio6DQo+ID4+PiAyLiB0b29scy94ZW5zdG9yZTogYWRkIHNvbWUgbmV3IGZlYXR1cmVzIHRvIHRo
ZSBkb2N1bWVudGF0aW9uDQo+ID4+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QveGVuLWRldmVsL2xpc3QvP3Nlcmllcz02NjUwNjQNCj4gPj4+IFN0YXR1czogUGF0Y2ggIzIg
bWVyZ2VkLiBPbmx5IHBhdGNoICM1IGlzIG5vdCBwcm9wZXJseSByZXZpZXdlZC9hY2tlZC4NCj4g
Pj4+IERpc2N1c3Npb24gc2VlbXMgZ29pbmcgb24gYW5kIChwcm9iYWJseT8pIG5lZWRzIGEgcmVz
cGluLg0KPiA+Pg0KPiA+PiBIbW1tLi4uIFdoeSBpcyBpdCBhIGJsb2NrZXI/IFRoaXMgaXMgb25s
eSBkb2N1bWVudGF0aW9uIGFuZCBJIGhhdmVuJ3QNCj4gPj4geWV0IHNlZW4gYW55IGNvZGUgaW1w
bGVtZW50aW5nIHRob3NlIG5ldyBmZWF0dXJlcy4NCj4gPg0KPiA+IFRoaXMgc2VyaWVzIGhhcyBi
ZWVuIGluIG15IGxpc3Qgc2luY2UgdGhlbiA6KSkNCj4gQWghIEkgZm9yZ290LiBXZSByZXZlcnRl
ZCB0aGUgc2VyaWVzIGp1c3QgYWZ0ZXIuIFNvIEp1ZXJnZW4ncyBzZXJpZXMgaXMNCj4gbm90IGEg
Zm9sbG93LXVwIGJ1dCBhIHJlcGxhY2VtZW50Lg0KDQpZZXMgSSBhZ3JlZS4gQWxzbyBzaW5jZSB0
aGUgc2VyaWVzIGlzIGluIGEgZ29vZCBzaGFwZSAod2l0aCBkaXNjdXNzaW9uIG9ubHkgaGFwcGVu
cw0KaW4gcGF0Y2ggIzUgYW5kIHRoZSBvdGhlcnMgcmV2aWV3ZWQpLiBJIHRoaW5rIHdlIGhhdmUg
Y29uZmlkZW5jZSB0byBnZXQgdGhlDQpzZXJpZXMgbWVyZ2VkIGJlZm9yZSB0aGUgcmVsZWFzZS4g
U28gSSB3aWxsIHJlbW92ZSB0aGlzIGZyb20gbXkgYmxvY2tlcnMgbGlzdC4NCg0KS2luZCByZWdh
cmRzLA0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

