Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7555F577E38
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 11:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369405.600806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMdb-00032w-VD; Mon, 18 Jul 2022 09:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369405.600806; Mon, 18 Jul 2022 09:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDMdb-0002zd-S4; Mon, 18 Jul 2022 09:01:59 +0000
Received: by outflank-mailman (input) for mailman id 369405;
 Mon, 18 Jul 2022 09:01:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cjvd=XX=citrix.com=prvs=191eee4bf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oDMdb-0002zX-1m
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 09:01:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4656c773-0678-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 11:01:57 +0200 (CEST)
Received: from mail-bn8nam04lp2040.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 05:01:44 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN8PR03MB5075.namprd03.prod.outlook.com (2603:10b6:408:df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Mon, 18 Jul
 2022 09:01:42 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 09:01:42 +0000
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
X-Inumbo-ID: 4656c773-0678-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658134917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VclLy3bulJ8Vpgv0hfnTQNnt18s/6nZGfYK2sRPooJQ=;
  b=cSruDnFXX9CqQq2j2nnMWroEWTzFjtn5lvmo6IXqIqe5Mp2KFcO1cXwd
   CYf+lYusj8buQcOlQ4AwFSqX9fR9wqfEvrQx/Jh3JcR6C6RfPuvZ2tJV2
   FdIrVvalowlTNfYJLGaqHt+2FSd8+bnTCCMBVBXqle3PME+KH/a8a4sFe
   E=;
X-IronPort-RemoteIP: 104.47.74.40
X-IronPort-MID: 75315889
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EROQ0q2F8T2bLK3/GfbD5eFwkn2cJEfYwER7XKvMYLTBsI5bp2cOy
 mtMDGHUb63cYzGmctt1Ot/jo0wDucODmNIxSlRqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQXNNwJcaDpOsfrc8Uw35pwehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6/R0N1w9H9YSw/l+LXtj1
 eEZKA0fbynW0opawJrjIgVtruIKCZG3eak56jRnxzyfCus6S5feRamM/cVfwDo7msFJG7DZe
 tYdbj1sKh/HZnWjOH9OUM54wLju2SW5L2UwRFG9/MLb50DJywN8yv71Ocf9cd2WX8RF2E2fo
 woq+kymX0pDaYzPmFJp9FqApe/rhTihab43V7Tj1sxoiwzI31ccXUh+uVyT5KPRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS4hyN0K3LywCXDGMNSnhGctNOnM05Xzsxz
 XeSgsjkQzdotdW9S2+Z97qShSO/P24SN2BqTTAAZRsI5Z/kuo5bs/7UZtNqEarwhNulHzj1m
 2yOtHJm2+1VitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5L2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:KxSVkaONZHGrpMBcTyj155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj4fZq8z+8S3WB1B9uftWbd2FdAQLsSjrcKoAeQYREWlNQtsp
 uIGpIWYLOQMbETt7eA3ODSKadF/DDoytHLuQ+IpE0dNT2CJpsQmjtRO0K+KAlbVQNGDZ02GN
 614ddGnSOpfTAyYt6gDncIcuDfr5mT/aiWFiIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7WQywPa1UXU85NK8eGRvudrNYipsIw4Oz/sggGnaMBIXKCDhik8pKWV5FMjgL
 D30mcdFvU2z0mUUnC+oBPr1QWl+i0p8WXexViRhmamidDlRRohYvAxzr5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqrEypunAv+NRjx0C3abFuJYO5kLZvsH+8SPw7bW3HAcEcYa
 BT5fjnlbxrmQjwVQGWgoFtqObcL0jbUC32A3TqgfblrwS+rEoJsnfw+/Zv4Uvo1KhNOKWstN
 60QJhApfVpcvI8S55bKaMoffaXY1a9Py4kdljiV2jaKA==
X-IronPort-AV: E=Sophos;i="5.92,280,1650945600"; 
   d="scan'208";a="75315889"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwY7egmsc/XfWTeN8Gt8SvaHn6PEGsOee3lLUxQs551/p/DnUFUYRfTV2RBP+N6vPlL6o6LCCpGPUkSqBZUj8XK3JjNKZB2sOnkp5r1/BAbl/r3owTiJRFnKt2Kni2DSL7fmTWXoXhCe85LoWzvJF6pR+AfIkNSLUUNRJUEeA4b7/nTarxJ2nYCNKPTsDQfBOo2SV2Md/UTUXZj09rYIIuJRQ3PYzez3+115WED/gnyModdKNHhJmgjQNHWLvg46QP1pKeBBN/rIdcnxgQDzKferQx8s4dmtQzzVAxkLmIK9eUfXrYAfi8jbGDHYIrtZVzCzcXrC1WHmkxEtcwjvWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VclLy3bulJ8Vpgv0hfnTQNnt18s/6nZGfYK2sRPooJQ=;
 b=F+eRdnK+60uF1vKedjp7zV3HX1z+HyF05RmVsyFpMMn9fskGpPfm+CH9FVUJ8sNXhi8jT35vq+9UVXepHf3DXpn1qbGXiIp75zmFFBG8ofgKO94Yxr8RfZ6wQV0HAzMH+zx9d/5LknGXzafxClOSvdkpNzhWXfW9/OKpl6YiAY6ZhSs5TGRQ5ZQCzs1Bkj481oG1UsQhepoZb1sOE7y0/WSmZOdhP3+OuqBs0hETtnmHyubisOY5ALtqWzd3hD+WAY6Gkbj8ew3mnULOzcKfl16TlDwwKn5xbY2wIVOCotEJCrO3FsPgnA1EYyYAkIuYIvInDl+PPgP7dccSydY3og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VclLy3bulJ8Vpgv0hfnTQNnt18s/6nZGfYK2sRPooJQ=;
 b=fZR/gVmol63MUcgvwswnTF52/jN2BWBUTZkl4kCIUQIgwTXWWaTuqgKkWQo8R2lLVI7JZRUUyK97hggldpaP5Qn5WQ0+FPOjbZS9SJoS0/rpS8v300tJ5RYmmtAr7VLAWjstaJw/0kWiSi6i4z25Jz/SEnTL8qdABDJgL1hl/gQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 18 Jul 2022 11:01:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: buhrow@nfbcal.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: xenstored socket backlog length
Message-ID: <YtUhcnVZnLKIelbn@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-ClientProxiedBy: MR2P264CA0044.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::32)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f481196-5266-46b7-e550-08da689c2266
X-MS-TrafficTypeDiagnostic: BN8PR03MB5075:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SGU2Df9Uozn4XIFHV4V6Hths0zauM5vZKM/4ss8eoLk2ao+HvDkuibAJmzFNS3BgiMCA+HaREMOKFFNiIA+9wkjwAjopPyIdbONAX8rP5ZDoVNYraTwgeuHQSTRDicNEUOnMTmZN/pWtHoRj9UqU/+TdCZx7A1+p/IuGpop1nOLvD+WR90MVxvJ1XxU7mNmE0QHp2YmsQW8jVr2KF6eWG/X2QvMOYT/aq4Y+8ntw0RXX2D/sVHvLxb1aCKl+ISPdSQSKEK7zx3v2rOF/lua5zjJ1Uua47DZaTEf7yWUueYaEmlOnLXTVeO9lbDhfCva8kieRwQjMc7JyDvgNuWpBUXzKJLNoO97MT0sLmxFH4xOcg6bYT2diGqeKW06unZufXAjFRXR1SHywwXtYMXUy6PJIBd+daIL0FNJ4us8XZY19UK7F2mhXyqYvK63IDapQYuWn43irHDNbgWpvO7b78K7nXk6Wyvruvyka9BAEgWvyWkDXx1mpDxhfsI/udDUAAc2aIeb7nFL/aMeE+PNzb4AkW79BicdEW1Wzu247Q7pjh/R/C/pdqqYvGdm8B/LjBPmTeFeReriYKe++t34kxwDJhxUUJ6UjFTEq2eoXjm0wLl1SztoE5Lwc/ptJYiU/YFYLxVJr+MFp5CnLN3YUjwNlb9C6bzA2NEo0b1bUJrGBc9/pIansDHZOOiVZ/US/b1bGX7z8BA24NM++EbEwScROaziTHrk6Rpy9xa+9Zn6p+sVJwVilkolNrQ3eK78lRV0isit00o1bl67yYhOxLAy8W02P2dyUch1pjRhou0QatduLdQpHkzz4zFA5/hvOlCHk6No0NTouIjLwjXcBwVfnlPplS1TOeQEuunGMoVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(396003)(376002)(136003)(366004)(39850400004)(346002)(9686003)(86362001)(6512007)(5660300002)(6486002)(8936002)(6506007)(41300700001)(2906002)(26005)(38100700002)(6666004)(478600001)(82960400001)(4744005)(186003)(33716001)(3480700007)(966005)(66556008)(316002)(66946007)(85182001)(8676002)(54906003)(6916009)(66476007)(4326008)(533714002)(158833001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzR1Q2loSityUkRXWWhwa1llM1REVy9ZYVpqTkxieGxRemh6TWgzbkw5a0pJ?=
 =?utf-8?B?MU1UR2ZRMno1b01yWEFGM1hERm1ncm9yeFBZVFFuSEVBZVRweVpCREVjY2Zm?=
 =?utf-8?B?amVZSHFoRU5HeThHdTVnajhzZmlXYlIwMnhVS01jTnlqRC9LaWR5dHRqaktQ?=
 =?utf-8?B?RkJTSFVqS0cxako3Z3YwWks0bko0dFlCV1VkRjNtZHlLVHpSRVA1cVhOcHY1?=
 =?utf-8?B?ZURISmVPejFGQVVkUmxSbHplSjZtN1J1aTYzWXh1VTB2R3FOSU4zZC9NM2hl?=
 =?utf-8?B?cDRxdFR2ZFZLUDlHbnRsVFFPdFlUUUFod0FQNzNIWHZtd3hvYXREK0hLY0Iy?=
 =?utf-8?B?dWgrM3FMZnNXNDBFRTVFOXIzMkdOY215QStnRE1tV0pJTzlFVEk2c0ZORnRS?=
 =?utf-8?B?VXJJS3JxL1QrN1ZiQkxUbzBqRC9QVENNblJJWVEyUGFQY1NWSHpkY2FERWhU?=
 =?utf-8?B?MU5meG9aZ0Rab25jbm5BYXFWcmtvR0pmWk1Sa0E5dnduK2o5ZTZMVXdieS9D?=
 =?utf-8?B?Q2dHNEZJWU5GeWEvWHdPcWI1SkpTK1Jmd3FSRVd3L0djbzd1Sng2bVNwMkg5?=
 =?utf-8?B?UjlmMERMeG1aQitUQzE4TkhBNmswY2liOVJNYWk1OVkxZG1aQlg4dncrek5X?=
 =?utf-8?B?Q1czYUp1ODh4aFV3QUN5dStaSmpCVUl2QXdrVVY2RHBmck53ZjBzVG0zT3Z5?=
 =?utf-8?B?cWczVVZrT1VVaVYrbmZwbjRtVi9Ia2xTeEo2S1JEbXErUURpSUtTZVRzVVE2?=
 =?utf-8?B?ZG4yU1A0Q01XaTJvZlVTeThFZ0JsZGEyc3UrTkJuVjEvay9XVXhUQTJOUmFp?=
 =?utf-8?B?Wk5vUVRzRnlaZUNGdFl0bGc3VVIxU2E2RVZjZ3poZHRHa2hSb05nQXFjREti?=
 =?utf-8?B?eDUyaHhkUktvMVZPWFhVLzBvLzdsTGoyMXdSaTVBMkJvRk0vOTBOVXNYWDZM?=
 =?utf-8?B?Z3luZzNFVnVrejhsZC9Da0dhWE5SSzh1TkR0SEhCTDJjZUtxbzFWVTUwOHJt?=
 =?utf-8?B?MWkzMDdGNkxjM3BHTUlHeUg0SnExaFlmcURvRDl2dEJjQmVrS1NZOUV5WVND?=
 =?utf-8?B?MFNMczJBU29FSFFEYXpXaHB5ZG5DMk52eEJpOVRUUkJpL2tXRTNrREpUaGR0?=
 =?utf-8?B?R2QzU2V6Tkh4NklMMFgyQ0t5RWI2K2dUV2p1NUZpMzdjUXVNODQvVHZUdmsz?=
 =?utf-8?B?WURzSUYrWXN1VDlTUlRaL3EwQXN4czM4R3VCSk11RUx3MDd1eHNBWVRyajls?=
 =?utf-8?B?WE9SWWRCQTFCNktzZGJqRnJJeis4U1dBS2x4Sks3QndvTnF6SG5wZW5EL3U2?=
 =?utf-8?B?eFhuUUp3eWlYd25VV29neG9LVXZ6amtFcHRnQ1ZhcHVXbi9CMWUxZEFYeFJr?=
 =?utf-8?B?OW1oWlg4MEliOHB2aUZHQTIwNDUwUXpSZTJGNloxUFQ4K3U1TFo3U1Z2Q1BB?=
 =?utf-8?B?RWdodjM1MC8xQ3k2b3orVldFRndFZklwL3VqYmM2R2VhZ2tVQUpkMWtkbVBn?=
 =?utf-8?B?MFZ0SVpwdXFhNGpNNDA3UTEvUGVsMUF0bzVwaUkrWnR4SVdOOFVZQmF4dDBw?=
 =?utf-8?B?MWgxM0dJSDVxMS82MC9URGZBNmo3bEE2UXcrWTZoUXpIZndoL2lwd0FsemRQ?=
 =?utf-8?B?UHRtVWNja3NsK29sNE93aDRXblg3OTlCSjNhS2srcVpZektWSnFSVFp6SmpE?=
 =?utf-8?B?UWs3VkYwK1FWNWp1M1VaYXlDZWViaUVxcWQ2dXpramFJNmV4dkFGUlkvSDEw?=
 =?utf-8?B?bFFrck0yUjNkZjZPMzZtaUNlSWh5RUdVdnVNZU5GMHl5dlBJQnJQL1V4dzNl?=
 =?utf-8?B?ZWZVb0o1NDRYZGo2NGsxVkZCTlp6b0NGbG52NUhUQncrRVpSZG5rbU1JYWha?=
 =?utf-8?B?c1ZET25tZ2s0VmhWVm9nU25HN0Z0RkM2d0dTdnYzenRjb09WdXg3YVNHaUky?=
 =?utf-8?B?NmRhWFo0cGVrTXBKd051cHFiL0REem1MWG5BK040MTFnVWZNdnN2ckxtMjNU?=
 =?utf-8?B?VzErbnJ4anpWUytzSnNkOFFRd0hpVkJuY0JqR0NZdUxrZTRrR21kUlgvVkZs?=
 =?utf-8?B?ZEh6REE1dzROd0I4Z3VGK1JHOW5wNGxhZjdxQml0N3JPeGZKc2REMTVheUVF?=
 =?utf-8?Q?mgzRiHcsnaWuO8r+zbvcKh2ux?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f481196-5266-46b7-e550-08da689c2266
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 09:01:42.8795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUYZzq5ZnOsJfCLvvB0rVms5HO9bp4yq/RQeWMOA5h9iqnK6q05PQlSnpL7uLp46+15JGtQVqGIy+0o/ZR1v2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5075

Hello,

It has been raised on the freebsd-xen mailing list [0] that the socket
queue length for the xenstored local domain socket is set to 1, which
can cause concurrent executions of xl commands to fail.

I see in xenstored implementation (xenstored_core.c init_sockets())
that the call to listen() is made setting a backlog length to 1, and
hence would like to ask if there's a reasoning for this, as I would
think having a slightly longer pending connections queue shouldn't be
an issue.

Was this value chosen based on a toolstack that has a central daemon
with a single connection to xenstored?

Thanks, Roger.

[0] https://lists.freebsd.org/archives/freebsd-xen/2022-July/000116.html

