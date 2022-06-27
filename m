Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618D255B90C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 12:02:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356390.584588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lZK-0006VQ-Ft; Mon, 27 Jun 2022 10:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356390.584588; Mon, 27 Jun 2022 10:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lZK-0006SC-Cz; Mon, 27 Jun 2022 10:02:10 +0000
Received: by outflank-mailman (input) for mailman id 356390;
 Mon, 27 Jun 2022 10:02:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVBH=XC=citrix.com=prvs=1703a0240=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o5lZJ-0006S6-1B
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 10:02:09 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 332b9cd4-f600-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 12:02:07 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 06:02:02 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH7PR03MB6944.namprd03.prod.outlook.com (2603:10b6:510:15c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Mon, 27 Jun
 2022 10:01:58 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 10:01:58 +0000
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
X-Inumbo-ID: 332b9cd4-f600-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656324127;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=QMm6a+ZWHMbACvpbZ3CnMeYyEUVn93RrCOHCCjcVQKg=;
  b=Fg0sRg/q2Iw6TrjPehpYN5LUqwzXbG2n6hPeHZ3Pv+6rKgE/v/8Fl5XO
   ozrkkx/6kgJ+1TX1Wnzp/gnHZETqUa6Jf63cWyIQTJCu2AZaqNlwRYwfR
   2Dnj+NKG+JAfD6DmcXEt6kAfzwENEqxJqw4u/+fHwkQx7q1Odz4YstIGh
   M=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 77047693
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sbHizaAhsGSCdRVW/wHiw5YqxClBgxIJ4kV8jS/XYbTApDl0gmQFy
 GEXWT2OPffbYmT8Ld0jb9mz/ExS65bdy4BkQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Bj3dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhym
 ZJ1jqGZezszI7/dp9UcajlZKnBhaPguFL/veRBTsOS15mifKT7G5aUrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t7B8mcHs0m5vcBtNs0rtpJEvvEI
 dIQdBJkbQjaYg0JMVASYH47tLj33iWgLWwDwL6TjbAOuEvvz1E26YjOO8LYfdOhXt14u2/N8
 woq+Ey8WHn2Lue32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXO5vP//jEe9UtBeL
 kU8+ywyoKx0/0uuJvH+UgO5pjiYvxcac9tWD+A+rgqKz8L84QyUG2wFRT5pc8E9uYk9QjlC/
 kCNt8PkA3poqrL9YWqU67O8vT60fy8PIgc/iTQsSAIE55zpptE1hxeWFNJ7Svfq05vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:Wq/fhaAVmQr1IwjlHehKsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwOU80lKQFmLX5WI3PYOCIghrNEGgP1+vfKl7balDDH5BmpM
 BdmsFFYbWfbGSS5fyKmjVQeOxQpeVvnprY5ts3mBxWPHpXguxbnnBE4kHxKDwGeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8zOvcfCmp7KaQMPQ0dP0njGsRqYrJrBVzSI1BYXVD1ChZ8k7G
 j+igT8ooGuqeuyxBPw33Laq75WhNzi4N1eA9HksLliFhzcziKTIKhxUbyLuz445Mmp9VYRid
 HJ5ywtOsxigkmhDF2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtsgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4akWUmxjIbLH48JlO11Gh+e9
 MeTf00pcwmOm9yVkqp8lWGm7eXLzQO9hTveDlwhiXa6UkUoJlD9Tpm+CUupAZ9yHsDceg72w
 29CNUPqFhvdL5iUUsvPpZ0feKHTkrwfDnrDEW+ZXzaKYBvAQO8l3ew2sR82N2X
X-IronPort-AV: E=Sophos;i="5.92,226,1650945600"; 
   d="scan'208";a="77047693"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdZ9EUvKjJn0zGPEhjj5JkLybfSEC5dAZPi+fZAvmQDgxUviu6K7P3RdOR32SPClHcHOg4L73mZ0UwHMjcVYzdhwJvB9BDIDMQpFlyv+doVmZF4ma3CxmteqZCjVHf2bJIjKTsxtSUyn+0jDd30PofffUb82zZcriMTx6uLKDObARWbwXwhXA8eqt5s0qzJDhftUGZUlQr45C2ODJMN222V4t7afawig6tM+Rbyt/GwsaGhtAdOpMo0ussYzFM5+i+qhw8idd35oIx5rgVHTkjHYyfrvf5CTLmnBG3uzEY1ISlnnA/fT6EmsCvjCajKmQwwRPXKaJOfz3P28we4Xvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBuumvnaZMJyv/KTx3KCJxsfkE+oOmUhJW2T6CM4exE=;
 b=FPoZN8Lk/7lPXVe94Cu4SasB7vlRlYRy95L2W8GvDUhP1saGdikV2CBAC0hs/82hcvSjASxSy2871G/0DwH6gvhbRLBTP8XU8ynLVee8Va7Hjx6knt4MIAfwFUOjCIAg6tdyXDexI+gpeeG7b2vBRmFIrZM8Oc2xGV27HM0I5FSXCoOrpZCxTNBDui1syT4oQgFJdz25mfXDE39NX7BhW1/ONIzKNs3HqQp6ZZtwTGJHJ7+ktKDDNj8ndIIRTPUR5wQfhCf1ms/ZhCROrY2nwflwmItKz8KuI99UCKvjDzQ29mCVr4w7NynFG3mQp7yzVhOp9Dq6tm7bk7j+P/ziPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBuumvnaZMJyv/KTx3KCJxsfkE+oOmUhJW2T6CM4exE=;
 b=LpX6vjihjID4DIwa0LRPrE3SgD5yItHsWpmb2hYXLGlnVHUP2qCeNCNKeDKb9zmpIoWn21PZAkgLT5xEaBDJo/Qprx2yvL5HeH9kY5J1XLA+kP5pvsmvDhtZUZrT/uJcbfuHx/qEFDnifcdOZPXipkYvvKYuM3PJTSB0yuzsr1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH] x86/ept: fix shattering of special pages
Date: Mon, 27 Jun 2022 12:01:19 +0200
Message-Id: <20220627100119.55363-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d54df7e-aa56-4a86-864d-08da58241276
X-MS-TrafficTypeDiagnostic: PH7PR03MB6944:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iPYYJd/8Cno8J0lJS3zzROzrn5hTkTdh+zuMhrGiuw/5S3qrDVPAjZwLSNE7Pyaeo9aYIGk2deG37DOLTpfy8q2R8Sf21KUNhWOFb3qA5H3rPtUMo1N8nQWvrjWNmZmcDZQglQUOxgHirFTjIi68zhNFf8hlq3+LH3wqYJoBTRVEkywWftuK6mHSQLXK32wY5tTTg5VOHCs4K5Q4EYDlFYbY8l2Z4GmUZ8ANlVeb0GcjsIWh6Qp95KXAaNSyBWLXqEiKtMnVusPB+6efjayOhOUkQaFO5aXzIi3WB7nRmCjoLAjnrPLsdyblapn/bD9qXW/ITu+cBGnk3J1l+HPRiUUJ2IfTg90OUzVXFnBMUlwxW+iuUQF0zqsxfYvnGdh3uFDRUT9rJQYz6m/aqcN0LldK14ciqbeggy4Ca/2T2k9wm+BsRuqi/fF5UjohTRW0+afMR95NfO7REjtUl3mS49a2mX0UXbyuLy3Ii6wxiHz5guJ96GPS7qJj9YMEIeZ3dVtOfOlMouEuFUtQ/kWkzc3rTjnm80Ne59hndEySC10CW9exUJcFdjzlMhcAUGNGdm7XG7UkxEXuDZj4fupunH/a2wmX1xYLhq1eKA8PO2PtCVQiWxpNCoRZtcmkZJSB+zuXhkJi/OJVog7TlowWtY2dDohYjhKE9QK1fTF0r4VfWBx+gafyfnZJ+L50+Kb/7ppVbrC9Y650QvYIqnYrQ9eeXwmuaVSoGfbJ/HvTsCxkm/KM1NAjLu7wdcbSKy2T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(316002)(2906002)(6666004)(38100700002)(6506007)(66556008)(86362001)(8676002)(66476007)(82960400001)(66946007)(8936002)(83380400001)(5660300002)(41300700001)(26005)(1076003)(4326008)(6916009)(2616005)(6512007)(54906003)(478600001)(6486002)(186003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejJGdjUxZEVnYnVsVTkyUlZPdk9NYTd1MVRjQmpYNWt1MEtPR1hGWEl3aXBB?=
 =?utf-8?B?TmFGbk9PakdzdDYybW1UN3B3MEZDaUIrbGdFMWdiK210QmwwaFhlUUJHam9w?=
 =?utf-8?B?VlhBMGZmRXZpck9RNWFxOW5YdkhOLzY4L0picC9WMHprSjlsenNhZmJHbGVE?=
 =?utf-8?B?cko5eTNpN1MyUGJMQmc5amNnSy9ONk9xV25tMzFvSmV2VGhwbzIxT0RjNzdB?=
 =?utf-8?B?V2wrcG94M2owNUVmckljR2UvVGNsSWpJSFBnbTcvdlJ2ZjljYlVnNUJ6UlJX?=
 =?utf-8?B?TkN2K0FJMWNFVGxRc0JJd21zTHgzemtnVFV5QUtna1JNQ3VIaGxLMG9PU3g1?=
 =?utf-8?B?VFU3YlkwWVdLY0FuTm02K0lGMXBNYjdGQzVIRUxyMmFjZ3gzNHgvSjhZTEsr?=
 =?utf-8?B?N0loeHprWmFNY0J0ZzYvZzlWTTNBeTJweXFMbDJFeFV0WE95TXgvOEVyZVpp?=
 =?utf-8?B?ckRLL1RFWDhVaHJ1MkxKZkNQSS9hSXFvV2M5Q0IvK0RkaVFQb0pWVVpOTm1S?=
 =?utf-8?B?WWFBdWs4VCt1Tkk5cElhVWV1L3lRbDRIRlg1RzJBN2xGTjkya1ZrYm5OeHpq?=
 =?utf-8?B?UU5uR0R6QXdVSWl4TGVDd0VnTlF4ekxsa0x4S2d2WWRFazB5N3phZVdkeGpa?=
 =?utf-8?B?U283NjEzWUhGazZWOVQrUHBVSSsvcE01V2tOcDVlc0J3UWJRdVBKeGhtV0Qw?=
 =?utf-8?B?WldNcTJYUWExS21yV1pZZHE1OUhFOW9CSFEzQVZQOW8wWmtNcUkwSUlOZVpl?=
 =?utf-8?B?QWlhS0N5T0xhdm9kK1lDaHFMQW5oV2lGS0VGajdnczVBWVMwLzNRb1UrM0s3?=
 =?utf-8?B?VjBIcDFpY2lrblZxMW43L2w1MFZSbFgwMG9FbmFGZVEzMEpSZk1kbjhNWkFI?=
 =?utf-8?B?ZDhzTUdUQ3IxVjZQdE15L05YbWVPWXJvRmd2STFnb3QyOTZna3g3bXcvWHVh?=
 =?utf-8?B?ZW16ZHo1cUV2TkNFeUxNK280Wmtqd0ozMVpjZzlGV1FIaWs4Q3ZIMjVnVGU3?=
 =?utf-8?B?Tk1xSVZYVlhNVi9LSUtGQVVIdEplUi9oWTlja0NLTjVXRlJOZmVOcXNjR0to?=
 =?utf-8?B?WXRRNmsyWW5IdlNhRWV6WFU0V29iLzJmdjhQamxwWmo3VHNxS3VsSVBXVWR2?=
 =?utf-8?B?TEYzRDhxQ2NZNlFjODR2WmJYUkJqMXlPWHhiZVd1OUREaFcwYW5veFFuc0JU?=
 =?utf-8?B?RFhqMzhscjhzblpvYk5IVE1OUmk0aG5OWm1FTWNBWXYrQzdIVFhBNFRwaUls?=
 =?utf-8?B?aU1BUVhrZTJWOEl3MkNXR3Q0c1V4WlpkUDhMSzJDeUlob1FIdDJvajhxcm5l?=
 =?utf-8?B?bnpYLzlPY0lNSm53R1FEbW1pbVpBZmFhWThpVm9tN3Qyemp5SXl5VklHMGg2?=
 =?utf-8?B?a0tqRXRMb1VTWTBLWXRvYU1ZSTVPWFlsZm9xc3NCeGVDOUk4endIb1FSVUF5?=
 =?utf-8?B?VWJINTM4TmFISkgyRmt6S21Ea1l6ZVUwS2lLaTVXdVorNDFlc0JqWFltNkJp?=
 =?utf-8?B?QkJpSmtLbEQyTndPWFlzZTJmTzZkRVRyd1ZmMUJpaWU4RzNHNnpYZFpxYXVz?=
 =?utf-8?B?VytWOTdOQUR3aTJPcGdhclNoOElmZGFuUkVWZTdqaTV6cUlGTGR1KzkwNnZD?=
 =?utf-8?B?c1Fub2pyWWtvUDlabGlmcVg0RnNYek4rd1F6bWF5Nk03UmFRSWhiekFyV1Vw?=
 =?utf-8?B?bTBKM09Gb2F6SkFKd0NzQktSVUd5MkhVR3h4dXNrcG9CRXJhbWo1OStiT3FX?=
 =?utf-8?B?YlFtSmxmcXJYTHo2N0lETDJBRUx2M3ZnNzd0eHhqWDBieGF6Q243NHdJMGNW?=
 =?utf-8?B?TGxoZGV0b0dhZEpFd2hjVDVrWDEza25oUkRrOUhxTkQ5ZUtiK2s1VXF1Tjll?=
 =?utf-8?B?c3Z2UTJOcmZza0Fua3JwVTVxaXJKcENFWG56Y3h6UFlOS2ZhKzNXcEhSb0dQ?=
 =?utf-8?B?U3Z2enJTc2NadlJzN2xoUXRObDlTUmlDRHh3THk1VFpESmxVQ29UQlo5UmVs?=
 =?utf-8?B?aHpmc3ZrTHFRN2kwQ2hIWmZyTC8vaVcwWmozTTh5dFl3NTY1clZYVG4vYVZQ?=
 =?utf-8?B?UnpSb1NqblA1TXl6c1hLL1BvNmdvekpwZmdMeWZlUWVGTU5hbTNIUVB6c1Fz?=
 =?utf-8?Q?uw3IwYuLH8VxF5ZmYX7/yAz+C?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d54df7e-aa56-4a86-864d-08da58241276
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 10:01:58.0045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMdHItZe+jLeCChqDGLKkjpXhwwI6oZEi9hUOO9dCcJ3wVH0WClsY1dSFvRoTA3bJMlDK/BAjJ8XbQIteIOFbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6944

The current logic in epte_get_entry_emt() will split any page marked
as special with order greater than zero, without checking whether the
super page is all special.

Fix this by only splitting the page only if it's not all marked as
special, in order to prevent unneeded super page shuttering.

Fixes: ca24b2ffdb ('x86/hvm: set 'ipat' in EPT for special pages')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Paul Durrant <paul@xen.org>
---
It would seem weird to me to have a super page entry in EPT with
ranges marked as special and not the full page.  I guess it's better
to be safe, but I don't see an scenario where we could end up in that
situation.

I've been trying to find a clarification in the original patch
submission about how it's possible to have such super page EPT entry,
but haven't been able to find any justification.

Might be nice to expand the commit message as to why it's possible to
have such mixed super page entries that would need splitting.
---
 xen/arch/x86/mm/p2m-ept.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index b04ca6dbe8..b4919bad51 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -491,7 +491,7 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
 {
     int gmtrr_mtype, hmtrr_mtype;
     struct vcpu *v = current;
-    unsigned long i;
+    unsigned long i, special_pgs;
 
     *ipat = false;
 
@@ -525,15 +525,17 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
         return MTRR_TYPE_WRBACK;
     }
 
-    for ( i = 0; i < (1ul << order); i++ )
-    {
+    for ( special_pgs = i = 0; i < (1ul << order); i++ )
         if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
-        {
-            if ( order )
-                return -1;
-            *ipat = true;
-            return MTRR_TYPE_WRBACK;
-        }
+            special_pgs++;
+
+    if ( special_pgs )
+    {
+        if ( special_pgs != (1ul << order) )
+            return -1;
+
+        *ipat = true;
+        return MTRR_TYPE_WRBACK;
     }
 
     switch ( type )
-- 
2.36.1


