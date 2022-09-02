Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD665AA88B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 09:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397404.637972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU0pF-0003Q1-J7; Fri, 02 Sep 2022 07:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397404.637972; Fri, 02 Sep 2022 07:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU0pF-0003Me-G3; Fri, 02 Sep 2022 07:10:49 +0000
Received: by outflank-mailman (input) for mailman id 397404;
 Fri, 02 Sep 2022 07:10:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnAz=ZF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oU0pE-0003Lp-43
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 07:10:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d18ceae-2a8e-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 09:10:45 +0200 (CEST)
Received: from DU2PR04CA0311.eurprd04.prod.outlook.com (2603:10a6:10:2b5::16)
 by DBBPR08MB5898.eurprd08.prod.outlook.com (2603:10a6:10:20c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 07:10:43 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::d2) by DU2PR04CA0311.outlook.office365.com
 (2603:10a6:10:2b5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14 via Frontend
 Transport; Fri, 2 Sep 2022 07:10:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 07:10:43 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Fri, 02 Sep 2022 07:10:43 +0000
Received: from 265fb81e5b83.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 607692D6-857E-4E25-98CF-1C1393D8F2BF.1; 
 Fri, 02 Sep 2022 07:10:37 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 265fb81e5b83.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 07:10:37 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by GV1PR08MB8083.eurprd08.prod.outlook.com (2603:10a6:150:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 07:10:34 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::9c00:1efb:1e42:3b20]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::9c00:1efb:1e42:3b20%7]) with mapi id 15.20.5588.012; Fri, 2 Sep 2022
 07:10:34 +0000
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
X-Inumbo-ID: 5d18ceae-2a8e-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iXzV0VeDxoIzcXlybg34vV4nKxDs2nxFdCzQE9GLD3VdaKZSNBJDeazha36CemI6YopfC6zZ0ktEKrOTMGv87Jsqaeta/LUVooOmxdB8xxx3Py3KbKFPkcKd0DagRsoHSspEuZaXINUe7aRiz/Yybu5EAmh4VyyXkKfRTp8fB1lS2BkaTOp7v5IwOjbFv2OUPdUvcb/MI2guz9FKhNdbs+SWC4l67ICQ0Kcgvem0xxw8I4HWt3k4dSR5PqAS+zLpAxoqCI1kbwx5ONuNgqaKMpX2vSgPmE37mz62Pble2bcTdO7FBHWRz/6YQfb4xTDWpvlebZPG3u5EI7tPVOCiUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8/CfeCztkl9UZ0Gv642GE2S/5O7CvFEFtWFvLIHtO8=;
 b=b03KQdl8P/ugUzomRPQ7ydL/fuHwPY9S76Jy9oOUyEFFH7Og6ULvQ+N03z5POVpSXqeGzoP6XS+UtYw9bF+orvnS0yceSBSwAN0i/V5Ix3wQ+kjArZk1M6m217IJ3bYhNcQ75jKjTOOeLnaH4NtZRWa705cmT7gnWpuL4q9MnCA5TTRVWHYwfjB5gm9ysLt6bSi0lCC9b8aeQO7nc8LbJiFCgq+485c54vq9vmEQZTEYvEKNC5DGUDKU+iUlAMcCZ8OZFGkslsT7yzRUEZqJDhzjBtlT+yDKpOXy9BoNXGfYl/xVltaTKLWq6x5yUll3DVhY/Jfeh+z8HeF8t3Tkcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8/CfeCztkl9UZ0Gv642GE2S/5O7CvFEFtWFvLIHtO8=;
 b=x392sJlSU24HpqVMRIxgQrdY58i+eyK0ktG1f8YWM5+PQ+ZdBjzLVmvFRqpp/EGvShsZdP5rOaJ8GQHXROOc2odxzx43YWpX6IZbpBRtrtG+Ms3AqiQC3BG5foxt7v12ugWhWGuGjFtFbjFUB12qeV3yUgAXMEv8zr+kqcKOrp0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSZ0mzcL3jMPweRz0qajR9RmV163IuWBdo9EJrczVmd9Muc2qA2NfErAb0gC7Xh53sQLLJGSxyftrvhl5r7slzUO/QK+DuugrkxxSNKzX6qGH5ofg+aC1GMwgVNtV/HHqgVUseaAHmrbe8T9/MGi759ysXe4kE/f2vIAua99icGSJqrvSZdC1jVU2MHk1dh+aU3RUSTcY2WgOy02pwrGv6vS2kIypcTRfqH0WwBVI4AHkeJ53APR8EeyHmjNEaUt2eQC8jPYS1EEs0NWsOK7mg/OCo6e/njyECgvwAYOHkx4vG4jsTBk4WSW74b80VV1eWDlKeHLGl4gRjNxQC2Acw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8/CfeCztkl9UZ0Gv642GE2S/5O7CvFEFtWFvLIHtO8=;
 b=I0tXA0W3LAn68rOZE/3C3XBSMjmvN9E15arOv0IJCfb98/BtaSc5Kxf42fziikGe/tIU9aIEfAGzs6OhxuaeGfS7likRD0yny25cTsdcwWJ5CYExRoLTIp2svUH+GpEb8iCj79IpM4EvTsifKXQv4Z0ge4IM2axdFwkbBDGvht1Ly18fD4Ba7k9LPnse5ujAH6n2yWnjJlcTtuD3V6Zuckd+DQH5q8GfcyITt8i7qkPTbU3CoVw7Xc1PAWdLg7T+djpeE66aXGenbM37nb3+cVI88/5wPAeNGkuVMCNguTikxINj0HgR6/Q3JoAE0Dv8h5olDni+LtUDcbsTrEmgnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8/CfeCztkl9UZ0Gv642GE2S/5O7CvFEFtWFvLIHtO8=;
 b=x392sJlSU24HpqVMRIxgQrdY58i+eyK0ktG1f8YWM5+PQ+ZdBjzLVmvFRqpp/EGvShsZdP5rOaJ8GQHXROOc2odxzx43YWpX6IZbpBRtrtG+Ms3AqiQC3BG5foxt7v12ugWhWGuGjFtFbjFUB12qeV3yUgAXMEv8zr+kqcKOrp0=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v11 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v11 6/6] xen: retrieve reserved pages on populate_physmap
Thread-Index: AQHYvOMsvYdyv+g/RU6qDpjhWsAPd63KmnWAgAEgCQA=
Date: Fri, 2 Sep 2022 07:10:34 +0000
Message-ID:
 <AM0PR08MB45306B56E3664A09F3A6BC38F77A9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20220831024041.468757-1-Penny.Zheng@arm.com>
 <20220831024041.468757-7-Penny.Zheng@arm.com>
 <9d328b4d-ef7a-e457-428d-83a2b2351465@xen.org>
In-Reply-To: <9d328b4d-ef7a-e457-428d-83a2b2351465@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A40F94C6AB77C648A56041E4CAB3CC69.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 99eff9c6-e8a5-4d36-ecc5-08da8cb24021
x-ms-traffictypediagnostic:
	GV1PR08MB8083:EE_|DBAEUR03FT062:EE_|DBBPR08MB5898:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dGvAX+PQ7H/HpjqZpt21bpUNiNt81G5OS5dxsLETwPnUl8GQGhyaC/dbnvdAJqkKXk4qUan7V6aCKuFcphBs1g0C1/xl1trdJ7xeYzYT+0XHKyE5eSf8+7q/uLIIzfDbi3/HTC/7MHr65V6hCXv70Qf5BsrKg/IbecWgd9urUe+Jc/jkH2wWkul6eiNH4IwgsKsmv8vEiQfw42qiKtsC6yAoOm7blEgL684igrAnUND/fARZ1o0GOfQjwA4Zl+fc5AjEjhFYcxEHgKvkPfxv3N8FU6kAK6OkBQ+GsJRvDR/AG1bbRLo/Q4TKsXGqt0UQoIQ4KYcmAu9PCrvcvXTq990AgVnFMZMjwBzXRJlzeLyKOhnFlMIKOcykjOQp8HnSXrzLzXFV4sL89IkyiTFymwzQbg+8y7MqM1LTptpTTpJZOxqaWnIcHvABOCyQyIIU8WMh2XprSOtEek3r11m/YurHqGfFJWSLdK7db7u4odu71YbVEwBD5w8Zdr4a/zpAgkcIKe2GTRh8dzX/CVh2t66nSafIyy3ShpFKasf2XK8Lf2/g1HLA5mhGCyEmHrNWGwLK02CddYhpS6eUo3yxP5gQg2YGEsdSck1Jx5RqvBuc9Y1YnpLFDN/aU5Rwj88vivHQO33O+oPliGMYd8xGsgaiF1kixPdwaaKa+giVu/3mRoj9Gk4MbfCe2aZ5rTg5SJebubacgNk4A6ykINpZldoQb264IMoQZ4PkJN7zxcgk8M33e1l40lwUUqHLlE2+pLYc7JFrIRLm7JR/e8ZBjg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(66946007)(66556008)(41300700001)(66476007)(4326008)(64756008)(76116006)(83380400001)(186003)(54906003)(478600001)(110136005)(316002)(33656002)(26005)(9686003)(66446008)(8676002)(53546011)(55016003)(7696005)(6506007)(86362001)(38070700005)(71200400001)(5660300002)(8936002)(2906002)(52536014)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8083
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4862b49d-0a39-4883-1f83-08da8cb23afa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oCwmhgkqDaQs/N4jcDTbeVL4Ub99EolNepyzfvjbi9gcWVh5Q8ByAnJx51AFwuhj0irBgVDfKQdzoQDR+UhraWn1OaLqqYuB+cLIQweSXMEuhQINzRtIBeNlykAmH4fksKQYp0j8A9aCc5UQBkn4ccnqn8OqG5r1di/TzEnox3gDzGCuGzKbOL8WaQkOQBoSmEZL3OMzksURwJ8LEVLkIoA0haFlUVgxAM+1Yn0HIg1P7hY2OJTD7fp2Soa1u0QgAmkJmFFL9WmObNUTMwkWotxkeDdYmMcVhit/hh3LKkLbFfCuWRLb2q5QKLPHqiFWlx/ponc/3kJQiFQuMgYDkZ9kcUaRFfbP0qa3MhiVSM/ON0Adtnr6WW/SE+FXXXcng/ex/I0O+KdLfOQbZ7Sk5RbKGL+V2ZU6gDaF9lV/Z0t1645RU2nHergClM0vFy5zIimVxDtIDln7Uc4l+CZsa6rJ7VZ8py/1ywooIOQaRPD5liQ9eooVX+XTah2JSQ6PNMSGDfZp3U4V56pgLawjgLdGlXj50v0U63xXouPAFqbh1gPaOwALr9uBRkcR2pWwQHmH/0JdIdnmCdPGydnXq7CwdGfqQhkxOhbYjt8hOwq8JtNnP3QOojk5RHhMJiLU/4dgA70c7tTf0wdzSTfRM+jb+pyVpDhFIG+cTAB4fBHe9BR09Ka8RcbmStSh0AyuIcNogZWwBjGhAxZatkqNBD/gOtOebK/6K1ggaFX1eGGfZFVFvydCEnwBUWRih85CcY7lsm8Mrn4Brm2/JvFt0w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(39860400002)(346002)(136003)(46966006)(40470700004)(36840700001)(53546011)(7696005)(83380400001)(41300700001)(26005)(9686003)(336012)(86362001)(47076005)(186003)(356005)(81166007)(36860700001)(40460700003)(6506007)(82740400003)(8936002)(5660300002)(2906002)(40480700001)(8676002)(4326008)(70206006)(55016003)(70586007)(54906003)(33656002)(52536014)(316002)(478600001)(82310400005)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 07:10:43.4378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99eff9c6-e8a5-4d36-ecc5-08da8cb24021
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5898

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxLCAy
MDIyIDk6NTMgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJt
LmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ow0KPiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+Ow0KPiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMSA2
LzZdIHhlbjogcmV0cmlldmUgcmVzZXJ2ZWQgcGFnZXMgb24NCj4gcG9wdWxhdGVfcGh5c21hcA0K
PiANCj4gSGkgUGVubnksDQo+IA0KPiBPbiAzMS8wOC8yMDIyIDAzOjQwLCBQZW5ueSBaaGVuZyB3
cm90ZToNCj4gPiArLyoNCj4gPiArICogQWNxdWlyZSBhIHBhZ2UgZnJvbSByZXNlcnZlZCBwYWdl
IGxpc3QocmVzdl9wYWdlX2xpc3QpLCB3aGVuDQo+ID4gK3BvcHVsYXRpbmcNCj4gPiArICogbWVt
b3J5IGZvciBzdGF0aWMgZG9tYWluIG9uIHJ1bnRpbWUuDQo+ID4gKyAqLw0KPiA+ICttZm5fdCBh
Y3F1aXJlX3Jlc2VydmVkX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IG1lbWZs
YWdzKQ0KPiA+ICt7DQo+ID4gKyAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOw0KPiA+ICsNCj4g
PiArICAgIEFTU0VSVF9BTExPQ19DT05URVhUKCk7DQo+ID4gKw0KPiA+ICsgICAgLyogQWNxdWly
ZSBhIHBhZ2UgZnJvbSByZXNlcnZlZCBwYWdlIGxpc3QocmVzdl9wYWdlX2xpc3QpLiAqLw0KPiA+
ICsgICAgc3Bpbl9sb2NrKCZkLT5wYWdlX2FsbG9jX2xvY2spOw0KPiA+ICsgICAgcGFnZSA9IHBh
Z2VfbGlzdF9yZW1vdmVfaGVhZCgmZC0+cmVzdl9wYWdlX2xpc3QpOw0KPiA+ICsgICAgc3Bpbl91
bmxvY2soJmQtPnBhZ2VfYWxsb2NfbG9jayk7DQo+ID4gKyAgICBpZiAoIHVubGlrZWx5KCFwYWdl
KSApDQo+ID4gKyAgICAgICAgcmV0dXJuIElOVkFMSURfTUZOOw0KPiA+ICsNCj4gPiArICAgIGlm
ICggIXByZXBhcmVfc3RhdGljbWVtX3BhZ2VzKHBhZ2UsIDEsIG1lbWZsYWdzKSApDQo+ID4gKyAg
ICAgICAgZ290byBmYWlsOw0KPiA+ICsNCj4gPiArICAgIGlmICggYXNzaWduX2RvbXN0YXRpY19w
YWdlcyhkLCBwYWdlLCAxLCBtZW1mbGFncykgKQ0KPiA+ICsgICAgICAgIGdvdG8gZmFpbF9hc3Np
Z247DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIHBhZ2VfdG9fbWZuKHBhZ2UpOw0KPiA+ICsNCj4g
PiArIGZhaWxfYXNzaWduOg0KPiA+ICsgICAgdW5wcmVwYXJlX3N0YXRpY21lbV9wYWdlcyhwYWdl
LCAxLCBmYWxzZSk7DQo+IA0KPiBMb29raW5nIGF0IGFzc2lnbl9kb21zdGF0aWNfcGFnZXMoKS4g
SXQgd2lsbCBhbHJlYWR5IGNhbGwNCj4gdW5wcmVwYXJlX3N0YXRpY21lbV9wYWdlcygpIGluIG9u
ZSBvZiB0aGUgZXJyb3IgcGF0aC4gSXQgZG9lc24ndCBsb29rIGxpa2UNCj4gdGhlIGxhdHRlciBj
YW4gYmUgY2FsbGVkIHR3aWNlIG9uIGEgcGFnZS4NCj4gDQo+IFRvIGJlIGhvbmVzdCwgSSBmaW5k
IGEgYml0IG9kZCB0aGF0IGFzc2lnbl9kb21zdGF0aWNfcGFnZXMoKSBpcyBjYWxsaW5nDQo+IHVu
cHJlcGFyZV9zdGF0aWNtZW1fcGFnZXMoKSBiZWNhdXNlIHRoZSBmb3JtZXIgZG9lc24ndCBjYWxs
IHRoZSAicHJlcGFyZSINCj4gZnVuY3Rpb24uDQo+IA0KPiBBRkFJQ1QsIHRoaXMgaXMgYW4gaXNz
dWUgaW50cm9kdWNlZCBpbiB0aGlzIHBhdGNoLiBTbyBJIHdvdWxkIHJlbW92ZSB0aGUgY2FsbA0K
PiBmcm9tIGFzc2lnbl9kb21zdGF0aWNfcGFnZXMoKSBhbmQgdGhlbiBsZXQgdGhlIGNhbGxlciBj
YWxscw0KPiB1bnByZXBhcmVfc3RhdGljbWVtX3BhZ2VzKCkgKHRoaXMgd291bGQgbmVlZCB0byBi
ZSBhZGRlZCBpbg0KPiBhY3F1aXJlX2RvbXN0YXRpY19wYWdlcygpKS4NCj4gDQoNClRydWUsIHRy
dWUsIHRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0ISENCg0KPiBBbHNvLCBJIHRoaW5rIGl0IHdvdWxk
IGJlIGdvb2QgdG8gZXhwbGFpbiB3aHkgd2UgZG9uJ3QgbmVlZCB0byBzY3J1Yi4NCj4gU29tZXRo
aW5nIGxpa2U6DQo+IA0KPiAiVGhlIHBhZ2Ugd2FzIG5ldmVyIGFjY2Vzc2libGUgYnkgdGhlIGRv
bWFpbi4gU28gc2NydWJiaW5nIGNhbiBiZSBza2lwcGVkIi4NCj4gDQoNCk9rLCAgSSdsbCBhZGQg
aW4tY29kZSBjb21tZW50DQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

