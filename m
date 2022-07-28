Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07924583BFE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 12:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376747.609722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH0it-0003KW-AJ; Thu, 28 Jul 2022 10:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376747.609722; Thu, 28 Jul 2022 10:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH0it-0003I3-78; Thu, 28 Jul 2022 10:26:31 +0000
Received: by outflank-mailman (input) for mailman id 376747;
 Thu, 28 Jul 2022 10:26:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L+ip=YB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oH0is-0003Hx-7r
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 10:26:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2070.outbound.protection.outlook.com [40.107.22.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be0d8f4e-0e5f-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 12:26:29 +0200 (CEST)
Received: from FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a3::7) by
 DU0PR08MB7945.eurprd08.prod.outlook.com (2603:10a6:10:3c9::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.20; Thu, 28 Jul 2022 10:26:27 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a3:cafe::d2) by FR3P281CA0110.outlook.office365.com
 (2603:10a6:d10:a3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.1 via Frontend
 Transport; Thu, 28 Jul 2022 10:26:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Thu, 28 Jul 2022 10:26:27 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Thu, 28 Jul 2022 10:26:26 +0000
Received: from aa6c87bb7988.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C0AEE14-9F53-4E54-A3C6-5494B82B762D.1; 
 Thu, 28 Jul 2022 10:26:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa6c87bb7988.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Jul 2022 10:26:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6459.eurprd08.prod.outlook.com (2603:10a6:10:256::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 10:26:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5482.010; Thu, 28 Jul 2022
 10:26:18 +0000
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
X-Inumbo-ID: be0d8f4e-0e5f-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gsxySUZncXLxvXwyIZrM2czTAogVMFVLCHEMuqzbNfLEhmuqX2lenh6dfWXpnACG/czkWov6oh0oNIEB6NIx/69bG3o3L7jdEqca/a2mUFwIGG5nobJ9hV1Q7todmUPCASUUmPZ/WIHzb8WlIEmcs0hiIeqcKfQKPTwLYIoffzaq9yXyYsE7AOAubZlDJjXHGHdya32CbO1N28AtlYP9DthrtZppXHjlcuuU5zL0MKsECQy4Iob+tlC+86y0rSNlwymy6Jje0qC6en7UNauMTwOLEh1J7RqfYCOv/yLNoQ1t5W8ir3EOdxAc6/0SJRzqe3vG7t2y1nitPN7nSKSxYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcuKVD3NoJzgb4ZjBlCwVtjxzF18jfH0aGMtqb0ImSo=;
 b=XLy2XJKImvQA4rQfpVMZBVqqo2LKP5ouw1pc0kUFPVtOb3mgx72BdHnKIjJAKp5B37UDL5Qp42dBEDYU4pjEuv/GNNBnC9k9PwpbBnn44SrbBqB3bTwKA0KAmo1zqzZhGzCSeSm/6u22v4QV0S49tNN2lLFMql9lcYpNtt8cdwARN0G3WCh3Wd4E5qBwSzz0RMVqZ1CsIwo/bzZLD16Bk+SBdLrIfZhK8acU16p1wDKw4m5EHHx5mrZ+DXDc+0FM/b+VMzE3gL76lSeGFDZP3JJZ/dwKxl6IW6mYIScFZRwuw0iV9irX9rGE2RvEnMTpc7gzfuwLFXRqwv/b3J8Tzw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcuKVD3NoJzgb4ZjBlCwVtjxzF18jfH0aGMtqb0ImSo=;
 b=G58ohe5MwcW3VixxUrtj1QoIg9ucLuW2XbAef6FxFkwh3b6K6y5Zlpfd8B7XLfAhuNBQvJ1iqmymXQPnmYO+L/2MJlGWKJPE2Cp5r3PkQgvJTtaXwQPth/o0DWeg3ozVDO50XzDEhp72fUrBUo0b+ENRxWu2DUT/69OyLJ40h+o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 07983d8748755b9b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/+5K0GvQRuGKWDOL6xmu28oRpKP12zop2xtXO2ZEHsS/JLXFM4zqNnyACL4ElUEu8PI8Alo8596nYBTTIddP8gb0motakob18a7AM9RBsEfo6HfABCwls8aDxtpNa4FriWvwoYtH+89/0/2ktkhvlgMJ+VqLok+theyFSK2Sccm0mWpct94daEafHCT5SuNUFBuXoJMtnL7OcDq+EJNxXpVWuvQ/YsHGIn3pzG/cwEyeTMGqP9iDXHFY38EF8Es9qPWBo2p33pTtVJFOxytZg2raRNT/GoZ1yhxTdVIHZqltui9tNS62mPXlxSAMUe2fChNA+1EpT3KQF9CT35/Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcuKVD3NoJzgb4ZjBlCwVtjxzF18jfH0aGMtqb0ImSo=;
 b=Yeers/MWzdu1kRqQuSokqOJNtZm0ZbUdicRk5A4x88gY/K+OA9jHTZUvdcjl/Ut1mC1+uQ0Sy5YEKEYdR4k5kKspVaUW5enPe5Yu7MzWe/dNsru/rwnOS6+IwZP6Knm5JmAnIW3+bfsP8bOK+z5GfjXHZQ0tRuhzCHBHRmoyeNNEElAXPSIp7PVVvy6N8L9Gd6wrPx+ae8kO//GOhBCHIrvaxbY2TEybsWtis2UPIX35eeTvINX/1Qpoz73vrUcpA4JyblSFBY/ZtcoWfC2swL11/aJsex3wg7HoAQt+KFiI+N2gScRzJurQsmPi1jxcclK5TB66RvpT/P2INT1TRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcuKVD3NoJzgb4ZjBlCwVtjxzF18jfH0aGMtqb0ImSo=;
 b=G58ohe5MwcW3VixxUrtj1QoIg9ucLuW2XbAef6FxFkwh3b6K6y5Zlpfd8B7XLfAhuNBQvJ1iqmymXQPnmYO+L/2MJlGWKJPE2Cp5r3PkQgvJTtaXwQPth/o0DWeg3ozVDO50XzDEhp72fUrBUo0b+ENRxWu2DUT/69OyLJ40h+o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xenia Ragiadakou <burzalodowa@gmail.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 2.5
 violation
Thread-Topic: [PATCH 2/2] xen/arm: asm/atomic.h: Fix MISRA C 2012 Rule 2.5
 violation
Thread-Index:
 AQHYoc45O9kZLijXrUyjjlrBuGCX1a2SXJWAgAEPNoCAABtvgIAAArUAgAAKKICAAAE+AA==
Date: Thu, 28 Jul 2022 10:26:18 +0000
Message-ID: <FE2D035F-5EEC-491B-8369-2B327C497482@arm.com>
References: <20220727153254.1143503-1-burzalodowa@gmail.com>
 <20220727153254.1143503-3-burzalodowa@gmail.com>
 <d0e8f4b6-a66e-48c3-4f29-728cc7f5fafc@xen.org>
 <93036B23-69AA-4075-A54F-1EC8CB194928@arm.com>
 <49ed6d31-76fd-c962-5320-c88726b45987@xen.org>
 <27786AF4-37EA-4C54-9330-1C9B674BAC87@arm.com>
 <b4187646-875c-644c-937f-a6c0493d8aea@xen.org>
In-Reply-To: <b4187646-875c-644c-937f-a6c0493d8aea@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 914a6a52-5afa-4ee1-ae09-08da7083a127
x-ms-traffictypediagnostic:
	DB9PR08MB6459:EE_|VE1EUR03FT041:EE_|DU0PR08MB7945:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 o0M2jukTVudpVoJxPqOojrueu9BeOM1A3bVeD6s9Xu79h+jny+QkaEUOoZvd+k2df1BWC4cojjhv9nhZApUqMHPHhAlzaidpyZP+9X9HS3HOccdtgeoze+Wx0uvIm+DF0NlDo8RyibjwuR8Z2FVWifVP9474VNkeF9VnQWHw5eTfwJH+KYcBiW2UYxROmgWMkkPvPuWMrRhRazAOQjUOssmIHaBndMcMRNnGGTFRRgFV8fj+XPQIWScWFDRuR1eUOCP6ZZAZ7ddFeq47Sh8xz4DRsFIMVqwOWPyqsFWUGgwNVnYZtuQ5HPUUYpB819hEUkbsR1xz7/15noHDI7ciMjpa918eGwhkqkbw8KBPbcqHaIgfyNRDnXfs5gWnfh8yEhBL99khUhPjZ61Q6TQevUAEOvvWIfFG+hbl/Tx871GbwuQiI8msuywLtwF3U5WJzzdRLWagEKwlc/8m7zm5m7bZmSQbzCpgKgHEB8EmxCmSJLM/6IMwhmv4it24FoYteCTjthZfL9EcvkokDllb3MlO5tD1uT1A2Z07S91onmvA0STOO8UDvH8iWZsy1MSYQrUkLI7DqcOKl0XFYkjHivb+8sVKewhvE0+xJWKj5TN5GZPNy+5cWzF8sxhj+S+HTMnc5pgj0vaBZ0REx7MDqCQoc/l7rqkAvIQUqfDiJI/xrkmHYyrtLjjt0GsyIGWl+Xxoi1aYRp6WTlgGO6yFSTLrU6ZZRkJYnbvznuR5EWbfpmWsP/k29AcTOUhTcwUc9MgsUKz34VlWuAe9J9bTmuXK8j76+oWv1r32SeyS/TfcZsOS43YTOJt5sFWCImFzw0ci7o1VlceoIUNP90Cz6A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(2616005)(41300700001)(186003)(86362001)(316002)(66946007)(53546011)(36756003)(6506007)(5660300002)(122000001)(38070700005)(83380400001)(38100700002)(2906002)(66476007)(4326008)(91956017)(6486002)(54906003)(6512007)(8936002)(33656002)(26005)(71200400001)(76116006)(6916009)(64756008)(478600001)(8676002)(66556008)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <26D1206C212ED64287D7830A763E1A26@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6459
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c6236345-fa1d-4f2b-10b8-08da70839bdd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oAkUozfSUqj5tAzrAWkiAvNd/NmUJLbNnhmWMKvUBtIENgpaRjq+k/eMeBK6q4OnzAlKksMUmCiGLnvceJLXh9rbQUHEQn6RZCN+7ki4R6Z72wM177lTX2im3H1S/eLyFYtBhqbUqxVAT8l5FIv9wU4eBUzpiXRGVX9Y3+T2ZTIdIxlvV9cTfO6HKWgPJaJBDCSW2WVakqLNfIr54eu//jhYG5/NMRj3De/gR6P+A+krY2wOWyzmX8C3AKMyYLFo9f1KAbZjGBhqvBQt/dqBZmURMINimiOHHKamUpVJPqPe5Pka95bnd71arG5H04PQvMBnGgBVfOiCsdRzuSlD/qXVX2FjIUrF8p2Vcpa4sjEDrt0oN3pwyE/e4MY/hxICWaV9V+HgQrzkqAXWmlavF8I4v6chiKHFFzSFzOs66C8n1eqPd0ly4QrqgpAj0euB3s5J5XUjGQimxIJU5wC10opVhC0o88fj8vVf2PKrLiSQhHqwqsY4RYv0aFmJjz3YpG+4GXlNFrJ8tZc3hwl4OUfv1DWSGkTQW9WskhZeWjdOsZlHPbu1iqiuCEEHHh90sVldCjR5XW9Tv3fSEaqb4t7s2NZt6A6IGclVP7BSqqm9cPo7SbrR2nxoFrEB+onA1/F4fYCv6pZORV7eLKHkiBBCjSwjZGrafxV594WFIN0tf9IH3r5H7nVPQYsjvRYQJwdCaDeYtk6E1Xpq8Y6xJp1yS146DzLGoiQqVmaF808KcoAuKfLSzJmyUHyVcVztSZV3GZ5ucVqwB7O70Y/vQ5SLH3QxixDwcRDcOv0B135TufI9fRtEOpNCsWcobxnx
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(136003)(39860400002)(376002)(36840700001)(40470700004)(46966006)(40460700003)(53546011)(47076005)(6512007)(478600001)(83380400001)(86362001)(41300700001)(2906002)(6506007)(2616005)(336012)(5660300002)(186003)(107886003)(40480700001)(36756003)(70206006)(70586007)(356005)(6862004)(8676002)(8936002)(81166007)(4326008)(6486002)(36860700001)(82740400003)(316002)(54906003)(33656002)(26005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 10:26:27.1855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 914a6a52-5afa-4ee1-ae09-08da7083a127
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7945

Hi Julien,

> On 28 Jul 2022, at 11:21, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 28/07/2022 10:45, Bertrand Marquis wrote:
>>> On 28 Jul 2022, at 10:35, Julien Grall <julien@xen.org> wrote:
>>>=20
>>>=20
>>>=20
>>> On 28/07/2022 08:57, Bertrand Marquis wrote:
>>>> Hi Julien,
>>>=20
>>> Hi Bertrand,
>>>=20
>>>>> On 27 Jul 2022, at 16:46, Julien Grall <julien@xen.org> wrote:
>>>>>=20
>>>>> Hi Xenia,
>>>>>=20
>>>>> On 27/07/2022 16:32, Xenia Ragiadakou wrote:
>>>>>> Remove unused macro atomic_xchg().
>>>>>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>>>>>> ---
>>>>>> xen/arch/arm/include/asm/atomic.h | 2 --
>>>>>> 1 file changed, 2 deletions(-)
>>>>>> diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/includ=
e/asm/atomic.h
>>>>>> index f5ef744b4b..a2dc125291 100644
>>>>>> --- a/xen/arch/arm/include/asm/atomic.h
>>>>>> +++ b/xen/arch/arm/include/asm/atomic.h
>>>>>> @@ -223,8 +223,6 @@ static inline int atomic_add_unless(atomic_t *v,=
 int a, int u)
>>>>>> return __atomic_add_unless(v, a, u);
>>>>>> }
>>>>>> -#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
>>>>>> -
>>>>>=20
>>>>> While I agree this is unused today, the wrapper is quite trivial and =
part of the generic API (x86 also provides one). So I am not in favor of re=
moving it just to please MISRA.
>>>>>=20
>>>>> That said, if Bertrand and Stefano agrees with removing it then you s=
hould also remove the x86 version to avoid inconsistency.
>>>> I think we can keep this and maybe add a comment on top to document a =
known violation:
>>>> /* TODO: MISRA_VIOLATION 2.5 */
>>>=20
>>> While I am fine with this goal of the comment (i.e. indicating where Xe=
n is not MISRA compliant), I think this is one place where I would rather n=
ot want one because it can get stale if someones decide to use the function=
.
>> I think the one doing that will have to update the comment otherwise we =
will never manage to have an analysis without findings.
>=20
> I was under the impression that Xen will never officially follow some of =
the MISRA rules. So I would expect the tools to be able to detect such case=
s so we don't have to add a comment for every deviation on something we wil=
l never support.
>=20
>> Having those kind of comments in the code for violation also means that =
they must be updated if the violation is solved.
>=20
> Right, but for thing like unused function, this is quite easy to miss by =
both the developer and reviewers. So we are going to end up to comments for=
 nothing.
>=20
>> Maybe we will need a run ignoring those to identify possible violations =
which are not violations anymore but this might be hard to do.
>=20
> TBH, I think it would be best if we can teach the tools to ignore certain=
 rules.

Definitely it is possible to instruct the tool to ignore this you are right=
 and for 2.5 we should (for some reason I was under the impression that we =
said we would follow 2.5 but accept deviations).

@Xenia: please ignore and do not add a comment for this.

I think we will need to distinguish 2 kind of not following:
- not following at all (disable in the tools)
- accepting some deviations (documented in the code)

As much as we can, I think we should target the second unless we have a lot=
 of violations.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


