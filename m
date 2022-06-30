Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11F056195C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 13:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358437.587649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6sUd-0007gM-6i; Thu, 30 Jun 2022 11:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358437.587649; Thu, 30 Jun 2022 11:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6sUd-0007eD-3P; Thu, 30 Jun 2022 11:37:55 +0000
Received: by outflank-mailman (input) for mailman id 358437;
 Thu, 30 Jun 2022 11:37:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Dt9=XF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1o6sUb-0007e0-Nd
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 11:37:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1316124b-f869-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 13:37:51 +0200 (CEST)
Received: from DB6PR0202CA0023.eurprd02.prod.outlook.com (2603:10a6:4:29::33)
 by AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 11:37:50 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::f1) by DB6PR0202CA0023.outlook.office365.com
 (2603:10a6:4:29::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15 via Frontend
 Transport; Thu, 30 Jun 2022 11:37:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 11:37:49 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Thu, 30 Jun 2022 11:37:49 +0000
Received: from 030a6fbb61c8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 90FABC9F-4E55-4B7F-9D24-EE7D0AA9AD02.1; 
 Thu, 30 Jun 2022 11:37:39 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 030a6fbb61c8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Jun 2022 11:37:39 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB4294.eurprd08.prod.outlook.com (2603:10a6:20b:bd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 11:37:30 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::980a:f741:c4e1:82f7%7]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 11:37:30 +0000
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
X-Inumbo-ID: 1316124b-f869-11ec-bdce-3d151da133c5
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FMV3bvJyxHOvI/j+OAtJgmUmXMUiVntQ/nWnX/beSb0T5SQ1yqFxldt02jrwjlm0wRRFh3HgKlM+LF+Am8hcfuW3XDRnxLL5Qg5PGzv1RO9autKuU90eTOBF+kej0xkunQmIStsPLxyA+8BURgA8iPxKMp5A4vjfDobq2UW+svCHP8+/+uE+PRjJthX5MWRvt6jjiTVkPaX03WIoWEMh9nzsi7RaHoX+0lpF5jVXa+KHDZS5Ne+7OCQEtNLQOuOzLrs0gIHg4ayubTzBj+3EPhWz+DVMBxieagBhY7E7q19AubsBZZhu8JWUtFwZ5PFQPt4A0Ji5RLyhrLstP/Dxhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqKhNuIZQ6zBXQGpSjQFM/oaOx3c/cm8Z3kwmRIWRvk=;
 b=Z+VQx1FuVEGLCQpVSjVSEzfe3NoZ9H2QPa6ucBAWJeA+Eb0UKwAKv5+6KsJfBNZvDi4zrj/H+vogo1FzWdVDd2MyAumaH+CJBgdLRmFJUyIel/051LzncyIRKQgfdxxLc84Pl1W8cKU/YzgekCi8eev8SyPJlWUFoM11ad//Dd0tawsokEuiGzAqbaPBRhbD8CQAWQqTsAn3Z8MYOHJYyWLgcp6EM6xZLJrRIss/MdA1DwGQLjPdulLSIpdafAxngeHJVweOFtEwOQrp3SeVS2OKmyzndHWI1LMMxwrgecz69kiBkUKjsyXS5f+9LT13SQZ/uf6+AVnLpV6ExDx7uQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqKhNuIZQ6zBXQGpSjQFM/oaOx3c/cm8Z3kwmRIWRvk=;
 b=U3zCxmEDXIl35fmRb72yQokkLQgDdZs82PrFiKtA4/Auq+It6LNvwtWtc5UX2x+8h0Ipn3fKfWnRdJXhwEDZwUMWKovZz7mepn8sLqHLpPFXkZhRBzCaz7PGzxVvAJOHjneYpLSGi9Rl6IC9yzB3Oq2jpmk8kIT33S3doENFjz0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wb0luYfs4h1o+3l0PpnPcWAaBqQEiy09B7GwItlWwNRJYKbqxbPSfnjB6qjy71MVXC/1GaCyFQmVDNCtB9kCzboQTN1OTyDBKdHWQNiRjOKUuinN+ehG0qSi7LRjaHMhl0EFYNV/vNg5ervL60VfvahrYmFxFSXtGBNi9V0B5Y1Ff0uPgsL4H80sAVwHyEpgcUj76YwBfqedfLVWCscpNETBlyM+du9K7NKrlADsn36K/COFfYqRoWvGQ8hQDgJiVvdS8zKu1F6JfCOeVK4bq3NHOZ+9sOI3elDfTHFtcYVb4EhP0+WRedtLMHtCsnjHglilyFF9WWq3EbweIqRA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqKhNuIZQ6zBXQGpSjQFM/oaOx3c/cm8Z3kwmRIWRvk=;
 b=kDWQJ5JRJE7Jmptr5U/+QJlYa42kmW0yrD2kgrMipsb3+yH+FsWVHc+j6acsZsJylotlYekooJNeeX2CPawHF4CJnTE1aazZrzfroWuvO8NZqG19lPdHsOsLsIhr0CkO9+/5+SC6hioD+mc2FdLw0cpLEry03nu5phZYjbusDVJk9Tz1GMTIcEYPzvOzidX/Rj004EczW92FjN4sP5BwsabkQ/527Y0TD/hlnXQ4Z2z77ASs+IHmzjHjE1BhsV5HUskYruMzl6UU/Sym4FUBwTKQOKtmSxqPrS3ieCOYiVTbSaPSPoVRWl2Yf29EnOoxYJeJ19wMkIp1SEDQFYGQIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqKhNuIZQ6zBXQGpSjQFM/oaOx3c/cm8Z3kwmRIWRvk=;
 b=U3zCxmEDXIl35fmRb72yQokkLQgDdZs82PrFiKtA4/Auq+It6LNvwtWtc5UX2x+8h0Ipn3fKfWnRdJXhwEDZwUMWKovZz7mepn8sLqHLpPFXkZhRBzCaz7PGzxVvAJOHjneYpLSGi9Rl6IC9yzB3Oq2jpmk8kIT33S3doENFjz0=
From: Wei Chen <Wei.Chen@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Topic: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Thread-Index:
 AQHYfI531SRNO5A+8Ei3iOFoJrK02K1dB3iAgAE0OjCAABXrgIAAECwAgAAEoICAAARlgIAAAO0AgAmAA0CAAAZFYA==
Date: Thu, 30 Jun 2022 11:37:30 +0000
Message-ID:
 <PAXPR08MB7420EC44AB703BAE155ACC4B9EBA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
 <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
 <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
 <6e91d7d0-78d2-2eec-3b14-9aea00b2a028@suse.com>
 <bad83568-94c6-6d90-308b-ae9965f54754@suse.com>
 <PAXPR08MB7420AD8092F0FBA43C359DD19EBA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
In-Reply-To:
 <PAXPR08MB7420AD8092F0FBA43C359DD19EBA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 92C7280CC74E574B8FD88B6E710F3087.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6064b6c5-c0e6-4bbb-136c-08da5a8cf62a
x-ms-traffictypediagnostic:
	AM6PR08MB4294:EE_|DBAEUR03FT052:EE_|AM6PR08MB3317:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sJO0oThXs038zX1YOJKa1B93tW3b7ZNOxMzHKTdr+DLvfH0e/OdIpKtX5GvlztgrukfyhJZzvx0lAxYNFPjMLAP2llW3CKoT45Ldkb6C8VJSsGS9NmR9Stobf7eVQfas0BIV8vbOCjZeI0WG8DEGyq0NaVx/LJ3Y9KJYmDo/3GWja1LUz0IEh2IHa8gred0+41JGpm+KauFpFbJIUNd/ZrNlpaZ2psuAVElFVQg6RY1+Y/8xxDeQb+BLT5ekktW1OtsY0LarNVkuAIClWEk5Qvi57VdtBMss9RAwhOIJtHnDNErg+5Ga6LtCxXzpUv4DPfrUPqxVbJThIrEIPcjHlyFSYSeIblhieXNF1VQMKyMlMcUKspyVzY7fSvQ3sdYc3G0wL9Ulv8rujgqHWmnKabSbb/58zuICfFQeKgjnt11G+H4hoqWABTbgq8cpCzZ2UghU0omSAbAu1ThP9AsPv//0P1qysb6iOLP/V7v+qpk2/hjvFtFnhrvhBtUtZb/1Yk1Lhz3sG5N3J7hZFm5oVxBjxBsnk5erjQgeXJ9MfCRzpVUhcLcdDJnQKNJcxNDVsgMLhOoHVlay8T3g8MOSGaswCrBImQCo3AV/TvdziwbXibUmZaMp39+XGABRHmuZYF+ddQW8vAEHOQCt73RKUT0Zurrv+NKFa+OwBTz7lhC8jkvM9P6ijlm1tfK6kltOr5YVfFtwGWopVbMNP0zcSgeF87xrhb5K6sCB/QJUCZ2HE9l474S4yNfHdpFc7kJfDQfa1kSPKazj55xS8POk4c44+gTJ69LsXuZQZ6qxMKgV8tRA8FNd9mPro5Spfcol1aDsA0qEqizXGRnuQ+xpI1gbQf4ivKq+v3R2WLczvGc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(55016003)(86362001)(122000001)(38070700005)(8936002)(6506007)(26005)(186003)(2940100002)(52536014)(38100700002)(33656002)(110136005)(5660300002)(54906003)(2906002)(71200400001)(316002)(83380400001)(41300700001)(478600001)(966005)(8676002)(9686003)(66476007)(66556008)(7696005)(64756008)(66446008)(76116006)(53546011)(4326008)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4294
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	391a769d-dddb-47bd-1587-08da5a8cea5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	24tCmvkb8prZHuNi8DCdQboP2s26NCHEUsaEx7MLlg8bYsxlyO0ZWMtGxLusRZmldcyKkQdOyzcIDAOYI5FVZgChCqaN2IAMt8aDyggCcURPSFycOMykEQ26PmJ1dOTf2ETbp/K+7q1Zos1jZqJ+HfFlqLkoFW/cxzA5FfBvGksPvEPPkzwlRRdorzOxw65w2Kpbo2rOs9pwbXd4jhbnygk0RdXS94gugG7ros951POZE6VbhYQiefnWlh8EarRrXONFvMX99NCSn/zRWN77KE/FQwyY85Nz1XwtDYGGKosyEwxRXnN6QMYkXwV7EdD2PhdO/K366tDQ51MHrUun05zw8U2aShhJRB+sfhBSa5fjTit+aMz//4EsPYlaflLEaiG9sy1m1L4so3Ktt6ryBz2HeUk5EeklKPLpKH8E2Urtxf29ypJyJlsjF0QlGMYRA+6G54MJo8OtNApX/gi0rI+6Vtpl4fpdO7lBz9ky2DsLDJ5jlW/EzW+AAVKRAGiXspaVDSiOopQGpae4hsk4ooIbpxE3zFXIxCoC8bkYjP/TNkCf06HzWe/Bj+hwfYXu7Pbu6TPd/CWAS8RVO1jk3CLyI5QlsKsPpNQPFDbwGTccYWsrJPTctnekzEe0MhBRd2Oof6mAYVtwNiBwHgHHL+hJirtxlaDIDP95WB9uzqvAx0+rIjLTvvck28ie074dWXEYYGbO4vDivLnPiCRW/gKRwAszoGc2Gxu7HKwmK3R/8vVtqrPzkSBnqFa872OIjirHxvRrgfUYSE+n4A7+TFgr4MBpPh/ZHYRQ3kk//FU8DAtQdDrtN7pe465m/WolFejk2tP8QeYAvRlujsh3uib50ipqz2A+7EXVUOAzKgU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(136003)(39860400002)(40470700004)(36840700001)(46966006)(53546011)(316002)(52536014)(478600001)(966005)(41300700001)(54906003)(82740400003)(2906002)(86362001)(40460700003)(5660300002)(110136005)(82310400005)(7696005)(356005)(40480700001)(70586007)(8676002)(26005)(81166007)(47076005)(55016003)(2940100002)(33656002)(6506007)(9686003)(4326008)(36860700001)(83380400001)(70206006)(186003)(336012)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 11:37:49.8064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6064b6c5-c0e6-4bbb-136c-08da5a8cf62a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3317

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWGVuLWRldmVsIDx4ZW4t
ZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFdlaQ0KPiBD
aGVuDQo+IFNlbnQ6IDIwMjLlubQ25pyIMzDml6UgMTk6MjUNCj4gVG86IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IENjOiBu
ZCA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IEJlcnRyYW5kDQo+IE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFZvbG9k
eW15ciBCYWJjaHVrDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ow0KPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBKaWFtZWkgWGllDQo+IDxK
aWFtZWkuWGllQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3Vi
amVjdDogUkU6IFtQQVRDSCB2NiAxLzhdIHhlbjogcmV1c2UgeDg2IEVGSSBzdHViIGZ1bmN0aW9u
cyBmb3IgQXJtDQo+IA0KPiBIaSBKdWxpZW4gYW5kIEphbiwNCj4gDQo+ID4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+ID4gU2VudDogMjAyMuW5tDbmnIgyNOaXpSAxODowOQ0KPiA+IFRvOiBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPg0KPiA+IENjOiBuZCA8bmRAYXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47DQo+IEJlcnRyYW5kDQo+ID4gTWFycXVpcyA8
QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsNCj4gPiA8Vm9sb2R5
bXlyX0JhYmNodWtAZXBhbS5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPjsNCj4gPiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdl
aSBMaXUgPHdsQHhlbi5vcmc+OyBKaWFtZWkgWGllDQo+ID4gPEppYW1laS5YaWVAYXJtLmNvbT47
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgV2VpIENoZW4NCj4gPiA8V2VpLkNoZW5A
YXJtLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDEvOF0geGVuOiByZXVzZSB4ODYg
RUZJIHN0dWIgZnVuY3Rpb25zIGZvciBBcm0NCj4gPg0KPiA+IE9uIDI0LjA2LjIwMjIgMTI6MDUs
IEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+ID4gT24gMjQuMDYuMjAyMiAxMTo0OSwgSnVsaWVuIEdy
YWxsIHdyb3RlOg0KPiA+ID4+IEhpIEphbiwNCj4gPiA+Pg0KPiA+DQo+ID4gPj4+Pj4+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vZWZpL01ha2VmaWxlDQo+ID4gPj4+Pj4+PiArKysgYi94ZW4vYXJjaC9h
cm0vZWZpL01ha2VmaWxlDQo+ID4gPj4+Pj4+PiBAQCAtMSw0ICsxLDEyIEBADQo+ID4gPj4+Pj4+
PiAgICBpbmNsdWRlICQoc3JjdHJlZSkvY29tbW9uL2VmaS9lZmktY29tbW9uLm1rDQo+ID4gPj4+
Pj4+Pg0KPiA+ID4+Pj4+Pj4gK2lmZXEgKCQoQ09ORklHX0FSTV9FRkkpLHkpDQo+ID4gPj4+Pj4+
PiAgICBvYmoteSArPSAkKEVGSU9CSi15KQ0KPiA+ID4+Pj4+Pj4gICAgb2JqLSQoQ09ORklHX0FD
UEkpICs9ICBlZmktZG9tMC5pbml0Lm8NCj4gPiA+Pj4+Pj4+ICtlbHNlDQo+ID4gPj4+Pj4+PiAr
IyBBZGQgc3R1Yi5vIHRvIEVGSU9CSi15IHRvIHJlLXVzZSB0aGUgY2xlYW4tZmlsZXMgaW4NCj4g
PiA+Pj4+Pj4+ICsjIGVmaS1jb21tb24ubWsuIE90aGVyd2lzZSB0aGUgbGluayBvZiBzdHViLmMg
aW4gYXJtL2VmaQ0KPiA+ID4+Pj4+Pj4gKyMgd2lsbCBub3QgYmUgY2xlYW5lZCBpbiAibWFrZSBj
bGVhbiIuDQo+ID4gPj4+Pj4+PiArRUZJT0JKLXkgKz0gc3R1Yi5vDQo+ID4gPj4+Pj4+PiArb2Jq
LXkgKz0gc3R1Yi5vDQo+ID4gPj4+Pj4+PiArZW5kaWYNCj4gPiA+Pj4+Pj4NCj4gPiA+Pj4+Pj4g
VGhpcyBoYXMgY2F1c2VkDQo+ID4gPj4+Pj4+DQo+ID4gPj4+Pj4+IGxkOiB3YXJuaW5nOiBhcmNo
L2FybS9lZmkvYnVpbHRfaW4ubyB1c2VzIDItYnl0ZSB3Y2hhcl90IHlldCB0aGUNCj4gPiBvdXRw
dXQgaXMNCj4gPiA+Pj4+Pj4gdG8gdXNlIDQtYnl0ZSB3Y2hhcl90OyB1c2Ugb2Ygd2NoYXJfdCB2
YWx1ZXMgYWNyb3NzIG9iamVjdHMgbWF5DQo+ID4gZmFpbA0KPiA+ID4+Pj4+Pg0KPiA+ID4+Pj4+
PiBmb3IgdGhlIDMyLWJpdCBBcm0gYnVpbGQgdGhhdCBJIGtlZXAgZG9pbmcgZXZlcnkgb25jZSBp
biBhIHdoaWxlLA0KPiA+IHdpdGgNCj4gPiA+Pj4+Pj4gKGlmIGl0IG1hdHRlcnMpIEdOVSBsZCAy
LjM4LiBJIGd1ZXNzIHlvdSB3aWxsIHdhbnQgdG8gY29uc2lkZXINCj4gPiBidWlsZGluZw0KPiA+
ID4+Pj4+PiBhbGwgb2YgWGVuIHdpdGggLWZzaG9ydC13Y2hhciwgb3IgdG8gYXZvaWQgYnVpbGRp
bmcgc3R1Yi5jIHdpdGgNCj4gPiB0aGF0DQo+ID4gPj4+Pj4+IG9wdGlvbi4NCj4gPiA+Pj4+Pj4N
Cj4gPiA+Pj4+Pg0KPiA+ID4+Pj4+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuIEkgd2ls
bCB0cnkgdG8gdXNlIC1mc2hvcnQtd2NoYXIgZm9yDQo+ID4gQXJtMzIsDQo+ID4gPj4+Pj4gaWYg
QXJtIG1haW50YWluZXJzIGFncmVlLg0KPiA+ID4+Pj4NCj4gPiA+Pj4+IExvb2tpbmcgYXQgdGhl
IGNvZGUgd2UgZG9uJ3Qgc2VlbSB0byBidWlsZCBYZW4gYXJtNjQgd2l0aCAtZnNob3J0LQ0KPiA+
IHdjaGFyDQo+ID4gPj4+PiAoYXNpZGUgdGhlIEVGSSBmaWxlcykuIFNvIGl0IGlzIG5vdCBlbnRp
cmVseSBjbGVhciB3aHkgd2Ugd291bGQNCj4gd2FudA0KPiA+IHRvDQo+ID4gPj4+PiB1c2UgLWZz
aG9ydC13Y2hhciBmb3IgYXJtMzIuDQo+ID4gPj4+DQo+ID4gPj4+IFdlIGRvbid0IHVzZSB3Y2hh
cl90IG91dHNpZGUgb2YgRUZJIGNvZGUgYWZhaWN0LiBIZW5jZSB0byBhbGwgb3RoZXINCj4gPiBj
b2RlDQo+ID4gPj4+IGl0IHNob3VsZCBiZSBiZW5pZ24gd2hldGhlciAtZnNob3J0LXdjaGFyIGlz
IGluIHVzZS4gU28gdGhlDQo+IHN1Z2dlc3Rpb24NCj4gPiA+Pj4gdG8gdXNlIHRoZSBmbGFnIHVu
aWxhdGVyYWxseSBvbiBBcm0zMiBpcyByZWFsbHkganVzdCB0byBzaWxlbmNlIHRoZQ0KPiBsZA0K
PiA+ID4+PiB3YXJuaW5nOw0KPiA+ID4+DQo+ID4gPj4gT2suIFRoaXMgaXMgb2RkLiBXaHkgd291
bGQgbGQgd2FybiBvbiBhcm0zMiBidXQgbm90IG90aGVyIGFyY2g/DQo+ID4gPg0KPiA+ID4gQXJt
MzIgZW1iZWRzIEFCSSBpbmZvcm1hdGlvbiBpbiBhIG5vdGUgc2VjdGlvbiBpbiBlYWNoIG9iamVj
dCBmaWxlLg0KPiA+DQo+ID4gT3IgYSBub3RlLWxpa2Ugb25lIChqdXN0IHRvIGF2b2lkIHBvc3Np
YmxlIGNvbmZ1c2lvbik7IEkgdGhpbmsgaXQncw0KPiA+ICIuQVJNLmF0dHJpYnV0ZXMiLg0KPiA+
DQo+ID4gSmFuDQo+ID4NCj4gPiA+IFRoZSBtaXNtYXRjaCBvZiB0aGUgd2NoYXJfdCBwYXJ0IG9m
IHRoaXMgaW5mb3JtYXRpb24gaXMgd2hhdCBjYXVzZXMNCj4gPiA+IGxkIHRvIGVtaXQgdGhlIHdh
cm5pbmcuDQo+ID4gPg0KPiA+ID4+PiBvZmYgdGhlIHRvcCBvZiBteSBoZWFkIEkgY2FuJ3Qgc2Vl
IGFueXRoaW5nIHdyb25nIHdpdGggdXNpbmcNCj4gPiA+Pj4gdGhlIG9wdGlvbiBhbHNvIGZvciBB
cm02NCBvciBldmVuIGdsb2JhbGx5LiBZZXQgb3RvaCB3ZSB0eXBpY2FsbHkNCj4gdHJ5DQo+ID4g
dG8NCj4gPiA+Pj4gbm90IG1ha2UgY2hhbmdlcyBmb3IgZW52aXJvbm1lbnRzIHdoZXJlIHRoZXkg
YXJlbid0IHJlYWxseSBuZWVkZWQuDQo+ID4gPj4NCj4gPiA+PiBJIGFncmVlLiBJZiB3ZSBuZWVk
IGEgd29ya2Fyb3VuZCwgdGhlbiBteSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRvIG5vdA0KPiA+ID4+
IGJ1aWxkIHN0dWIuYyB3aXRoIC1mc2hvcnQtd2NoYXIuDQo+ID4gPg0KPiA+ID4gVGhpcyB3b3Vs
ZCBuZWVkIHRvIGJlIGFuIEFybS1zcGVjaWFsIHRoZW4sIGFzIG9uIHg4NiBpdCBuZWVkcyB0byBi
ZQ0KPiA+IGJ1aWx0DQo+ID4gPiB0aGlzIHdheS4NCj4gDQo+IEkgaGF2ZSB0YWtlbiBhIGxvb2sg
aW50byB0aGlzIHdhcm5pbmc6DQo+IFRoaXMgaXMgYmVjYXVzZSB0aGUgIi1mc2hvcnQtd2NoYXIi
IGZsYWcgY2F1c2VzIEdDQyB0byBnZW5lcmF0ZQ0KPiBjb2RlIHRoYXQgaXMgbm90IGJpbmFyeSBj
b21wYXRpYmxlIHdpdGggY29kZSBnZW5lcmF0ZWQgd2l0aG91dA0KPiB0aGF0IGZsYWcuIFdoeSB0
aGlzIHdhcm5pbmcgaGFzbid0IGJlZW4gdHJpZ2dlcmVkIGluIEFybTY0IGlzDQo+IGJlY2F1c2Ug
d2UgZG9uJ3QgdXNlIGFueSB3Y2hhciBpbiBBcm02NCBjb2Rlcy4gV2UgYXJlIGFsc28gbm90DQo+
IHVzaW5nIHdjaGFyIGluIEFybTMyIGNvZGVzLCBidXQgQXJtMzIgd2lsbCBlbWJlZCBBQkkgaW5m
b3JtYXRpb24NCj4gaW4gIi5BUk0uYXR0cmlidXRlcyIgc2VjdGlvbi4gVGhpcyBzZWN0aW9uIHN0
b3JlcyBzb21lIG9iamVjdA0KPiBmaWxlIGF0dHJpYnV0ZXMsIGxpa2UgQUJJIHZlcnNpb24sIENQ
VSBhcmNoIGFuZCBldGMuIEFuZCB3Y2hhcg0KPiBzaXplIGlzIGRlc2NyaWJlZCBpbiB0aGlzIHNl
Y3Rpb24gYnkgIlRhZ19BQklfUENTX3djaGFyX3QiIHRvby4NCj4gVGFnX0FCSV9QQ1Nfd2NoYXJf
dCBpcyAyIGZvciBvYmplY3QgZmlsZXMgd2l0aCAiLWZzaG9ydC13Y2hhciIsDQo+IGJ1dCBmb3Ig
b2JqZWN0IGZpbGVzIHdpdGhvdXQgIi1mc2hvcnQtd2NoYXIiIGlzIDQuIEFybTMyIEdDQw0KPiBs
ZCB3aWxsIGNoZWNrIHRoaXMgdGFnLCBhbmQgdGhyb3cgYWJvdmUgd2FybmluZyB3aGVuIGl0IGZp
bmRzDQo+IHRoZSBvYmplY3QgZmlsZXMgaGF2ZSBkaWZmZXJlbnQgVGFnX0FCSV9QQ1Nfd2NoYXJf
dCB2YWx1ZXMuDQo+IA0KPiBBcyBnbnUtZWZpLTMuMCB1c2UgdGhlIEdDQyBvcHRpb24gIi1mc2hv
cnQtd2NoYXIiIHRvIGZvcmNlIHdjaGFyDQo+IHRvIHVzZSBzaG9ydCBpbnRlZ2VycyAoMiBieXRl
cykgaW5zdGVhZCBvZiBpbnRlZ2VycyAoNCBieXRlcykuDQo+IFdlIGNhbid0IHJlbW92ZSB0aGlz
IG9wdGlvbiBmcm9tIHg4NiBhbmQgQXJtNjQsIGJlY2F1c2UgdGhleSBuZWVkDQo+IHRvIGludGVy
YWN0IHdpdGggRUZJIGZpcm13YXJlLiBTbyBJIGhhdmUgdG8gb3B0aW9uczoNCj4gMS4gUmVtb3Zl
ICItZnNob3J0LXdjaGFyIiBmcm9tIGVmaS1jb21tb24ubWsgYW5kIGFkZCBpdCBiYWNrIGJ5DQo+
ICAgIHg4NiBhbmQgYXJtNjQncyBFRkkgTWFrZWZpbGUNCj4gMi4gQWRkICItbm8td2NoYXItc2l6
ZS13YXJuaW5nIiB0byBBcm0zMidzIGxpbmtlciBmbGFncw0KPiANCg0KVGhlIDNyZCBPcHRpb24g
aXMgc2ltaWxhciB0byBMaW51eCBrZXJuZWw6DQpLYnVpbGQ6IHVzZSAtZnNob3J0LXdjaGFyIGds
b2JhbGx5DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgta2J1aWxk
L3BhdGNoLzIwMTcwNzI2MTMzNjU1LjIxMzc0MzctMS1hcm5kQGFybmRiLmRlLw0KDQoNCj4gSSBw
ZXJzb25hbGx5IHByZWZlciBvcHRpb24jMSwgYmVjYXVzZSBBcm0zMiBkb2Vzbid0IG5lZWQgdG8g
aW50ZXJhY3QNCj4gd2l0aCBFRkkgZmlybXdhcmUsIGFsbCBpdCByZXF1aXJlcyBhcmUgc29tZSBz
dHViIGZ1bmN0aW9ucy4gQW5kDQo+ICItbm8td2NoYXItc2l6ZS13YXJuaW5nIiBtYXkgaGlkZSBz
b21lIHdhcm5pbmdzIHdlIHNob3VsZCBhd2FyZSBpbg0KPiBmdXR1cmUuDQo+IA0KPiBDaGVlcnMs
DQo+IFdlaSBDaGVuDQo+IA0KPiA+ID4NCj4gPiA+IEphbg0KPiA+ID4NCg0K

