Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA92393114
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 16:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133515.248832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHAM-0005Kj-0Z; Thu, 27 May 2021 14:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133515.248832; Thu, 27 May 2021 14:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmHAL-0005HX-Sx; Thu, 27 May 2021 14:39:17 +0000
Received: by outflank-mailman (input) for mailman id 133515;
 Thu, 27 May 2021 14:39:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pgLj=KW=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1lmHAK-0005HR-NC
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 14:39:16 +0000
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc27f675-8eed-4b78-a79d-85df67cc8ca1;
 Thu, 27 May 2021 14:39:15 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14REZINU091897;
 Thu, 27 May 2021 14:37:54 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 38pqfcmea7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 May 2021 14:37:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14REaAXE101211;
 Thu, 27 May 2021 14:37:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38pr0dn4mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 May 2021 14:37:54 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14REbrPF103775;
 Thu, 27 May 2021 14:37:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38pr0dn4mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 May 2021 14:37:53 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14REbqlO103757;
 Thu, 27 May 2021 14:37:52 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 38pr0dn4m2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 May 2021 14:37:52 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14REbffR028351;
 Thu, 27 May 2021 14:37:41 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 27 May 2021 14:37:40 +0000
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
X-Inumbo-ID: cc27f675-8eed-4b78-a79d-85df67cc8ca1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=2cWNSzPHxT4+TtO20cktydNM136a4XNJfF9qm2ldDgc=;
 b=COG/l0eFrIGy2v8yfYCjPo096ZmT871QOihIxtXKWxdX/gRd2i64dkO9nJR9mFsFcg8s
 3d+wIDdy60rKaLYivKQpZPfVzToBYwUnV9vAVW/pcIyHdLiAaVgsi9Tu2onm4ZFfp54w
 joeJwhrG6Fwb/1rf4pDvTdhkcGQ9RsDP692VcxB62fISCWEaAg3BMGUSqkN0ZnTHNiec
 UnOo8ZapdzcIPJFw5rBK/0kdw1QF/1LSdXdflbdWDpDM28s/pv52J23rsgzrFEPPFqHD
 7QxtJIdiBoTY9vGbkbOzZGabxFxQ4Yl2Kd0Oh+0S40V99J/6uxTA0OyyOm+am9CAIJcD Fg== 
Date: Thu, 27 May 2021 17:37:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Laight <David.Laight@ACULAB.COM>
Cc: "'Chen Huang'" <chenhuang5@huawei.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
        Joseph Qi <joseph.qi@linux.alibaba.com>,
        Nathan Lynch <nathanl@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [PATCH -next 2/3] xen: balloon: Replaced simple_strtoull() with
 kstrtoull()
Message-ID: <20210527143729.GL24442@kadam>
References: <20210526092020.554341-1-chenhuang5@huawei.com>
 <20210526092020.554341-2-chenhuang5@huawei.com>
 <0f03f9b9ff41460db2935e077f7f80c7@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f03f9b9ff41460db2935e077f7f80c7@AcuMS.aculab.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: xI1PN-Oc27c8aWvBSQ4m3wXmnwlPjzpN
X-Proofpoint-GUID: xI1PN-Oc27c8aWvBSQ4m3wXmnwlPjzpN
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9996 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105270095

On Thu, May 27, 2021 at 02:10:21PM +0000, David Laight wrote:
> From: Chen Huang
> > Sent: 26 May 2021 10:20
> > 
> > The simple_strtoull() function is deprecated in some situation, since
> > it does not check for the range overflow, use kstrtoull() instead.
> > 
> ...
> > -	target_bytes = simple_strtoull(buf, &endchar, 0) * 1024;
> > +	ret = kstrtoull(buf, 0, &target_bytes);
> > +	if (ret)
> > +		return ret;
> > +	target_bytes *= 1024;
> 
> I'd have thought it was more important to check *endchar
> than overflow.

That's one of the differences between simple_strtoull() and kstrtoull().
The simple_strtoull() will accept a string like "123ABC", but kstrtoull()
will only accept NUL terminated numbers or a newline followed by a NUL
terminator.  Which is fine in this context because users will be doing
"echo 1234 > /sys/foo".

> If you are worried about overflow you need a range check
> before the multiply.

This is probably a case where if the users cause an integer overflow
then they get what they deserve.

regards,
dan carpenter

