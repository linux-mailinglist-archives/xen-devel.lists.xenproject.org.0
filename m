Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A14539B59
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 04:55:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340180.565148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwEV0-0000M8-0H; Wed, 01 Jun 2022 02:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340180.565148; Wed, 01 Jun 2022 02:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwEUz-0000JX-T6; Wed, 01 Jun 2022 02:54:17 +0000
Received: by outflank-mailman (input) for mailman id 340180;
 Wed, 01 Jun 2022 02:54:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=laj+=WI=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nwEUx-0000JO-Bv
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 02:54:15 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe06::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dc45b9c-e156-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 04:54:13 +0200 (CEST)
Received: from DB6PR0601CA0039.eurprd06.prod.outlook.com (2603:10a6:4:17::25)
 by AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Wed, 1 Jun
 2022 02:54:09 +0000
Received: from DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::aa) by DB6PR0601CA0039.outlook.office365.com
 (2603:10a6:4:17::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 1 Jun 2022 02:54:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT003.mail.protection.outlook.com (100.127.142.89) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 02:54:09 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Wed, 01 Jun 2022 02:54:09 +0000
Received: from 288b93403eee.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2E03D0A5-8B63-4469-9049-A067BFE7B737.1; 
 Wed, 01 Jun 2022 02:53:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 288b93403eee.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Jun 2022 02:53:59 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM0PR08MB5265.eurprd08.prod.outlook.com (2603:10a6:208:160::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Wed, 1 Jun
 2022 02:53:56 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 02:53:56 +0000
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
X-Inumbo-ID: 1dc45b9c-e156-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mBs9enzklMEvm7Nrvt1Wwzc70vQl30RJMEtpGAlDwEE4YRaO9ZOPte6hA4ceyFCefMT2vC1WGmPMbDZ39A1FUgvJGPV9UYhXYc4tzw7mZgDbCiulZ/R5XfUbCixmvgonKeNANlXwxJrWpqK9I3ZoUwiovJhr/KZ/gcRKlNb8T3f5odWchGIgTPxzI+KVKFnkOZRCfWHmRaXUauXeSnkywxoPHkH4lENlbyTWP0c31skqwoGEiglOSYAd8qkwJIKbIJKKN2dHSUsfAOOjzoaVP2ZFzUZ8EkkDSV2+NI6NNaYveIwdJoBX8LMJrZuAtNTD3oBNXUU2w1MQkpLTixdvEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LileIKBCs0q79+iKy8mBX6X0N64r2eTU1O7PYzFUMlQ=;
 b=G+LVTlEBpAPgGJFxCk0hBhvlUKZxlQf+L9uKS/8p4xYxHl30zyJkzwyDU81AtchcJJLzSwiZFAK9xdlg9TKbdT7N/jpWytYC0x+H4MuaKUuqo791m9HZp0zHTXZzpZXp5BvQhHfVBOCmXjabFFzlkuIAZsma8znJL0jrxl+mzA2RwbCcM6Ro5oSACsg3eopAy5Ujgrvh9818II02nzLkMvssxnol4G1HxEmTD608MBijCHRU2GLUKtxAWty196bEj4JxRLxRHuVzaUeakrTQAoQHL/gjXvRg6iNUhKrO0QZzYpVl/uZhUyNGE4IZ/JKN3Yzq0jL/RCVKcdXhdhY3YQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LileIKBCs0q79+iKy8mBX6X0N64r2eTU1O7PYzFUMlQ=;
 b=KIrfFhTwbiNBfipeZiy4CBDZfeiDN5Td1zKxaizubhGqmraDOwup3xlYoN9tdPxqAp6x6Qkmg8EHxl5QbFwx+jmgYeoBStWXVnKviXjJNnkVWrEAhIWSCOg6TkzRJP3fU30UYyordD06BBVF/IMbkWG9lUczlMK/aVdpNY98g08=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qg/4oRAxE+dM9X8BORcfCl/bAFM+BC8oFH3w1/YzqAM9eR1FipAvU4PDeuMX4JBn4FZdflCWnxqTGVzq+ykx3fQQrGicK/1Q3fEeA2e8fL3U61g5ygfLwc9SaMxAPrDEtBIkks5DyCfCDPxYNcip5yFNG2tLHfn8MqBdfqorXE3kiKTJDxSd5OYbInjzDLdsLsGjrX8LTVrRdSvFIjU/coUYCAz/NthVygATX3jZWYBIeBLhLeTiZpbD+9OzzhaVhARoFGGCGeZWYzLRTNdHaXPGL/Cj7ECTCldXqZOeusBvM2FIJy0Rd/eIgKKFZyfu5CsS6yG5w3K209QCEU6lZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LileIKBCs0q79+iKy8mBX6X0N64r2eTU1O7PYzFUMlQ=;
 b=SDixh8hD0YWW0ztdgcIr0gL98nEY7IlYvDwYzeNCFofw+TlVsJ6GveizyZeEP95ktk69vLxAnHXMmYVzqRol7/eERGOzOmS3GOx/lCnfTYOBH7Nl3LhXA1Uyk8fC2a/sXjz6T/mkcVMJJBk54p70pJ9R4146RVtDpaVCs65FyFRMYbOjrTI8wZnCNRly0hkvhWtPWIlsQxHKf4p3N4YTO1QLMFrmGuoUWBd//VLCdOp7JuY2eaFIhuDG31ddJtY5jaEqCjIycSwj0lBxzcYrzQAnrmvgzuOLg9UNT6HUidjlsen9bwx/vGJiIl3eK4AB/0Rw8CHBSn5wfuMnYtrCyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LileIKBCs0q79+iKy8mBX6X0N64r2eTU1O7PYzFUMlQ=;
 b=KIrfFhTwbiNBfipeZiy4CBDZfeiDN5Td1zKxaizubhGqmraDOwup3xlYoN9tdPxqAp6x6Qkmg8EHxl5QbFwx+jmgYeoBStWXVnKviXjJNnkVWrEAhIWSCOg6TkzRJP3fU30UYyordD06BBVF/IMbkWG9lUczlMK/aVdpNY98g08=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 7/8] xen/x86: add detection of memory interleaves for
 different nodes
Thread-Topic: [PATCH v4 7/8] xen/x86: add detection of memory interleaves for
 different nodes
Thread-Index: AQHYbm4HiKDL321oiEuXmbKNpj1MH605Bc8AgADVNxA=
Date: Wed, 1 Jun 2022 02:53:56 +0000
Message-ID:
 <PAXPR08MB7420F087CC36C8E8DB8DFF7E9EDF9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220523062525.2504290-1-wei.chen@arm.com>
 <20220523062525.2504290-8-wei.chen@arm.com>
 <6003b7a5-63c5-9bd3-03db-a4bac5ba8e00@suse.com>
In-Reply-To: <6003b7a5-63c5-9bd3-03db-a4bac5ba8e00@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DD88D475026A6948B3CDB9BB28D0A34E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2e032f31-1f67-48ad-3e38-08da437a0005
x-ms-traffictypediagnostic:
	AM0PR08MB5265:EE_|DBAEUR03FT003:EE_|AS4PR08MB7925:EE_
X-Microsoft-Antispam-PRVS:
	<AS4PR08MB7925848E72B1CD8C0164D2799EDF9@AS4PR08MB7925.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 w3m+yLuqY/8depxOOdHQiawwEHA5uk5l8xpYVHKLdTEwypsvuCK8Yg/PxYVYg7obpcWW+qsJMM2Rw+0TMurC00b96k8CAZZEqVn1tBNIQtCjXo8xAhXo7cftR5Te0246QDWkHsDTn5oZL/HWFiD8T9nWixu/06pUiPR0OKibxvdOBY9QtjSaxPao2VGuY4FovCNT01AMsOTvw5MziDrBY174+8p+gMK7i1hA5hHGlmZq9rGcNFVpwzz7jEhe0C4042CJ9av9OCSAkdS9T2T9poUtAEyAcN8FTmPh8ZkyjI8yotp/J5cItRikpQfeoZMcxu9nPBLzULROJERDSjHv/Hp4GsmiEAEn0sZlV4qHuHopxAgfovQCo44NDQgAW5+mNKpXS+2WTwcJ4DFglAL/1A9gPKOpByrXHxoJuZsxEj/JEUr0RYm7k1CKc+ONookeOQy4AYrnpkIuDdI7AEc1Nx1wP2KqbbujcoYjg8QktFYD+u/4McBedHevb47ZENtS7c3LT0YX7U4GjJ7ciRWywlTDJf4mrKXjc6J0HhBdEoifqLY6V5GEynLVLVDnkt0NKNuOmq2CvB4RU0P8cjeyoRP3ClKVaUbm/U9IPAUPoTsf2VOFWEy81L+Ks4T+tUaTIdY2CdFGZFuF2IUqyb9SHMIQc8Neb7xvofpid7GsG9hEmKPa8X3YT/Iil/fc5iwROggsiKdf9hzPz68PMVv6Ug==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(38070700005)(86362001)(2906002)(83380400001)(64756008)(6916009)(54906003)(508600001)(76116006)(8676002)(55016003)(316002)(66556008)(66476007)(66446008)(71200400001)(66946007)(4326008)(33656002)(7696005)(52536014)(5660300002)(6506007)(186003)(38100700002)(8936002)(9686003)(26005)(53546011);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5265
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ad6c369-1d0d-48f6-1b22-08da4379f87a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lpJx6A9SaOkG5N3L12QHjaLUhC7wH5FECj+hJnUQhvTJi6KeI0OXffj4AxErWO2SLCYg4Qlhgr0MlAyBA+GE7s46D+k3z5R/Qsn3L7q2JR9c97J2pLMIKqEbwcQljb+3ARjKrLyi7szfzoFr8QKO6GiGcEeYtrbDRJCZC2GJ3uRYywc4/7upmDLbsoFJb92uiMVY8ZoIcc47Gy2iMDdedvZ2byhlHFichT/mbOUaRzI4uyB6q8BKSmYh62XJ67dvgLTXJ5w6g1qYJUw9AhmTT/WXYJljXARuYZyX2ocm2zifli6s/N71kECvSMwdbtGL8II0LsKp2XNZDc8YheXTKjOhFqOEPnIqQkZjj7mIlqdtDLWGGkecal2A/UP7XVh//f5Exixbp7w8++/FsYv6tPrdvPd80E6vIJPogRmRR5X0ayiml3kJsspC01HYHt9aErYi4b+cspgzKO6X93G+Ja3fxjyfOeEWt6IcEs99kbzADxkTauaKHG8D4w1xkxoJi5TXPUWRKIpNTyvDtxZCVTDekVu5ADwN/dTiXyxYyngGd1PkvMOD64a4ModZ16tCOMfT7JnQMI9+N/MnFdLBIVLVjM/HPTers25R3EZglhxRQYO2Sg4+tIiksjzk6XFrvApthPUQh/QQKeagtv6UWAp8yf8G43rBDp0jtIxbwCZ4O5gZj4uRh448+LtZdHNp
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(7696005)(70586007)(70206006)(4326008)(6506007)(8676002)(26005)(9686003)(82310400005)(316002)(2906002)(40460700003)(52536014)(86362001)(6862004)(5660300002)(508600001)(8936002)(356005)(336012)(47076005)(36860700001)(55016003)(33656002)(186003)(54906003)(81166007)(83380400001)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 02:54:09.1761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e032f31-1f67-48ad-3e38-08da437a0005
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7925

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDXmnIgzMeaXpSAyMToyMQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBKaWFt
ZWkgWGllDQo+IDxKaWFtZWkuWGllQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA3LzhdIHhlbi94ODY6IGFkZCBkZXRlY3Rp
b24gb2YgbWVtb3J5IGludGVybGVhdmVzDQo+IGZvciBkaWZmZXJlbnQgbm9kZXMNCj4gDQo+IE9u
IDIzLjA1LjIwMjIgMDg6MjUsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEBAIC0xMTksMjAgKzEyNSw0
NSBAQCBpbnQgdmFsaWRfbnVtYV9yYW5nZShwYWRkcl90IHN0YXJ0LCBwYWRkcl90IGVuZCwNCj4g
bm9kZWlkX3Qgbm9kZSkNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiAtc3RhdGlj
IF9faW5pdCBpbnQgY29uZmxpY3RpbmdfbWVtYmxrcyhwYWRkcl90IHN0YXJ0LCBwYWRkcl90IGVu
ZCkNCj4gPiArc3RhdGljDQo+ID4gK2VudW0gY29uZmxpY3RzIF9faW5pdCBjb25mbGljdGluZ19t
ZW1ibGtzKG5vZGVpZF90IG5pZCwgcGFkZHJfdCBzdGFydCwNCj4gPiArCQkJCQkgIHBhZGRyX3Qg
ZW5kLCBwYWRkcl90IG5kX3N0YXJ0LA0KPiA+ICsJCQkJCSAgcGFkZHJfdCBuZF9lbmQsIHVuc2ln
bmVkIGludCAqbWJsa2lkKQ0KPiA+ICB7DQo+ID4gLQlpbnQgaTsNCj4gPiArCXVuc2lnbmVkIGlu
dCBpOw0KPiA+DQo+ID4gKwkvKg0KPiA+ICsJICogU2NhbiBhbGwgcmVjb3JkZWQgbm9kZXMnIG1l
bW9yeSBibG9ja3MgdG8gY2hlY2sgY29uZmxpY3RzOg0KPiA+ICsJICogT3ZlcmxhcCBvciBpbnRl
cmxlYXZlLg0KPiA+ICsJICovDQo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgbnVtX25vZGVfbWVtYmxr
czsgaSsrKSB7DQo+ID4gIAkJc3RydWN0IG5vZGUgKm5kID0gJm5vZGVfbWVtYmxrX3JhbmdlW2ld
Ow0KPiA+ICsNCj4gPiArCQkqbWJsa2lkID0gaTsNCj4gPiArDQo+ID4gKwkJLyogU2tpcCAwIGJ5
dGVzIG5vZGUgbWVtb3J5IGJsb2NrLiAqLw0KPiA+ICAJCWlmIChuZC0+c3RhcnQgPT0gbmQtPmVu
ZCkNCj4gPiAgCQkJY29udGludWU7DQo+ID4gKwkJLyoNCj4gPiArCQkgKiBVc2UgbWVtYmxrIHJh
bmdlIHRvIGNoZWNrIG1lbWJsayBvdmVybGFwcywgaW5jbHVkZSB0aGUNCj4gPiArCQkgKiBzZWxm
LW92ZXJsYXAgY2FzZS4NCj4gPiArCQkgKi8NCj4gPiAgCQlpZiAobmQtPmVuZCA+IHN0YXJ0ICYm
IG5kLT5zdGFydCA8IGVuZCkNCj4gPiAtCQkJcmV0dXJuIGk7DQo+ID4gKwkJCXJldHVybiBPVkVS
TEFQOw0KPiA+ICAJCWlmIChuZC0+ZW5kID09IGVuZCAmJiBuZC0+c3RhcnQgPT0gc3RhcnQpDQo+
ID4gLQkJCXJldHVybiBpOw0KPiA+ICsJCQlyZXR1cm4gT1ZFUkxBUDsNCj4gDQo+IEtub3dpbmcg
dGhhdCBuZCdzIHJhbmdlIGlzIG5vbi1lbXB0eSwgaXMgdGhpcyAybmQgY29uZGl0aW9uIGFjdHVh
bGx5DQo+IG5lZWRlZCBoZXJlPyAoU3VjaCBhbiBhZGp1c3RtZW50LCBpZiB5b3UgZGVjaWRlZCB0
byBtYWtlIGl0IGFuZCBpZiBub3QNCj4gc3BsaXQgb3V0IHRvIGEgc2VwYXJhdGUgcGF0Y2gsIHdv
dWxkIG5lZWQgY2FsbGluZyBvdXQgaW4gdGhlDQo+IGRlc2NyaXB0aW9uLikNCg0KVGhlIDJuZCBj
b25kaXRpb24gaGVyZSwgeW91IG1lYW50IGlzICIobmQtPmVuZCA9PSBlbmQgJiYgbmQtPnN0YXJ0
ID09IHN0YXJ0KSINCm9yIGp1c3QgIm5kLT5zdGFydCA9PSBzdGFydCIgYWZ0ZXIgIiYmIj8NCg0K
TXkgdW5kZXJzdGFuZGluZyBpcyB0aGUgZmlyc3QgY2FzZSwgIihuZC0+ZW5kID09IGVuZCAmJiBu
ZC0+c3RhcnQgPT0gc3RhcnQpIg0Kd2lsbCBiZSBjb3ZlcmVkIGJ5ICIobmQtPmVuZCA+IHN0YXJ0
ICYmIG5kLT5zdGFydCA8IGVuZCkiLiBJZiBzbywgSSdsbCByZW1vdmUNCml0IGluIHRoZSBuZXh0
IHZlcnNpb24gYW5kIGFkZCBzb21lIGRlc2NyaXB0aW9ucyBpbiB0aGUgY29tbWl0IGxvZyBhbmQg
Y29kZQ0KY29tbWVudC4NCg0KPiANCj4gPiArCQkvKg0KPiA+ICsJCSAqIFVzZSBub2RlIG1lbW9y
eSByYW5nZSB0byBjaGVjayB3aGV0aGVyIG5ldyByYW5nZSBjb250YWlucw0KPiA+ICsJCSAqIG1l
bW9yeSBmcm9tIG90aGVyIG5vZGVzIC0gaW50ZXJsZWF2ZSBjaGVjay4gV2UganVzdCBuZWVkDQo+
ID4gKwkJICogdG8gY2hlY2sgZnVsbCBjb250YWlucyBzaXR1YXRpb24uIEJlY2F1c2Ugb3Zlcmxh
cHMgaGF2ZQ0KPiA+ICsJCSAqIGJlZW4gY2hlY2tlZCBhYm92ZS4NCj4gPiArCQkgKi8NCj4gPiAr
CSAgICAgICAgaWYgKG5pZCAhPSBtZW1ibGtfbm9kZWlkW2ldICYmDQo+ID4gKwkJICAgIChuZF9z
dGFydCA8IG5kLT5zdGFydCAmJiBuZC0+ZW5kIDwgbmRfZW5kKSkNCj4gPiArCQkJcmV0dXJuIElO
VEVSTEVBVkU7DQo+IA0KPiBEb2Vzbid0IHRoaXMgbmVlZCB0byBiZSA8PSBpbiBib3RoIGNhc2Vz
IChhbGJlaXQgSSB0aGluayBvbmUgb2YgdGhlIHR3bw0KPiBleHByZXNzaW9ucyB3b3VsZCB3YW50
IHN3aXRjaGluZyBhcm91bmQsIHRvIGJldHRlciBsaW5lIHVwIHdpdGggdGhlDQo+IGVhcmxpZXIg
b25lLCB2aXNpYmxlIGluIGNvbnRleHQgZnVydGhlciB1cCkuDQo+IA0KDQpZZXMsIEkgd2lsbCBh
ZGQgIj0iaW4gYm90aCBjYXNlcy4gQnV0IGZvciBzd2l0Y2hpbmcgYXJvdW5kLCBJIGFsc28NCndh
bnRlZCB0byBtYWtlIGEgYmV0dGVyIGxpbmUgdXAuIEJ1dCBpZiBuaWQgPT0gbWVtYmxrX25vZGVp
ZFtpXSwNCnRoZSBjaGVjayBvZiAobmRfc3RhcnQgPCBuZC0+c3RhcnQgJiYgbmQtPmVuZCA8IG5k
X2VuZCkgaXMgbWVhbmluZ2xlc3MuDQpJJ2xsIGFkanVzdCB0aGVpciBvcmRlciBpbiB0aGUgbmV4
dCB2ZXJzaW9uIGlmIHlvdSB0aGluayB0aGlzIGlzDQphY2NlcHRhYmxlLg0KDQo+ID4gQEAgLTI3
NSwxMCArMzA2LDEzIEBAIGFjcGlfbnVtYV9wcm9jZXNzb3JfYWZmaW5pdHlfaW5pdChjb25zdCBz
dHJ1Y3QNCj4gYWNwaV9zcmF0X2NwdV9hZmZpbml0eSAqcGEpDQo+ID4gIHZvaWQgX19pbml0DQo+
ID4gIGFjcGlfbnVtYV9tZW1vcnlfYWZmaW5pdHlfaW5pdChjb25zdCBzdHJ1Y3QgYWNwaV9zcmF0
X21lbV9hZmZpbml0eSAqbWEpDQo+ID4gIHsNCj4gPiArCWVudW0gY29uZmxpY3RzIHN0YXR1czsN
Cj4gDQo+IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdGhpcyBsb2NhbCB2YXJpYWJsZS4NCj4gDQoN
CldoeSBJIGRvbid0IG5lZWQgdGhpcyBvbmU/IERpZCB5b3UgbWVhbiBJIGNhbiB1c2UNCnN3aXRj
aCAoY29uZmxpY3RpbmdfbWVtYmxrcyguLi4pKSBkaXJlY3RseT8NCg0KPiA+IEBAIC0zMTAsNDIg
KzM0NCw3OCBAQCBhY3BpX251bWFfbWVtb3J5X2FmZmluaXR5X2luaXQoY29uc3Qgc3RydWN0DQo+
IGFjcGlfc3JhdF9tZW1fYWZmaW5pdHkgKm1hKQ0KPiA+ICAJCWJhZF9zcmF0KCk7DQo+ID4gIAkJ
cmV0dXJuOw0KPiA+ICAJfQ0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBGb3IgdGhlIG5vZGUg
dGhhdCBhbHJlYWR5IGhhcyBzb21lIG1lbW9yeSBibG9ja3MsIHdlIHdpbGwNCj4gPiArCSAqIGV4
cGFuZCB0aGUgbm9kZSBtZW1vcnkgcmFuZ2UgdGVtcG9yYXJpbHkgdG8gY2hlY2sgbWVtb3J5DQo+
ID4gKwkgKiBpbnRlcmxlYXZlcyB3aXRoIG90aGVyIG5vZGVzLiBXZSB3aWxsIG5vdCB1c2UgdGhp
cyBub2RlDQo+ID4gKwkgKiB0ZW1wIG1lbW9yeSByYW5nZSB0byBjaGVjayBvdmVybGFwcywgYmVj
YXVzZSBpdCB3aWxsIG1hc2sNCj4gPiArCSAqIHRoZSBvdmVybGFwcyBpbiBzYW1lIG5vZGUuDQo+
ID4gKwkgKg0KPiA+ICsJICogTm9kZSB3aXRoIDAgYnl0ZXMgbWVtb3J5IGRvZXNuJ3QgbmVlZCB0
aGlzIGV4cGFuZHNpb24uDQo+ID4gKwkgKi8NCj4gPiArCW5kX3N0YXJ0ID0gc3RhcnQ7DQo+ID4g
KwluZF9lbmQgPSBlbmQ7DQo+ID4gKwluZCA9ICZub2Rlc1tub2RlXTsNCj4gPiArCWlmIChuZC0+
c3RhcnQgIT0gbmQtPmVuZCkgew0KPiA+ICsJCWlmIChuZF9zdGFydCA+IG5kLT5zdGFydCkNCj4g
PiArCQkJbmRfc3RhcnQgPSBuZC0+c3RhcnQ7DQo+ID4gKw0KPiA+ICsJCWlmIChuZF9lbmQgPCBu
ZC0+ZW5kKQ0KPiA+ICsJCQluZF9lbmQgPSBuZC0+ZW5kOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAg
CS8qIEl0IGlzIGZpbmUgdG8gYWRkIHRoaXMgYXJlYSB0byB0aGUgbm9kZXMgZGF0YSBpdCB3aWxs
IGJlIHVzZWQNCj4gbGF0ZXIqLw0KPiA+IC0JaSA9IGNvbmZsaWN0aW5nX21lbWJsa3Moc3RhcnQs
IGVuZCk7DQo+ID4gLQlpZiAoaSA8IDApDQo+ID4gLQkJLyogZXZlcnl0aGluZyBmaW5lICovOw0K
PiA+IC0JZWxzZSBpZiAobWVtYmxrX25vZGVpZFtpXSA9PSBub2RlKSB7DQo+ID4gLQkJYm9vbCBt
aXNtYXRjaCA9ICEobWEtPmZsYWdzICYgQUNQSV9TUkFUX01FTV9IT1RfUExVR0dBQkxFKSAhPQ0K
PiA+IC0JCSAgICAgICAgICAgICAgICAhdGVzdF9iaXQoaSwgbWVtYmxrX2hvdHBsdWcpOw0KPiA+
IC0NCj4gPiAtCQlwcmludGsoIiVzU1JBVDogUFhNICV1ICglIlBSSXBhZGRyIi0lIlBSSXBhZGRy
Iikgb3ZlcmxhcHMgd2l0aA0KPiBpdHNlbGYgKCUiUFJJcGFkZHIiLSUiUFJJcGFkZHIiKVxuIiwN
Cj4gPiAtCQkgICAgICAgbWlzbWF0Y2ggPyBLRVJOX0VSUiA6IEtFUk5fV0FSTklORywgcHhtLCBz
dGFydCwgZW5kLA0KPiA+IC0JCSAgICAgICBub2RlX21lbWJsa19yYW5nZVtpXS5zdGFydCwgbm9k
ZV9tZW1ibGtfcmFuZ2VbaV0uZW5kKTsNCj4gPiAtCQlpZiAobWlzbWF0Y2gpIHsNCj4gPiArCXN0
YXR1cyA9IGNvbmZsaWN0aW5nX21lbWJsa3Mobm9kZSwgc3RhcnQsIGVuZCwgbmRfc3RhcnQsIG5k
X2VuZCwgJmkpOw0KPiA+ICsJc3dpdGNoKHN0YXR1cykNCj4gPiArCXsNCj4gDQo+IFN0eWxlOiBN
aXNzaW5nIGJsYW5rIGJlZm9yZSAoIGFuZCB0aGUgYnJhY2UgZ29lcyBvbiB0aGUgc2FtZSBsaW5l
IGhlcmUNCj4gKExpbnV4IHN0eWxlKS4NCj4gDQoNCk9rLg0KDQo+ID4gKwljYXNlIE9WRVJMQVA6
DQo+ID4gKwl7DQo+IA0KPiBQbGVhc2Ugb21pdCBicmFjZXMgYXQgY2FzZSBsYWJlbHMgdW5sZXNz
IHlvdSBuZWVkIGEgbmV3IHNjb3BlIHRvIGRlY2xhcmUNCj4gdmFyaWFibGVzLg0KPiANCg0KT0su
DQoNCj4gPiArCQlpZiAobWVtYmxrX25vZGVpZFtpXSA9PSBub2RlKSB7DQo+ID4gKwkJCWJvb2wg
bWlzbWF0Y2ggPSAhKG1hLT5mbGFncyAmDQo+ID4gKwkJCQkJICBBQ1BJX1NSQVRfTUVNX0hPVF9Q
TFVHR0FCTEUpICE9DQo+ID4gKwkJCSAgICAgICAgICAgICAgICAhdGVzdF9iaXQoaSwgbWVtYmxr
X2hvdHBsdWcpOw0KPiA+ICsNCj4gPiArCQkJcHJpbnRrKCIlc1NSQVQ6IFBYTSAldSAoJSJQUklw
YWRkciItJSJQUklwYWRkciIpDQo+IG92ZXJsYXBzIHdpdGggaXRzZWxmICglIlBSSXBhZGRyIi0l
IlBSSXBhZGRyIilcbiIsDQo+ID4gKwkJCSAgICAgICBtaXNtYXRjaCA/IEtFUk5fRVJSIDogS0VS
Tl9XQVJOSU5HLCBweG0sIHN0YXJ0LA0KPiA+ICsJCQkgICAgICAgZW5kLCBub2RlX21lbWJsa19y
YW5nZVtpXS5zdGFydCwNCj4gPiArCQkJICAgICAgIG5vZGVfbWVtYmxrX3JhbmdlW2ldLmVuZCk7
DQo+ID4gKwkJCWlmIChtaXNtYXRjaCkgew0KPiA+ICsJCQkJYmFkX3NyYXQoKTsNCj4gPiArCQkJ
CXJldHVybjsNCj4gPiArCQkJfQ0KPiA+ICsJCQlicmVhazsNCj4gPiArCQl9IGVsc2Ugew0KPiA+
ICsJCQlwcmludGsoS0VSTl9FUlINCj4gPiArCQkJICAgICAgICJTUkFUOiBQWE0gJXUgKCUiUFJJ
cGFkZHIiLSUiUFJJcGFkZHIiKSBvdmVybGFwcw0KPiB3aXRoIFBYTSAldSAoJSJQUklwYWRkciIt
JSJQUklwYWRkciIpXG4iLA0KPiA+ICsJCQkgICAgICAgcHhtLCBzdGFydCwgZW5kLCBub2RlX3Rv
X3B4bShtZW1ibGtfbm9kZWlkW2ldKSwNCj4gPiArCQkJICAgICAgIG5vZGVfbWVtYmxrX3Jhbmdl
W2ldLnN0YXJ0LA0KPiA+ICsJCQkgICAgICAgbm9kZV9tZW1ibGtfcmFuZ2VbaV0uZW5kKTsNCj4g
PiAgCQkJYmFkX3NyYXQoKTsNCj4gPiAgCQkJcmV0dXJuOw0KPiA+ICAJCX0NCj4gDQo+IFRvIGxp
bWl0IGluZGVudGF0aW9uIGRlcHRoLCBvbiBvZiB0aGUgdHdvIHNpZGVzIG9mIHRoZSBjb25kaXRp
b25hbCBjYW4NCj4gYmUgbW92ZWQgb3V0LCBieSBvbWl0dGluZyB0aGUgdW5uZWNlc3NhcnkgImVs
c2UiLiBUbyByZWR1Y2UgdGhlIGRpZmYNCj4gaXQgbWF5IGJlIHdvcnRod2hpbGUgdG8gaW52ZXJ0
IHRoZSBpZigpIGNvbmRpdGlvbiwgYWxsb3dpbmcgdGhlICh0aGVuDQo+IGltcGxpY2l0KSAiZWxz
ZSIgY2FzZSB0byByZW1haW4gKGFsbW9zdCkgdW5jaGFuZ2VkIGZyb20gdGhlIG9yaWdpbmFsLg0K
PiANCg0KSSB3aWxsIGFkanVzdCB0aGVtIGluIG5leHQgdmVyc2lvbi4NCg0KPiA+IC0JfSBlbHNl
IHsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwljYXNlIElOVEVSTEVBVkU6DQo+ID4gKwl7DQo+ID4g
IAkJcHJpbnRrKEtFUk5fRVJSDQo+ID4gLQkJICAgICAgICJTUkFUOiBQWE0gJXUgKCUiUFJJcGFk
ZHIiLSUiUFJJcGFkZHIiKSBvdmVybGFwcyB3aXRoDQo+IFBYTSAldSAoJSJQUklwYWRkciItJSJQ
UklwYWRkciIpXG4iLA0KPiA+IC0JCSAgICAgICBweG0sIHN0YXJ0LCBlbmQsIG5vZGVfdG9fcHht
KG1lbWJsa19ub2RlaWRbaV0pLA0KPiA+ICsJCSAgICAgICAiU1JBVO+8miBQWE0gJXU6ICglIlBS
SXBhZGRyIi0lIlBSSXBhZGRyIikgaW50ZXJsZWF2ZXMNCj4gd2l0aCBQWE0gJXUgbWVtYmxrICgl
IlBSSXBhZGRyIi0lIlBSSXBhZGRyIilcbiIsDQo+ID4gKwkJICAgICAgIG5vZGUsIG5kX3N0YXJ0
LCBuZF9lbmQsIG5vZGVfdG9fcHhtKG1lbWJsa19ub2RlaWRbaV0pLA0KPiANCj4gSG1tLCB5b3Ug
aGF2ZSBQWE0gaW4gdGhlIGxvZyBtZXNzYWdlIHRleHQsIGJ1dCB5b3Ugc3RpbGwgcGFzcyAibm9k
ZSIgYXMNCj4gZmlyc3QgYXJndW1lbnQuDQo+IA0KDQpJIHdpbGwgZml4IGl0Lg0KDQo+IFNpbmNl
IHlvdSdyZSB0b3VjaGluZyBhbGwgdGhlc2UgbWVzc2FnZXMsIGNvdWxkIEkgYXNrIHlvdSB0byBj
b252ZXJ0DQo+IGFsbCByYW5nZXMgdG8gcHJvcGVyIG1hdGhlbWF0aWNhbCBpbnRlcnZhbCByZXBy
ZXNlbnRhdGlvbj8gSS5lLg0KPiBbc3RhcnQsZW5kKSBoZXJlIGFpdWkgYXMgdGhlIGVuZCBhZGRy
ZXNzZXMgbG9vayB0byBiZSBub24taW5jbHVzaXZlLg0KPiANCg0KU3VyZSwgSSB3aWxsIGRvIGl0
Lg0KDQo+ID4gIAkJICAgICAgIG5vZGVfbWVtYmxrX3JhbmdlW2ldLnN0YXJ0LCBub2RlX21lbWJs
a19yYW5nZVtpXS5lbmQpOw0KPiA+ICAJCWJhZF9zcmF0KCk7DQo+ID4gIAkJcmV0dXJuOw0KPiA+
ICAJfQ0KPiA+IC0JaWYgKCEobWEtPmZsYWdzICYgQUNQSV9TUkFUX01FTV9IT1RfUExVR0dBQkxF
KSkgew0KPiA+IC0JCXN0cnVjdCBub2RlICpuZCA9ICZub2Rlc1tub2RlXTsNCj4gPg0KPiA+IC0J
CWlmICghbm9kZV90ZXN0X2FuZF9zZXQobm9kZSwgbWVtb3J5X25vZGVzX3BhcnNlZCkpIHsNCj4g
PiAtCQkJbmQtPnN0YXJ0ID0gc3RhcnQ7DQo+ID4gLQkJCW5kLT5lbmQgPSBlbmQ7DQo+ID4gLQkJ
fSBlbHNlIHsNCj4gPiAtCQkJaWYgKHN0YXJ0IDwgbmQtPnN0YXJ0KQ0KPiA+IC0JCQkJbmQtPnN0
YXJ0ID0gc3RhcnQ7DQo+ID4gLQkJCWlmIChuZC0+ZW5kIDwgZW5kKQ0KPiA+IC0JCQkJbmQtPmVu
ZCA9IGVuZDsNCj4gPiAtCQl9DQo+ID4gKwlkZWZhdWx0Og0KPiA+ICsJCWJyZWFrOw0KPiANCj4g
VGhpcyB3YW50cyB0byBiZSAiY2FzZSBOT19DT05GTElDVDoiLCBzdWNoIHRoYXQgdGhlIGNvbXBp
bGVyIHdvdWxkDQo+IHdhcm4gaWYgYSBuZXcgZW51bWVyYXRvciBhcHBlYXJzIHdpdGhvdXQgYWRk
aW5nIGNvZGUgaGVyZS4gKEFuDQo+IGFsdGVybmF0aXZlIC0gd2hpY2ggcGVyc29uYWxseSBJIGRv
bid0IGxpa2UgLSB3b3VsZCBiZSB0byBwdXQNCj4gQVNTRVJUX1VOUkVBQ0hBQkxFKCkgaW4gdGhl
IGRlZmF1bHQ6IGNhc2UuIFRoZSBkb3duc2lkZSBpcyB0aGF0DQo+IHRoZW4gdGhlIGlzc3VlIHdv
dWxkIG9ubHkgYmUgbm90aWNlYWJsZSBhdCBydW50aW1lLikNCj4gDQoNClRoYW5rcywgSSB3aWxs
IGFkanVzdCBpdCB0bzoNCgljYXNlIE5PX0NPTkZMSUNUOg0KCQlicmVhazsNCglkZWZhdWx0Og0K
CQlBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCmluIG5leHQgdmVyc2lvbi4NCg0KDQo+IEphbg0KDQo=

